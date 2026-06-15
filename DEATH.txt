local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Locate the right hand part (may vary depending on the rig)
local rightHand = character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm") or character:FindFirstChild("RightUpperArm")

if rightHand then
    -- Function to create a new ParticleEmitter with specific settings
    local function createParticleEmitter(parent)
        local particleEmitter = Instance.new("ParticleEmitter")
        particleEmitter.Color = ColorSequence.new(Color3.fromRGB(170, 0, 255)) -- Bright purple
        particleEmitter.Size = NumberSequence.new(0.6) -- Slightly larger particles
        particleEmitter.Texture = "rbxassetid://242968390" -- Optional texture for particles
        particleEmitter.Rate = 75 -- High particle rate for intensity
        particleEmitter.Lifetime = NumberRange.new(0.4, 0.8) -- Duration of each particle
        particleEmitter.Speed = NumberRange.new(4, 8) -- Faster particles for dynamic effect
        particleEmitter.LightEmission = 1 -- Make particles glow
        particleEmitter.Parent = parent
        return particleEmitter
    end

    -- Function to create a new PointLight with specific settings
    local function createPointLight(parent)
        local pointLight = Instance.new("PointLight")
        pointLight.Color = Color3.fromRGB(170, 0, 255) -- Bright purple
        pointLight.Range = 12 -- Larger light radius
        pointLight.Brightness = 3 -- Increased intensity
        pointLight.Parent = parent
        return pointLight
    end

    -- Create multiple ParticleEmitters and PointLights
    for i = 1, 3 do
        createParticleEmitter(rightHand)
        createPointLight(rightHand)
    end
else
    warn("Right hand part not found.")
end

local ModelDeath = game:GetObjects("rbxassetid://12195574482")[1]
if ModelDeath then
    for i,a in pairs(ModelDeath.Torso:GetDescendants()) do
        if a.Name == "Attachment4" or a.Name == "Flare" or a.Name == "Star3" or a.Name == "Bits" then
            a:Destroy() 
        end
    end
    for i,a in pairs(ModelDeath.Torso:GetChildren()) do
        if a.ClassName == "Attachment" and a:FindFirstChildWhichIsA("ParticleEmitter") then
            a:Clone().Parent = game.Players.LocalPlayer.Character.Torso
        end
    end
    ModelDeath:Destroy()
end

-- Get the local player and their character
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Function to make the character, including hair and accessories, fully black and apply a red outline
local function makeCharacterCompletelyBlack()
    for _, descendant in pairs(character:GetDescendants()) do
        if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
            descendant.Color = Color3.new(0, 0, 0) -- Make all body parts black
            descendant.Material = Enum.Material.SmoothPlastic
        elseif descendant:IsA("Accessory") then
            if descendant:FindFirstChild("Handle") then
                -- Turn the handle of the accessory black
                descendant.Handle.Color = Color3.new(0, 0, 0)
                descendant.Handle.Material = Enum.Material.SmoothPlastic

                -- Check for meshes or textures in the accessory's handle
                for _, child in pairs(descendant.Handle:GetDescendants()) do
                    if child:IsA("MeshPart") or child:IsA("Part") or child:IsA("UnionOperation") then
                        child.Color = Color3.new(0, 0, 0)
                        child.Material = Enum.Material.SmoothPlastic
                    elseif child:IsA("SpecialMesh") then
                        child.TextureId = "" -- Remove texture for a uniform color
                    end
                end
            end
        elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
            descendant:Destroy() -- Remove decals and textures
        elseif descendant:IsA("Clothing") or descendant:IsA("ShirtGraphic") then
            descendant:Destroy() -- Remove clothing to keep the body fully black
        end
    end

    -- Add a red outline effect to the character
    local outlineEffect = Instance.new("Highlight")
    outlineEffect.Parent = character
    outlineEffect.OutlineColor = Color3.new(1, 0, 0) -- Red outline
    outlineEffect.FillColor = Color3.new(0, 0, 0) -- Black fill
    outlineEffect.FillTransparency = 1 -- Only show the outline
end

-- Execute the function
makeCharacterCompletelyBlack()

