Redz Hub UI v5 new themes and fixs.

# redzlib V5 — UI Library Documentation

A feature-rich, highly customizable User Interface (UI) library for Roblox scripts, originally developed by **redz9999** and edited by **@rafaelqcc**.

---

## Table of Contents
1. [Features](#-features)
2. [Installation & Basic Usage](#-installation--basic-usage)
3. [Available Themes](#-available-themes)
4. [Window Management](#-window-management)
5. [Creating Tabs](#-creating-tabs)
6. [UI Elements](#-ui-elements)
   - [Buttons](#button)
   - [Toggles](#toggle)
   - [Sliders](#slider)
   - [Dropdowns](#dropdown)
   - [Inputs / TextBoxes](#input)
   - [Labels and Sections](#label--section)
7. [Flag & Configuration Management](#-flag--configuration-management)
8. [Icon System](#-icon-system)
9. [Events and Connections](#-events-and-connections)
10. [Full Script Example](#-full-script-example)

---

## Features

* **Auto-Save Configurations**: Automatically saves flag values and user preferences into local JSON files (`readfile`/`writefile`).
* **Modern Interface**: Clean visual layout with support for rounded corners, gradients, and borders.
* **Drag & Resize**: Native support for dragging the main window and dynamic input-based scaling.
* **Extensive Icon Library**: Integrated collection based on Lucide/Tarmac icons with fuzzy search support.
* **Dynamic Scaling (UIScale)**: Responsive interface scaling adapted to the viewport size.

---

## Installation & Basic Usage

To load the library into your script, fetch the source code via `loadstring` or inject the `redzlib` table directly into your environment.

```lua
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/rafaelqcc/Other-scripts/refs/heads/main/RedzHubUI/RedzHubUI.lua"))()
```

---

## Available Themes

The library features 5 pre-configured native themes:

| Theme Name | Description |
| :--- | :--- |
| `Darker` | Deep dark theme with Discord-blue accents (`#5865F2`). *(Default)* |
| `Dark` | Standard dark theme with light blue accents (`#4196FF`). |
| `Purple` | Dark theme with vibrant purple highlights (`#9600FF`). |
| `Green` | Forest dark theme with pure green accents (`#32CD32`). |
| `Orange` | Warm dark/wooden theme with vibrant orange highlights (`#FF8C00`). |

### Changing Themes via Code
```lua
-- Set active theme
redzlib:SetTheme("Green")

-- Get current active theme name
local currentTheme = redzlib:GetTheme()
```

---

## Window Management

To initialize the graphical interface, use the `MakeWindow` method.

```lua
local Window = redzlib:MakeWindow({
    Title = "My Hub | Roblox",
    SubTitle = "by : redz9999 & @rafaelqcc",
    SaveFolder = "MyHubConfig.json" -- File where flag states will be saved
})
```

### Window & Library Helper Methods
```lua
-- Scale the user interface proportionally
redzlib:SetScale(450)

-- Get current scale value
local scale = redzlib:GetScale()
```

### `Window:AddMinimizeButton`
Creates a floating, draggable button that toggles the window's minimized state when clicked.

```lua
local MinimizeBtn = Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://1234567890", -- Button icon ID
        Size = UDim2.fromOffset(40, 40)
    },
    Corner = {
        CornerRadius = UDim.new(0, 8)
    },
    Stroke = {
        Color = Color3.fromRGB(255, 255, 255),
        Thickness = 1.5
    }
})
```

Parameters

Accepts a Configs table with the following options:

| Property | Type | Description |
|---|---|---|
| Button | table | Properties applied directly to the ImageButton (e.g., Image, Size, Position, ImageColor3). |
| Corner | table (Optional) | Configuration for the button's UICorner element (e.g., CornerRadius). |
| Stroke | table (Optional) | Configuration for the button's UIStroke element (e.g., Color, Thickness). |

## `Window:Dialog(Configs)`

Creates a modal dialog window over the main window, with a title, message, and configurable action buttons.

### Parameters

| Parameter | Type | Description |
|---|---|---|
| `Configs` | table | Configuration for the dialog. Supports both array-style and named properties. |

### `Configs` Properties

| Property | Type | Default | Description |
|---|---|---|---|
| `[1]` / `Title` | string | `"Dialog"` | The title displayed at the top of the dialog. |
| `[2]` / `Text` | string | `"This is a Dialog"` | The message displayed inside the dialog. |
| `[3]` / `Options` | table | `{}` | List of buttons that will be added to the dialog. |

### Returns

| Type | Description |
|---|---|
| `table` | Returns a Dialog object containing the `Button` and `Close` methods. |

### `Dialog:Button(Configs)`

Adds an action button to the dialog.

| Property | Type | Default | Description |
|---|---|---|---|
| `[1]` / `Name` / `Title` | string | `""` | Text displayed on the button. |
| `[2]` / `Callback` | function | `function() end` | Function executed when the button is activated. |

The dialog automatically closes when the button is activated, before executing the callback.

### `Dialog:Close()`

Closes the dialog with an animation and removes it from the main window.

### Example

```lua
local Dialog = Window:Dialog({
    Title = "Confirmation",
    Text = "Are you sure you want to continue?",
    Options = {
        {
            Name = "Yes",
            Callback = function()
                print("Confirmed")
            end
        },
        {
            Name = "No",
            Callback = function()
                print("Cancelled")
            end
        }
    }
})
```

### Array-style configuration

The same dialog can also be created using positional properties:

```lua
local Dialog = Window:Dialog({
    "Confirmation",
    "Are you sure you want to continue?",
    {
        {
            "Yes",
            function()
                print("Confirmed")
            end
        },
        {
            "No",
            function()
                print("Cancelled")
            end
        }
    }
})
```

### Methods

| Method | Description |
|---|---|
| `Dialog:Button(Configs)` | Adds a button to the dialog. |
| `Dialog:Close()` | Closes and destroys the dialog. |

### Notes

- Only one dialog can be open at a time.
- If a dialog already exists, `Window:Dialog()` returns without creating another one.
- If the window is minimized, it is automatically restored before opening the dialog.
- Buttons are automatically resized based on the number of buttons in the dialog.

---

## Creating Tabs

All UI elements are organized inside tabs attached to the main window.

```lua
local Tab1 = Window:MakeTab({
    Name = "Main",
    Icon = "home" -- Icon name from the built-in icon set
})

local TabSettings = Window:MakeTab({
    Name = "Settings",
    Icon = "settings"
})
```

---

## UI Elements

### Button
Creates a simple clickable button to trigger functions.

```lua
Tab1:AddButton({
    Name = "Execute Action",
    Callback = function()
        print("Button clicked!")
    end
})
```

### Toggle
Creates an on/off toggle switch with automatic state saving via Flags.

```lua
Tab1:AddToggle({
    Name = "Auto Farm",
    Description = "Automatically farm resources",
    Default = false,
    Flag = "AutoFarmFlag",
    Callback = function(Value)
        print("Auto Farm status:", Value)
    end
})
```

### Slider
Creates a draggable slider bar for numeric ranges.

```lua
Tab1:AddSlider({
    Name = "Player WalkSpeed",
    Min = 16,
    Max = 200,
    Increase = 1,
    Default = 16,
    Flag = "WalkSpeedFlag",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})
```

### Dropdown
Creates a single-selection dropdown menu from a list of options.

```lua
local Dropdown = Tab1:AddDropdown({
    Name = "Select Difficulty",
    Options = {"Easy", "Medium", "Hard"},
    Default = "Easy",
    Flag = "DifficultyFlag",
    Callback = function(Option)
        print("Selected difficulty:", Option)
    end
})

-- Dynamically update dropdown options:
Dropdown:Set({"Easy", "Medium", "Hard", "Nightmare"})
```

### Input
Creates a text box input for user string entry.

```lua
Tab1:AddTextBox({
    Name = "Message",
    PlaceholderText = "Type your message here...",
    Default = "",
    Flag = "MessageInput",
    Callback = function(Text)
        print("Entered text:", Text)
    end
})
```


### Label & Section
Visual components used to organize text and group settings.

```lua
-- Add an informative label
Tab1:AddLabel({
    Name = "Important information about this tab"
})

-- Add a section header / divider
Tab1:AddSection({
    Name = "Advanced Settings"
})
```

## `Tab:AddDiscordInvite(Configs)`

Creates a Discord invite component inside the current tab. It displays a Discord invite code, logo, title, description, and a button that copies the invite to the clipboard.

### Parameters

| Parameter | Type | Description |
|---|---|---|
| `Configs` | table | Configuration for the Discord invite component. Supports both array-style and named properties. |

### `Configs` Properties

| Property | Type | Default | Description |
|---|---|---|---|
| `[1]` / `Name` / `Title` | string | `"Discord"` | The title displayed on the invite card. |
| `Desc` / `Description` | string | `""` | Description displayed below the title. |
| `[2]` / `Logo` | string | `""` | Image asset ID used as the Discord server logo. |
| `[3]` / `Invite` | string | `""` | Discord invite URL or code copied when the Join button is activated. |

### Returns

| Type | Description |
|---|---|
| `table` | Returns a `DiscordInvite` object containing methods for controlling the component. |

### `DiscordInvite:Destroy()`

Destroys the Discord invite component and removes it from the tab.

### `DiscordInvite:Visible(...)`

Changes the visibility of the Discord invite component.

The arguments are passed directly to the library's internal visibility function.

### Behavior

When the `Join` button is activated:

1. The configured `Invite` value is copied to the clipboard.
2. The button text changes to `"Copied to Clipboard"`.
3. The button becomes temporarily disabled through a click delay.
4. After 5 seconds, the button returns to its original `"Join"` state.

### Example

```lua
local DiscordInvite = Tab:AddDiscordInvite({
    Title = "My Discord Server",
    Description = "Join our community!",
    Logo = "rbxassetid://123456789",
    Invite = "https://discord.gg/example"
})
```

### Array-style configuration

The same component can be configured using positional properties:

```lua
local DiscordInvite = Tab:AddDiscordInvite({
    "My Discord Server",
    "rbxassetid://123456789",
    "https://discord.gg/example",
    Desc = "Join our community!"
})
```

### Methods

| Method | Description |
|---|---|
| `DiscordInvite:Destroy()` | Removes the Discord invite component. |
| `DiscordInvite:Visible(...)` | Changes the visibility of the component. |

### Notes

- The `Join` button uses clipboard function to copy the invite.
- The button has a 5-second delay before it can be activated again.
- The invite card automatically uses the current theme colors.
- The logo is displayed as a rounded image with a stroke.
  
---

## Flag & Configuration Management

The library maintains a global `redzlib.Flags` table storing the current values of all components assigned a `Flag` identifier.

```lua
-- Access a flag value directly
local isAutoFarmActive = redzlib.Flags["AutoFarmFlag"]

-- Updating flags triggers 'FlagsChanged' events and updates saved JSON config.
```

---

## Icon System

The built-in icon engine supports direct icon name lookups or partial matching.

```lua
-- Returns the RBXAssetID matching the given icon name
local iconId = redzlib:GetIcon("user")
local alertIcon = redzlib:GetIcon("alertcircle")
```

Commonly used icons:
* `home`, `settings`, `user`, `shoppingcart`, `bell`, `shield`, `swords`, `zap`, `lock`, `eye`, `file`, `folder`, `trash`, `edit`, `search`, etc.

---

## Events and Connections

The library provides a custom event listener framework via `redzlib.Connection`:

```lua
-- Event triggered whenever any Flag value changes
redzlib.Connection.FlagsChanged:Connect(function(FlagName, NewValue)
    print("Flag modified:", FlagName, "=", NewValue)
end)

-- Event triggered when UI theme is changed
redzlib.Connection.ThemeChanged:Connect(function(NewThemeName)
    print("New theme applied:", NewThemeName)
end)

-- Event triggered when settings file is saved to disk
redzlib.Connection.FileSaved:Connect(function(FileType, FileName, EncodedData)
    print("File saved successfully:", FileName)
end)
```

---

## Full Script Example

```lua
-- Load Library (Ensure you load the library source before executing)
local redzlib = redzlib -- or loadstring(game:HttpGet(...))()

-- Create Main Window
local Window = redzlib:MakeWindow({
    Title = "Redz Hub Example",
    SubTitle = "by redz9999 & @rafaelqcc",
    SaveFolder = "RedzHubConfig.json"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://10734966248", BackgroundTransparency = 1 },
    Corner = { CornerRadius = UDim.new(0, 8) },
})

-- Create Tabs
local MainTab = Window:MakeTab({ Name = "Main", Icon = "home" })
local SettingsTab = Window:MakeTab({ Name = "Settings", Icon = "settings" })

-- Main Tab Elements
MainTab:AddLabel({ Name = "Welcome to Redz Hub!" })

MainTab:AddToggle({
    Name = "Infinite Jump",
    Description = "Allows continuous jump in mid-air",
    Default = false,
    Flag = "InfiniteJump",
    Callback = function(State)
        _G.InfJump = State
    end
})

MainTab:AddButton({
    Name = "Dialog",
    Callback = function()
        local Dialog = Window:Dialog({
            Title = "Question",
            Text = "You Like this UI?",
            Options = {
               {"yes", function()
                    print("ok")
               end},
               {"maybe", function()
                   print("maybe")
               end},
               {"no", function()
                   print("no")
               end}
            }
         })
    end)
})  

MainTab:AddSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 250,
    Increase = 1,
    Default = 16,
    Flag = "WalkSpeed",
    Callback = function(Value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end
})

-- Settings Tab Elements
SettingsTab:AddDropdown({
    Name = "UI Theme",
    Options = {"Darker", "Dark", "Purple", "Green", "Orange"},
    Default = redzlib:GetTheme(),
    Callback = function(SelectedTheme)
        redzlib:SetTheme(SelectedTheme)
    end
})

print("RedzLib initialized successfully!")
```
