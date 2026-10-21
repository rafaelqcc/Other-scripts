--[[
  qccjson.lua — JSON encoder/decoder for Lua.

  MIT License

  Copyright (c) 2026 rafaelqcc

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
  
  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.
  
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.

  API:
    json.stringify(value, replacer, space, print_address) -> string (with formatting)
    json.encode(value, replacer, print_address)           -> string (always compact)
    json.parse(str, without_null)                         -> value
    json.decode(...)                                     <- json.parse alias
    json.null                                             -> sentinel
--]]

local json = { _VERSION = "1.1" }

-- ---------------------------------------------------------------------------
-- Sentinel for `null` values in JSON
-- ---------------------------------------------------------------------------

local null = setmetatable({}, {
  __tostring = function() return "null" end,
  __name = "json.null",
})

-- ---------------------------------------------------------------------------
-- Local Helpers
-- ---------------------------------------------------------------------------

local type = type
local tostring = tostring
local tonumber = tonumber
local sub = string.sub
local byte = string.byte
local gsub = string.gsub
local concat = table.concat

-- ---------------------------------------------------------------------------
-- Output format (serialization)
-- ---------------------------------------------------------------------------

local ESCAPES = {
  ['"']  = '\\"',
  ['\\'] = '\\\\',
  ['/']  = '\\/',
  ['\b'] = '\\b',
  ['\f'] = '\\f',
  ['\n'] = '\\n',
  ['\r'] = '\\r',
  ['\t'] = '\\t',
  ['\a'] = '\\u0007',
  ['\v'] = '\\u000b',
}

--[[
Escapes EVERYTHING that RFC 8259 prohibits from appearing raw in strings: 
quotation marks, backslash, U+0000-U+001F controls (the "famous" ones get short form, the rest become \u00XX).
]]

local ESCAPE_PATTERN = '[%c"\\/%z]' -- controls (%c), " \\ and / + zero byte (%z, for 5.1)

local function escape(s)
  return (gsub(s, ESCAPE_PATTERN, function(c)
    return ESCAPES[c] or string.format("\\u%04x", byte(c))
  end))
end

--[[
Classifies a value the way JSON sees it.
Tables with contiguous indices 1..N become "array"; anything else, "table".
]]
local function kind_of(value)
  local t = type(value)
  if t ~= "table" then return t end
  if value == null then return "nil" end

  local n = #value
  local count = 0
  for k in pairs(value) do
    count = count + 1
    if not (type(k) == "number" and k == math.floor(k) and 1 <= k and k <= n) then
      return "table"
    end
  end

  if count == 0 or count ~= n then return "table" end
  return "array"
end

-- ---------------------------------------------------------------------------