-- Create ScreenGui and "1" button
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Create the "1" button with black background and white text
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 75, 0, 75)
button.Position = UDim2.new(0.5, -37.5, 0.5, -37.5) -- Center of the screen
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
button.TextColor3 = Color3.new(1, 1, 1) -- White text color
button.Text = "1"
button.Font = Enum.Font.SourceSans
button.TextScaled = true
button.Parent = screenGui

-- Load animation
local animationId = "rbxassetid://16102413143"
local animation = Instance.new("Animation")
animation.AnimationId = animationId
local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animationTrack = humanoid:LoadAnimation(animation)

-- Slap Aura Variables and Setup
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local slapDistance = 30
local slapCooldown = 0.585
local lastSlapTime = 0
local slapEnabled = false -- Start with slap aura disabled
local selectedRemote = "PlagueHit" -- Use PlagueHit remote

-- Function to slap closest player
local function slapClosestPlayer()
    if not slapEnabled then return end

    local closestPlayer = nil
    local closestDistance = slapDistance

    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local playerPosition = player.Character.HumanoidRootPart.Position

        for _, otherPlayer in pairs(Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local otherPlayerPosition = otherPlayer.Character.HumanoidRootPart.Position
                local distance = (playerPosition - otherPlayerPosition).Magnitude

                if distance <= closestDistance then
                    closestDistance = distance
                    closestPlayer = otherPlayer
                end
            end
        end

        if closestPlayer and tick() - lastSlapTime >= slapCooldown then
            lastSlapTime = tick()
            if closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
                local head = closestPlayer.Character.Head
                local args = {head}
                local remote = ReplicatedStorage:FindFirstChild(selectedRemote)
                if remote then
                    remote:FireServer(unpack(args))
                else
                    warn("Remote not found:", selectedRemote)
                end
            end
        end
    end
end

-- Function to handle button click
local function onButtonClick()
    -- Execute the remote 3 times
    local args = { [1] = "ScytheWeapon" }
    for i = 1, 3 do
        game:GetService("ReplicatedStorage").Scythe:FireServer(unpack(args))
    end

    -- Play the animation
    animationTrack:Play()

    -- Enable slap aura for 0.4 seconds
    slapEnabled = true
    task.delay(0.4, function()
        slapEnabled = false -- Disable slap aura after 0.4 seconds
    end)
end

-- Connect button click to the function
button.MouseButton1Click:Connect(onButtonClick)

-- Continuously check for closest player if slap aura is enabled
RunService.RenderStepped:Connect(function()
    if slapEnabled then
        slapClosestPlayer()
    end
end)


local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 50, 0, 50)
button.Position = UDim2.new(0.7, -37.5, 0.6, -37.5)
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.BackgroundColor3 = Color3.new(0, 0, 0)
button.TextColor3 = Color3.new(1, 1, 1)
button.Text = "2"
button.Font = Enum.Font.SourceSans
button.TextScaled = true
button.Parent = screenGui

local animationId = "rbxassetid://16102535685"
local animation = Instance.new("Animation")
animation.AnimationId = animationId
local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animationTrack = humanoid:LoadAnimation(animation)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local slapDistance = 30
local slapCooldown = 0.585
local lastSlapTime = 0
local slapEnabled = false
local selectedRemote = "PlagueHit"

local function slapClosestPlayer()
    if not slapEnabled then return end

    local closestPlayer = nil
    local closestDistance = slapDistance

    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local playerPosition = player.Character.HumanoidRootPart.Position

        for _, otherPlayer in pairs(Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local otherPlayerPosition = otherPlayer.Character.HumanoidRootPart.Position
                local distance = (playerPosition - otherPlayerPosition).Magnitude

                if distance <= closestDistance then
                    closestDistance = distance
                    closestPlayer = otherPlayer
                end
            end
        end

        if closestPlayer and tick() - lastSlapTime >= slapCooldown then
            lastSlapTime = tick()
            if closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
                local head = closestPlayer.Character.Head
                local args = {head}
                local remote = ReplicatedStorage:FindFirstChild(selectedRemote)
                if remote then
                    remote:FireServer(unpack(args))
                else
                    warn("Remote not found:", selectedRemote)
                end
            end
        end
    end
end

local function onButtonClick()
    animationTrack:Play()

    local args = { [1] = "ScytheWeapon" }
    for i = 1, 5 do
        game:GetService("ReplicatedStorage").Scythe:FireServer(unpack(args))
    end

    task.wait(0.2)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -20)
    end

    task.wait(0.2)
    slapEnabled = true
    task.delay(0.3, function()
        slapEnabled = false
    end)
