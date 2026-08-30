local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local localPlayer = Players.LocalPlayer

local settingsTable = {
    Enabled = false,
    ESP = false,
    Part = "HumanoidRootPart",
    Size = 10,
    Opacity = 0.5,
    HitboxColor = Color3.fromRGB(200, 100, 100)
}

local originalProperties = {}

local espFolder = Instance.new("Folder", game.CoreGui)
espFolder.Name = "HB_ESP"

local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "HitboxGUI"
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.fromOffset(230, 180)
mainFrame.Position = UDim2.fromScale(0.05, 0.35)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
mainFrame.BorderSizePixel = 0
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

local topBar = Instance.new("Frame", mainFrame)
topBar.Size = UDim2.new(1, 0, 0, 28)
topBar.BackgroundTransparency = 1
topBar.Active = true

local function makeDraggable(dragObject, targetObject)
    local dragging = false
    local dragInput, dragStart, startPos

    dragObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = targetObject.Position
        end
    end)

    dragObject.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            targetObject.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

makeDraggable(topBar, mainFrame)

local titleLabel = Instance.new("TextLabel", topBar)
titleLabel.Position = UDim2.fromOffset(8, 0)
titleLabel.Size = UDim2.new(1, -40, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Hitbox Expander"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextSize = 13
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

local statusLabel = Instance.new("TextLabel", mainFrame)
statusLabel.Position = UDim2.fromOffset(8, 30)
statusLabel.Size = UDim2.new(1, -16, 0, 18)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Ready to Run"
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.TextSize = 11
statusLabel.TextXAlignment = Enum.TextXAlignment.Left

local function setStatus(text)
    statusLabel.Text = text
end

local scrollingFrame = Instance.new("ScrollingFrame", mainFrame)
scrollingFrame.Position = UDim2.fromOffset(0, 52)
scrollingFrame.Size = UDim2.new(1, 0, 1, -56)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 4
scrollingFrame.BackgroundTransparency = 1

local uiListLayout = Instance.new("UIListLayout", scrollingFrame)
uiListLayout.Padding = UDim.new(0, 6)
uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 8)
end)

local function addButton(text, callback)
    local button = Instance.new("TextButton", scrollingFrame)
    button.Size = UDim2.new(0.9, 0, 0, 28)
    button.Text = text
    button.TextSize = 11
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    button.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)
    button.MouseButton1Click:Connect(callback)
end

local function addTextBox(placeholder, defaultVal, minVal, maxVal, callback)
    local textBox = Instance.new("TextBox", scrollingFrame)
    textBox.Size = UDim2.new(0.9, 0, 0, 28)
    textBox.Text = tostring(defaultVal)
    textBox.PlaceholderText = placeholder
    textBox.TextSize = 11
    textBox.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    textBox.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 8)

    textBox.FocusLost:Connect(function()
        local value = tonumber(textBox.Text)
        if value then
            value = math.clamp(value, minVal, maxVal)
            callback(value)
            textBox.Text = tostring(value)
        else
            textBox.Text = tostring(defaultVal)
        end
    end)
end

addTextBox("Hitbox Size (1-10000)", 10, 1, 10000, function(value)
    settingsTable.Size = value
end)

addTextBox("Opacity (0-1)", 0.5, 0, 1, function(value)
    settingsTable.Opacity = value
end)

RunService.RenderStepped:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Character then
            local targetPart = player.Character:FindFirstChild(settingsTable.Part)
            if targetPart then
                if originalProperties[player] then
                    if settingsTable.Enabled then
                        if not originalProperties[player].Size then
                            originalProperties[player] = {
                                Size = targetPart.Size,
                                Transparency = targetPart.Transparency,
                                Color = targetPart.Color,
                                Material = targetPart.Material,
                                CanCollide = targetPart.CanCollide
                            }
                        end
                        targetPart.Size = Vector3.new(settingsTable.Size, settingsTable.Size, settingsTable.Size)
                        targetPart.Transparency = settingsTable.Opacity
                        targetPart.Color = settingsTable.HitboxColor
                        targetPart.Material = Enum.Material.Neon
                        targetPart.CanCollide = false
                    else
                        local stored = originalProperties[player]
                        if stored and stored.Size then
                            targetPart.Size = stored.Size
                            targetPart.Transparency = stored.Transparency
                            targetPart.Color = stored.Color
                            targetPart.Material = stored.Material
                            targetPart.CanCollide = stored.CanCollide
                            originalProperties[player] = nil
                        end
                    end
                else
                    if settingsTable.Enabled then
                        originalProperties[player] = {
                            Size = targetPart.Size,
                            Transparency = targetPart.Transparency,
                            Color = targetPart.Color,
                            Material = targetPart.Material,
                            CanCollide = targetPart.CanCollide
                        }
                    end
                end
            end
        end
    end
end)

local function addESP(player)
    if player == localPlayer then return end
    if espFolder:FindFirstChild(player.Name) then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = player.Name
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = espFolder

    if player.Character then
        highlight.Adornee = player.Character
    end

    player.CharacterAdded:Connect(function(character)
        highlight.Adornee = character
    end)
end

local function removeESP(player)
    local highlight = espFolder:FindFirstChild(player.Name)
    if highlight then
        highlight:Destroy()
    end
end

local function updateESPState()
    for _, player in ipairs(Players:GetPlayers()) do
        if settingsTable.ESP then
            addESP(player)
        else
            removeESP(player)
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    if settingsTable.ESP then
        addESP(player)
    end
end)

Players.PlayerRemoving:Connect(removeESP)

addButton("Toggle Hitbox", function()
    settingsTable.Enabled = not settingsTable.Enabled
    setStatus(settingsTable.Enabled and "Hitbox On!" or "Hitbox Off!")
end)

addButton("Toggle ESP", function()
    settingsTable.ESP = not settingsTable.ESP
    updateESPState()
    setStatus(settingsTable.ESP and "ESP On!" or "ESP Off!")
end)

addButton("Unload GUI", function()
    screenGui:Destroy()
    espFolder:Destroy()
end)

local minimizeButton = Instance.new("TextButton", topBar)
minimizeButton.Size = UDim2.fromOffset(24, 24)
minimizeButton.Position = UDim2.new(1, -28, 0, 2)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.new(1, 1, 1)
minimizeButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instance.new("UICorner", minimizeButton).CornerRadius = UDim.new(0, 6)

local miniFrame = Instance.new("Frame", screenGui)
miniFrame.Size = UDim2.fromOffset(40, 40)
miniFrame.Position = mainFrame.Position
miniFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
miniFrame.Visible = false
Instance.new("UICorner", miniFrame).CornerRadius = UDim.new(1, 0)
makeDraggable(miniFrame, miniFrame)

local miniButton = Instance.new("TextButton", miniFrame)
miniButton.Size = UDim2.fromScale(1, 1)
miniButton.BackgroundTransparency = 1
miniButton.Text = "HB"
miniButton.TextColor3 = Color3.new(1, 1, 1)

minimizeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    miniFrame.Visible = true
end)

miniButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    miniFrame.Visible = false
end)

print("\xe2\x9c\x85 Hitbox GUI FINAL LOADED (ESP + MOBILE DRAG FIXED)")