local function encode_number(out, v)
  if v ~= v or v == math.huge or v == -math.huge then
    error("Can't encode number: " .. tostring(v) .. " (inf/nan is not valid JSON).", 0)
  end
  out[#out + 1] = tostring(v)
end

local encode_value

local function encode_key(out, key, opts)
  local kind = kind_of(key)

  if kind == "string" then
    out[#out + 1] = '"' .. escape(key) .. '"'
  elseif kind == "number" then
    if key ~= key or key == math.huge or key == -math.huge then
      error("Can't encode number: " .. tostring(key) .. " (inf/nan is not valid JSON).", 0)
    end
    out[#out + 1] = '"' .. tostring(key) .. '"'
  elseif opts.print_address then
    out[#out + 1] = tostring(key)
  elseif kind == "table" or kind == "array" then
    error("Can't encode " .. kind .. " as key.", 0)
  else
    error("Unjsonifiable type: " .. kind .. ".", 0)
  end
end

local function encode_array(out, arr, replacer, indent, space, depth, opts)
  out[#out + 1] = "["

  local breakline = space > 0 and "\n" or ""
  local pad = space > 0 and string.rep(" ", indent) or ""

  local first = true
  for i, v in ipairs(arr) do
    if replacer then v = replacer(i, v) end

    out[#out + 1] = (first and "" or ",") .. breakline .. pad
    encode_value(out, v, replacer, indent + space, space, depth, opts)
    first = false
  end

  if not first then
    out[#out + 1] = breakline .. string.rep(" ", indent - space)
  end

  out[#out + 1] = "]"
end

local function encode_object(out, obj, replacer, indent, space, depth, opts)
  out[#out + 1] = "{"

  local breakline = space > 0 and "\n" or ""
  local pad = space > 0 and string.rep(" ", indent) or ""
  local sep = space > 0 and ": " or ":"
  local count = 0

  for k, v in pairs(obj) do
    if replacer then v = replacer(k, v) end

    if v ~= nil then
      out[#out + 1] = (count == 0 and "" or ",") .. breakline .. pad
      encode_key(out, k, opts)
      out[#out + 1] = sep
      encode_value(out, v, replacer, indent + space, space, depth, opts)
      count = count + 1
    end
  end

  if count > 0 then
    out[#out + 1] = breakline .. string.rep(" ", indent - space)
  end

  out[#out + 1] = "}"
end

encode_value = function(out, value, replacer, indent, space, depth, opts)
  if depth > opts.max_depth then
    error("Reach max depth: " .. tostring(opts.max_depth), 0)
  end

  local kind = kind_of(value)

  if kind == "nil" then
    out[#out + 1] = "null"
  elseif kind == "boolean" then
    out[#out + 1] = tostring(value)
  elseif kind == "number" then
    encode_number(out, value)
  elseif kind == "string" then
    out[#out + 1] = '"' .. escape(value) .. '"'
  elseif kind == "array" then
    encode_array(out, value, replacer, indent, space, depth + 1, opts)
  elseif kind == "table" then
    encode_object(out, value, replacer, indent, space, depth + 1, opts)
  elseif opts.print_address then
    out[#out + 1] = tostring(value)
  else
    error("Unjsonifiable type: " .. kind, 0)
  end
end

-- Common serialization body (used by stringify and encode).
local function encode_text(value, replacer, space, print_address)
  if type(space) ~= "number" then space = 0 end

  local out = {}
  encode_value(out, value, replacer, space, space, 1, {
    max_depth = 100,
    print_address = print_address,
  })

  return concat(out)
end

function json.stringify(value, replacer, space, print_address)
  -- Formattable version: space > 0 enables pretty-print
  return encode_text(value, replacer, space, print_address)
end

--[[
Always compact version: same as stringify(..., 0, ...).
The `space` character passed is intentionally ignored.
]]
function json.encode(value, replacer, print_address)
  return encode_text(value, replacer, 0, print_address)
end

-- ---------------------------------------------------------------------------
-- Input format (syntactic analysis)
-- ---------------------------------------------------------------------------

local skip_space, fail, decode_value -- forward declarations

local function skip_space(s, p)
  while true do
    local b = byte(s, p)
    if b == 9 or b == 10 or b == 13 or b == 32 then
      p = p + 1
    else
      return p
    end
  end
end

local function is_digit(b) return b ~= nil and b >= 48 and b <= 57 end

local function fail(s, p)
  error("Invalid json syntax starting at position " .. p .. ": " .. sub(s, p, p + 10), 0)
end

local UNESCAPES = {
  [98]  = "\b",   -- \b
  [102] = "\f",   -- \f
  [110] = "\n",   -- \n
  [114] = "\r",   -- \r
  [116] = "\t",   -- \t
  [34]  = '"',    -- \"
  [92]  = "\\",   -- \\
  [47]  = "/",    -- \/
}

-- Converts a code point to UTF-8 without relying on the utf8 library.
local function utf8_encode(cp)
  if cp < 0x80 then
    return string.char(cp)
  elseif cp < 0x800 then
    return string.char(0xC0 + math.floor(cp / 64), 0x80 + cp % 64)
  elseif cp < 0x10000 then
    return string.char(0xE0 + math.floor(cp / 4096), 0x80 + math.floor(cp / 64) % 64, 0x80 + cp % 64)
  else
    return string.char(0xF0 + math.floor(cp / 262144), 0x80 + math.floor(cp / 4096) % 64,
                       0x80 + math.floor(cp / 64) % 64, 0x80 + cp % 64)
  end
end

local function read_hex(s, p)
  local hex = sub(s, p, p + 3)
  if not hex:match("^%x%x%x%x$") then fail(s, p - 1) end
  return tonumber(hex, 16), p + 4
end

-- Reads a JSON string starting from `p` (which should point to the opening quotation mark).
local function decode_string(s, p)
  p = p + 1
  local buf = {}
  local seg = p

  while p <= #s do
    local b = byte(s, p)

    if b == 34 then -- "
      if p > seg then buf[#buf + 1] = sub(s, seg, p - 1) end
      return concat(buf), p + 1

    elseif b == 92 then -- backslash
      if p > seg then buf[#buf + 1] = sub(s, seg, p - 1) end

      local e = byte(s, p + 1)
      if not e then fail(s, p) end

      if e == 117 then -- \u
        local cp, after = read_hex(s, p + 2)

        -- UTF-16 substitute pairs
        if cp >= 0xD800 and cp <= 0xDBFF then
          if sub(s, after, after + 1) == "\\u" then
            local lo, lo_after = read_hex(s, after + 2)
            if lo >= 0xDC00 and lo <= 0xDFFF then
              cp = 0x10000 + (cp - 0xD800) * 0x400 + (lo - 0xDC00)
              after = lo_after
            end
          end
        end

        if cp >= 0xD800 and cp <= 0xDFFF then cp = 0xFFFD end -- loose substitute
        buf[#buf + 1] = utf8_encode(cp)
        p = after
        seg = p

      else
        local c = UNESCAPES[e]
        if not c then fail(s, p) end
        buf[#buf + 1] = c
        p = p + 2
        seg = p
      end

    else
      if b < 32 then fail(s, p) end -- raw control characters: prohibited by the RFC
      p = p + 1
    end
  end

  fail(s, p)
end

local function read_number(s, p)
  local q = p
  local b = byte(s, q)

  if b == 45 then -- -
    q = q + 1
    b = byte(s, q)
  end

  if not is_digit(b) then fail(s, p) end -- Required digit
  if b == 48 and is_digit(byte(s, q + 1)) then
    fail(s, p) -- Leading zero: prohibited by the RFC
  end

  q = q + 1
  while is_digit(byte(s, q)) do q = q + 1 end

  b = byte(s, q)
  if b == 46 then -- .
    if not is_digit(byte(s, q + 1)) then fail(s, p) end
    q = q + 2
    while is_digit(byte(s, q)) do q = q + 1 end
    b = byte(s, q)
  end

  if b == 101 or b == 69 then -- e / E
    q = q + 1
    local sign = byte(s, q)
    if sign == 43 or sign == 45 then q = q + 1 end
    if not is_digit(byte(s, q)) then fail(s, p) end
    q = q + 1
    while is_digit(byte(s, q)) do q = q + 1 end
  end

  return tonumber(sub(s, p, q - 1)), q
end

local function decode_object(s, p, opts)
  p = p + 1 -- consume the "{"

  local obj = {}
  p = skip_space(s, p)
  if byte(s, p) == 125 then return obj, p + 1 end -- }

  while true do
    p = skip_space(s, p)
    if byte(s, p) ~= 34 then fail(s, p) end

    local key
    key, p = decode_string(s, p)

    p = skip_space(s, p)
    if byte(s, p) ~= 58 then fail(s, p) end -- :

    p = skip_space(s, p + 1)
    obj[key], p = decode_value(s, p, opts)

    p = skip_space(s, p)
    local b = byte(s, p)

    if b == 125 then return obj, p + 1 -- }
    elseif b == 44 then p = p + 1      -- ,
    else fail(s, p) end
  end
end

local function decode_array(s, p, opts)
  p = p + 1 -- consume the "["

  local arr = {}
  local i = 1
  p = skip_space(s, p)
  if byte(s, p) == 93 then return arr, p + 1 end -- ]

  while true do
    arr[i], p = decode_value(s, p, opts)
    i = i + 1

    p = skip_space(s, p)
    local b = byte(s, p)

    if b == 93 then return arr, p + 1 -- ]
    elseif b == 44 then p = p + 1     -- ,
    else fail(s, p) end
  end
end

decode_value = function(s, p, opts)
  p = skip_space(s, p)
  local b = byte(s, p)

  if not b then error("Reached unexpected end of input", 0) end

  if b == 123 then return decode_object(s, p, opts) end   -- {
  if b == 91 then return decode_array(s, p, opts) end     -- [
  if b == 34 then return decode_string(s, p) end          -- "

  if b == 116 or b == 102 or b == 110 then                -- t / f / n
    local word = sub(s, p, p + 3)
    if word == "true" then return true, p + 4 end
    if word == "null" then return null, p + 4 end
    if word == "fals" and byte(s, p + 4) == 101 then return false, p + 5 end
    fail(s, p)
  end

  if b == 45 or (b >= 48 and b <= 57) then                -- - or digit
    return read_number(s, p)
  end

  fail(s, p)
end

--[[
U+FEFF (BOM): §8.1 allows parsers to ignore it.
(decimal escapes for compatibility with Lua 5.1, which does not have \xXX)
]]
local BOM = "\239\187\191"

function json.parse(s, without_null)
  if type(s) ~= "string" then error("str should be a string", 2) end

  local v, p = decode_value(s, sub(s, 1, 3) == BOM and 4 or 1, { without_null = without_null })

  p = skip_space(s, p)
  if p <= #s then fail(s, p) end

  if without_null and v == null then v = nil end
  return v
end

json.null = null

-- alias
json.decode = json.parse

return json