end

button.MouseButton1Click:Connect(onButtonClick)

RunService.RenderStepped:Connect(function()
    if slapEnabled then
        slapClosestPlayer()
    end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 50, 0, 50)
button.Position = UDim2.new(0.6, -75, 0.5, -28)
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.BackgroundColor3 = Color3.new(0, 0, 0)
button.Text = "3"
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 24
button.Parent = screenGui

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://16144846625"
local animationTrack = humanoid:LoadAnimation(animation)

button.MouseButton1Click:Connect(function()
    animationTrack:Play()
    task.wait(0.2)
    
    local args = {
        [1] = "Bomb"
    }
    game:GetService("ReplicatedStorage").RetroAbility:FireServer(unpack(args))
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 30
    end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(0.9, -75, 0.5, 25)
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.BackgroundColor3 = Color3.new(0, 0, 0)
button.Text = "4"
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 24
button.Parent = screenGui

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

button.MouseButton1Click:Connect(function()
    humanoid.JumpPower = 130
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    
    wait(0.3)
    
    local args = {
        [1] = "fullcharged"
    }
    game:GetService("ReplicatedStorage").slapstick:FireServer(unpack(args))
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(0.5, -75, 0.5, 0)
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.BackgroundColor3 = Color3.new(0, 0, 0)
button.Text = "5"
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 24
button.Parent = screenGui

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://16144830595"
local animationTrack = humanoid:LoadAnimation(animation)

button.MouseButton1Click:Connect(function()
    animationTrack:Play()

    local args = {
        [1] = "Bomb"
    }
    game:GetService("ReplicatedStorage").RetroAbility:FireServer(unpack(args))

    local flash = Instance.new("Frame")
    flash.Size = UDim2.new(1, 0, 1, 0)
    flash.Position = UDim2.new(0, 0, 0, 0)
    flash.BackgroundColor3 = Color3.new(1, 1, 1)
    flash.ZIndex = 10
    flash.Parent = screenGui

    flash.BackgroundTransparency = 0
    game:GetService("TweenService"):Create(flash, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()

    wait(1)
    flash:Destroy()
end)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create button
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 100, 0, 50)
button.Position = UDim2.new(0.5, -50, 0.5, -25)
button.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
button.TextColor3 = Color3.new(1, 1, 1) -- White text color
button.Text = "6"
button.Font = Enum.Font.SourceSansBold
button.TextScaled = true
button.Parent = screenGui

-- Animation setup
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://15437009238"
local animationTrack = humanoid:LoadAnimation(animation)

-- Slap aura variables
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local slapDistance = 15
local slapCooldown = 0.585
local lastSlapTime = 0
local slapEnabled = false
local teleportEnabled = false
local selectedRemote = "PlagueHit"

-- Function to slap closest player
local function slapClosestPlayer()
    if not slapEnabled then return end

    local closestPlayer = nil
    local closestDistance = slapDistance

    if character and character:FindFirstChild("HumanoidRootPart") then
        local playerPosition = character.HumanoidRootPart.Position

        for _, otherPlayer in pairs(Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local otherPlayerPosition = otherPlayer.Character.HumanoidRootPart.Position
                local distance = (playerPosition - otherPlayerPosition).Magnitude

                if distance <= closestDistance then
                    closestDistance = distance
                    closestPlayer = otherPlayer
                end
            end
        end

        if closestPlayer and tick() - lastSlapTime >= slapCooldown then
            lastSlapTime = tick()
            if closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
                local head = closestPlayer.Character.Head
                local args = {head}
                local remote = ReplicatedStorage:FindFirstChild(selectedRemote)
                if remote then
                    remote:FireServer(unpack(args))
                else
                    warn("Remote not found:", selectedRemote)
                end
            end
        end
    end
end

-- Function to teleport to the nearest player within 15 studs
local function teleportToNearestPlayer()
    if not teleportEnabled then return end

    local closestPlayer = nil
    local closestDistance = slapDistance

    if character and character:FindFirstChild("HumanoidRootPart") then
        local playerPosition = character.HumanoidRootPart.Position

        for _, otherPlayer in pairs(Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local otherPlayerPosition = otherPlayer.Character.HumanoidRootPart.Position
                local distance = (playerPosition - otherPlayerPosition).Magnitude

                if distance <= closestDistance then
                    closestDistance = distance
                    closestPlayer = otherPlayer
                end
            end
        end

        if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = closestPlayer.Character.HumanoidRootPart.CFrame
        end
    end
end

-- Remote spam function
local function spamRemote()
    local args = {
        [1] = "fullcharged"
    }
    ReplicatedStorage.slapstick:FireServer(unpack(args))
end

-- Button click functionality
button.MouseButton1Click:Connect(function()
    -- Start animation
    animationTrack.Looped = true
    animationTrack:Play()

    -- Set walk speed
    humanoid.WalkSpeed = 70

    -- Enable slap aura and teleport
    slapEnabled = true
    teleportEnabled = true

    -- Start spamming remote, slap aura, and teleport
    local remoteSpam = true
    local slapCheck = game:GetService("RunService").RenderStepped:Connect(slapClosestPlayer)
    local teleportLoop = task.spawn(function()
        while teleportEnabled do
            teleportToNearestPlayer()
            task.wait(0.1) -- Adjust teleport interval as needed
        end
    end)
    local spamLoop = task.spawn(function()
        while remoteSpam do
            spamRemote()
            task.wait(0.1) -- Adjust remote interval as needed
        end
    end)

    -- Stop everything after 7 seconds
    task.delay(7, function()
        animationTrack:Stop()
        humanoid.WalkSpeed = 16 -- Reset walk speed to default
        slapEnabled = false
        teleportEnabled = false
        remoteSpam = false
        slapCheck:Disconnect()
    end)
end)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Locate the right hand part (may vary depending on the rig)
local rightHand = character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm") or character:FindFirstChild("RightUpperArm")

if rightHand then
    -- Function to create a new ParticleEmitter with specific settings
    local function createParticleEmitter(parent)
        local particleEmitter = Instance.new("ParticleEmitter")
        particleEmitter.Color = ColorSequence.new(Color3.fromRGB(170, 0, 255)) -- Bright purple
        particleEmitter.Size = NumberSequence.new(0.6) -- Slightly larger particles
        particleEmitter.Texture = "rbxassetid://242968390" -- Optional texture for particles
        particleEmitter.Rate = 75 -- High particle rate for intensity
        particleEmitter.Lifetime = NumberRange.new(0.4, 0.8) -- Duration of each particle
        particleEmitter.Speed = NumberRange.new(4, 8) -- Faster particles for dynamic effect
        particleEmitter.LightEmission = 1 -- Make particles glow
        particleEmitter.Parent = parent
        return particleEmitter
    end

    -- Function to create a new PointLight with specific settings
    local function createPointLight(parent)
        local pointLight = Instance.new("PointLight")
        pointLight.Color = Color3.fromRGB(170, 0, 255) -- Bright purple
        pointLight.Range = 12 -- Larger light radius
        pointLight.Brightness = 3 -- Increased intensity
        pointLight.Parent = parent
        return pointLight
    end

    -- Create multiple ParticleEmitters and PointLights
    for i = 1, 3 do
        createParticleEmitter(rightHand)
        createPointLight(rightHand)
    end
else
    warn("Right hand part not found.")
end

local ModelDeath = game:GetObjects("rbxassetid://12195574482")[1]
if ModelDeath then
    for i,a in pairs(ModelDeath.Torso:GetDescendants()) do
        if a.Name == "Attachment4" or a.Name == "Flare" or a.Name == "Star3" or a.Name == "Bits" then
            a:Destroy() 
        end
    end
    for i,a in pairs(ModelDeath.Torso:GetChildren()) do
        if a.ClassName == "Attachment" and a:FindFirstChildWhichIsA("ParticleEmitter") then
            a:Clone().Parent = game.Players.LocalPlayer.Character.Torso
        end
    end
    ModelDeath:Destroy()
end

-- Get the local player and their character
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Function to make the character, including hair and accessories, fully black and apply a red outline
local function makeCharacterCompletelyBlack()
    for _, descendant in pairs(character:GetDescendants()) do
        if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
            descendant.Color = Color3.new(0, 0, 0) -- Make all body parts black
            descendant.Material = Enum.Material.SmoothPlastic
        elseif descendant:IsA("Accessory") then
            if descendant:FindFirstChild("Handle") then
                -- Turn the handle of the accessory black
                descendant.Handle.Color = Color3.new(0, 0, 0)
                descendant.Handle.Material = Enum.Material.SmoothPlastic

                -- Check for meshes or textures in the accessory's handle
                for _, child in pairs(descendant.Handle:GetDescendants()) do
                    if child:IsA("MeshPart") or child:IsA("Part") or child:IsA("UnionOperation") then
                        child.Color = Color3.new(0, 0, 0)
                        child.Material = Enum.Material.SmoothPlastic
                    elseif child:IsA("SpecialMesh") then
                        child.TextureId = "" -- Remove texture for a uniform color
                    end
                end
            end
        elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
            descendant:Destroy() -- Remove decals and textures
        elseif descendant:IsA("Clothing") or descendant:IsA("ShirtGraphic") then
            descendant:Destroy() -- Remove clothing to keep the body fully black
        end
    end

    -- Add a red outline effect to the character
    local outlineEffect = Instance.new("Highlight")
    outlineEffect.Parent = character
    outlineEffect.OutlineColor = Color3.new(1, 0, 0) -- Red outline
    outlineEffect.FillColor = Color3.new(0, 0, 0) -- Black fill
    outlineEffect.FillTransparency = 1 -- Only show the outline
end

-- Execute the function
makeCharacterCompletelyBlack()

-- Create ScreenGui and "1" button
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Create the "1" button with black background and white text
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 75, 0, 75)
button.Position = UDim2.new(0.6, -37.5, 0.5, -37.5) -- Center of the screen
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
button.TextColor3 = Color3.new(1, 1, 1) -- White text color
button.Text = "1"
button.Font = Enum.Font.SourceSans
button.TextScaled = true
button.Parent = screenGui

-- Load animation
local animationId = "rbxassetid://16102413143"
local animation = Instance.new("Animation")
animation.AnimationId = animationId
local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animationTrack = humanoid:LoadAnimation(animation)

-- Slap Aura Variables and Setup
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local slapDistance = 30
local slapCooldown = 0.585
local lastSlapTime = 0
local slapEnabled = false -- Start with slap aura disabled
local selectedRemote = "PlagueHit" -- Use PlagueHit remote

-- Function to slap closest player
local function slapClosestPlayer()
    if not slapEnabled then return end

    local closestPlayer = nil
    local closestDistance = slapDistance

    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local playerPosition = player.Character.HumanoidRootPart.Position

        for _, otherPlayer in pairs(Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local otherPlayerPosition = otherPlayer.Character.HumanoidRootPart.Position
                local distance = (playerPosition - otherPlayerPosition).Magnitude

                if distance <= closestDistance then
                    closestDistance = distance
                    closestPlayer = otherPlayer
                end
            end
        end

        if closestPlayer and tick() - lastSlapTime >= slapCooldown then
            lastSlapTime = tick()
            if closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
                local head = closestPlayer.Character.Head
                local args = {head}
                local remote = ReplicatedStorage:FindFirstChild(selectedRemote)
                if remote then
                    remote:FireServer(unpack(args))
                else
                    warn("Remote not found:", selectedRemote)
                end
            end
        end
    end
end

-- Function to handle button click
local function onButtonClick()
    -- Execute the remote 3 times
    local args = { [1] = "ScytheWeapon" }
    for i = 1, 3 do
        game:GetService("ReplicatedStorage").Scythe:FireServer(unpack(args))
    end

    -- Play the animation
    animationTrack:Play()

    -- Enable slap aura for 0.4 seconds
    slapEnabled = true
    task.delay(0.4, function()
        slapEnabled = false -- Disable slap aura after 0.4 seconds
    end)
end

-- Connect button click to the function
button.MouseButton1Click:Connect(onButtonClick)

-- Continuously check for closest player if slap aura is enabled
RunService.RenderStepped:Connect(function()
    if slapEnabled then
        slapClosestPlayer()
    end
end)


local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 75, 0, 75)
button.Position = UDim2.new(0.5, -37.5, 0.6, -37.5)
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.BackgroundColor3 = Color3.new(0, 0, 0)
button.TextColor3 = Color3.new(1, 1, 1)
button.Text = "2"
button.Font = Enum.Font.SourceSans
button.TextScaled = true
button.Parent = screenGui

local animationId = "rbxassetid://16102535685"
local animation = Instance.new("Animation")
animation.AnimationId = animationId
local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animationTrack = humanoid:LoadAnimation(animation)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local slapDistance = 30
local slapCooldown = 0.585
local lastSlapTime = 0
local slapEnabled = false
local selectedRemote = "PlagueHit"

local function slapClosestPlayer()
    if not slapEnabled then return end

    local closestPlayer = nil
    local closestDistance = slapDistance

    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local playerPosition = player.Character.HumanoidRootPart.Position

        for _, otherPlayer in pairs(Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local otherPlayerPosition = otherPlayer.Character.HumanoidRootPart.Position
                local distance = (playerPosition - otherPlayerPosition).Magnitude

                if distance <= closestDistance then
                    closestDistance = distance
                    closestPlayer = otherPlayer
                end
            end
        end

        if closestPlayer and tick() - lastSlapTime >= slapCooldown then
            lastSlapTime = tick()
            if closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
                local head = closestPlayer.Character.Head
                local args = {head}
                local remote = ReplicatedStorage:FindFirstChild(selectedRemote)
                if remote then
                    remote:FireServer(unpack(args))
                else
                    warn("Remote not found:", selectedRemote)
                end
            end
        end
    end
end

local function onButtonClick()
    animationTrack:Play()

    local args = { [1] = "ScytheWeapon" }
    for i = 1, 5 do
        game:GetService("ReplicatedStorage").Scythe:FireServer(unpack(args))
    end

    task.wait(0.2)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -20)
    end

    task.wait(0.2)
    slapEnabled = true
    task.delay(0.3, function()
        slapEnabled = false
    end)
end

button.MouseButton1Click:Connect(onButtonClick)

RunService.RenderStepped:Connect(function()
    if slapEnabled then
        slapClosestPlayer()
    end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 50, 0, 50)
button.Position = UDim2.new(0.6, -75, 0.5, -28)
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.BackgroundColor3 = Color3.new(0, 0, 0)
button.Text = "3"
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 24
button.Parent = screenGui

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://16144846625"
local animationTrack = humanoid:LoadAnimation(animation)

button.MouseButton1Click:Connect(function()
    animationTrack:Play()
    task.wait(0.2)
    
    local args = {
        [1] = "Bomb"
    }
    game:GetService("ReplicatedStorage").RetroAbility:FireServer(unpack(args))
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 30
    end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(0.2, -75, 0.5, 25)
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.BackgroundColor3 = Color3.new(0, 0, 0)
button.Text = "4"
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 24
button.Parent = screenGui

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

button.MouseButton1Click:Connect(function()
    humanoid.JumpPower = 130
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    
    wait(0.3)
    
    local args = {
        [1] = "fullcharged"
    }
    game:GetService("ReplicatedStorage").slapstick:FireServer(unpack(args))
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(0.5, -75, 0.5, 0)
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.BackgroundColor3 = Color3.new(0, 0, 0)
button.Text = "5"
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 24
button.Parent = screenGui

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://16144830595"
local animationTrack = humanoid:LoadAnimation(animation)

button.MouseButton1Click:Connect(function()
    animationTrack:Play()

    local args = {
        [1] = "Bomb"
    }
    game:GetService("ReplicatedStorage").RetroAbility:FireServer(unpack(args))

    local flash = Instance.new("Frame")
    flash.Size = UDim2.new(1, 0, 1, 0)
    flash.Position = UDim2.new(0, 0, 0, 0)
    flash.BackgroundColor3 = Color3.new(1, 1, 1)
    flash.ZIndex = 10
    flash.Parent = screenGui

    flash.BackgroundTransparency = 0
    game:GetService("TweenService"):Create(flash, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()

    wait(1)
    flash:Destroy()
end)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

--Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create button
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 100, 0, 50)
button.Position = UDim2.new(0.4, -50, 0.5, -25)
button.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
button.TextColor3 = Color3.new(1, 1, 1) -- White text color
button.Text = "6"
button.Font = Enum.Font.SourceSansBold
button.TextScaled = true
button.Parent = screenGui

-- Animation setup
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://15437009238"
local animationTrack = humanoid:LoadAnimation(animation)

-- Slap aura variables
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local slapDistance = 15
local slapCooldown = 0.585
local lastSlapTime = 0
local slapEnabled = false
local teleportEnabled = false
local selectedRemote = "PlagueHit"

-- Function to slap closest player
local function slapClosestPlayer()
    if not slapEnabled then return end

    local closestPlayer = nil
    local closestDistance = slapDistance

    if character and character:FindFirstChild("HumanoidRootPart") then
        local playerPosition = character.HumanoidRootPart.Position

        for _, otherPlayer in pairs(Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local otherPlayerPosition = otherPlayer.Character.HumanoidRootPart.Position
                local distance = (playerPosition - otherPlayerPosition).Magnitude

                if distance <= closestDistance then
                    closestDistance = distance
                    closestPlayer = otherPlayer
                end
            end
        end

        if closestPlayer and tick() - lastSlapTime >= slapCooldown then
            lastSlapTime = tick()
            if closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
                local head = closestPlayer.Character.Head
                local args = {head}
                local remote = ReplicatedStorage:FindFirstChild(selectedRemote)
                if remote then
                    remote:FireServer(unpack(args))
                else
                    warn("Remote not found:", selectedRemote)
                end
            end
        end
    end
end

-- Function to teleport to the nearest player within 15 studs
local function teleportToNearestPlayer()
    if not teleportEnabled then return end

    local closestPlayer = nil
    local closestDistance = slapDistance

    if character and character:FindFirstChild("HumanoidRootPart") then
        local playerPosition = character.HumanoidRootPart.Position

        for _, otherPlayer in pairs(Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local otherPlayerPosition = otherPlayer.Character.HumanoidRootPart.Position
                local distance = (playerPosition - otherPlayerPosition).Magnitude

                if distance <= closestDistance then
                    closestDistance = distance
                    closestPlayer = otherPlayer
                end
            end
        end

        if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = closestPlayer.Character.HumanoidRootPart.CFrame
        end
    end
end

-- Remote spam function
local function spamRemote()
    local args = {
        [1] = "fullcharged"
    }
    ReplicatedStorage.slapstick:FireServer(unpack(args))
end

-- Button click functionality
button.MouseButton1Click:Connect(function()
    -- Start animation
    animationTrack.Looped = true
    animationTrack:Play()

    -- Set walk speed
    humanoid.WalkSpeed = 70

    -- Enable slap aura and teleport
    slapEnabled = true
    teleportEnabled = true

    -- Start spamming remote, slap aura, and teleport
    local remoteSpam = true
    local slapCheck = game:GetService("RunService").RenderStepped:Connect(slapClosestPlayer)
    local teleportLoop = task.spawn(function()
        while teleportEnabled do
            teleportToNearestPlayer()
            task.wait(0.1) -- Adjust teleport interval as needed
        end
    end)
    local spamLoop = task.spawn(function()
        while remoteSpam do
            spamRemote()
            task.wait(0.1) -- Adjust remote interval as needed
        end
    end)

    -- Stop everything after 7 seconds
    task.delay(7, function()
        animationTrack:Stop()
        humanoid.WalkSpeed = 16 -- Reset walk speed to default
        slapEnabled = false
        teleportEnabled = false
        remoteSpam = false
        slapCheck:Disconnect()
    end)
end)

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 125, 0, 40)
button.Position = UDim2.new(1, -160, 0, 10)
button.AnchorPoint = Vector2.new(1, 0)
button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button.TextColor3 = Color3.fromRGB(0, 0, 0)
button.Text = "GOD MODE"
button.Font = Enum.Font.SourceSansBold
button.TextScaled = true
button.Parent = screenGui

button.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-5, -5, 15)
    end
end)
