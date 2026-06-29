local CoreGui, Death_Gu, DeathStorage, DeathS_AntiVoid, Notification_R, Death_Gu_2, Lighting, DeathTheme1, Stepped, Heartbeat, DeathS_AntiVoid_2, CubeOfDeathArea, FindFirstChild, R385_Result, R385_Result_2, TweenInfo_New;
local fenv = getfenv();
fenv._oaoMoJKOWcEU = "This file was protected with MoonSec V3";
fenv.QxSKhXLJDeckYaC = function(p1, a, b, c)
    p1(3);
end;
fenv.CaYkceDJLXhKSxQ = {
    tostring,
    print
};
pcall(function(a, b, c)
    wait();
end);
if QxSKhXLJDeckYaC then 
    QxSKhXLJDeckYaC(function(a_2, b_2, c_2, ...) end);
end;
if fenv.QxSKhXLJDeckYaC then
else 
    fenv.MoonSec_StringsHiddenAttr = true;
end;
if not getgenv().DeathGlove then
else 
    if 50 < fenv.DeathGlove.BoostValue then 
        fenv.DeathGlove.BoostValue = 50;
    end;
end;
if game:IsLoaded() then 

end;
fenv.JobId = game.JobId;
fenv.PlaceId = game.PlaceId;
local UserInputService = game:GetService("UserInputService");
local TweenService = game:GetService("TweenService");
game:GetService("Debris");
local RunService = game:GetService("RunService");
game:GetService("TeleportService");
game:FindService("RunService");
game:GetService("StarterGui");
game:GetService("SoundService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local LocalPlayer = game:GetService("Players").LocalPlayer;
local Character = LocalPlayer.Character;
if not Character then
else 
    Character:WaitForChild("Torso", 15);
    Character:WaitForChild("Head", 15);
    Character:WaitForChild("HumanoidRootPart");
end;
if Character then 
    Character:FindFirstChildWhichIsA("Humanoid");
end;
local _ = game.Workspace.Lobby;
local HideClients = fenv.DeathGlove.HideClients;
local _ = fenv.DeathGlove.MuteClientSounds;
local _ = fenv.DeathGlove.ClientDeathTheme;
local _ = fenv.DeathGlove.HideFEScythe;
local Value = LocalPlayer.leaderstats.Glove.Value;
if (LocalPlayer.leaderstats.Glove.Value == "Death") then
else 
    if (Value ~= "Extended") then 
        if (Value == "Dual") then
        else 
            if (Value == "spin") then
            else 
                if (Value ~= "Diamond") then 
                    if (Value == "Zombie") then
                    else 
                        CoreGui = game.CoreGui;
                    end;
                end;
            end;
            if CoreGui:FindFirstChild("Death_Gu") then 

            end;
        end;
    end;
end;
CoreGui:FindFirstChild("Death_Gu"):Destroy();
if not ReplicatedStorage:FindFirstChild("DeathStorage") then
else 

end;
ReplicatedStorage:FindFirstChild("DeathStorage"):Destroy();
fenv.EnableCreditScript = true;
loadstring(
    game:HttpGet("https://raw.githubusercontent.com/omoskid/omoskid-scripts/main/fuck%20ts%20ys%20nigga")
)();
loadstring(
    game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/notificationtest")
)().Notify{
    ["Duration"] = 5,
    ["Title"] = "Script Credit!",
    ["Description"] = (
        (
            "Made by " .. getgenv().CreditName.DisplayYoutube
        ) .. "/"
    ) .. getgenv().CreditName.SourceYoutube
};
if workspace:FindFirstChild("Death's AntiVoid") then 

end;
workspace:FindFirstChild("Death's AntiVoid"):Destroy();
loadstring(
    game:HttpGet("https://raw.githubusercontent.com/omoskid/omoskid-scripts/main/ts%20nigga%20omohota%20is%20a%20skid")
)();
if not CoreGui:FindFirstChild("Notification Maker") then
else 
    Notification_R = CoreGui:FindFirstChild("Notification Maker");
end;
if Notification_R:FindFirstChild("notificationCenter") then 
    Notification_R:FindFirstChild("notificationCenter");
end;
local DeathStorage_2 = ReplicatedStorage:FindFirstChild("DeathStorage");
if not DeathStorage_2 then
else 
    Death_Gu_2 = CoreGui:FindFirstChild("Death_Gu");
end;
if not Death_Gu_2 then
else 
    if game:GetService("Lighting"):FindFirstChild("HYPE") then 

    end;
end;
fenv.Sound = workspace:FindFirstChild("DeathTheme1");
if fenv.Sound then 
    DeathTheme1 = workspace:FindFirstChild("DeathTheme1");
end;
fenv.DeathTheme1 = DeathTheme1;
DeathTheme1.Connect(DeathTheme1.Ended, function(a_3, b_3, c_3, ...)
    DeathTheme1.Play(fenv.DeathTheme1);
end);
fenv.swait = function(a_4, b_4, c_4, ...)
    game:GetService("RunService");
    RunService.Stepped:wait();
end;
fenv.chatFunc1 = function(a_5, b_5, c_5, ...)
    if not HideClients then
    else 
    end;
end;
fenv.chatFunc2 = function(a_6, b_6, c_6, ...)
    if HideClients then 
    end;
end;
fenv.chatFunc3 = function(a_6, b_6, c_6, ...)
    if not HideClients then
    else 
    end;
end;
fenv.shakeCameraConnect = function(a_7, b_7, c_7, ...)
    DeathTheme1.NextNumber(
        Random.new()
    );
    if (c_7) then
    else 
        if 0 < a_7 then 
            game:GetService("RunService");
            RunService.Heartbeat:Wait();
            local _ = tick() - tick();
        end;
    end;
    local _ = a_7 ^ 2;
end;
fenv.PlayerDead = function(a_8, b_8, c_8, ...)
    if not workspace:FindFirstChild("Death's AntiVoid") then
    else 

    end;
    workspace:FindFirstChild("Death's AntiVoid"):Destroy();
    if not Death_Gu_2 then
    else 
        Death_Gu_2:Destroy();
    end;
    if not DeathStorage_2 then
    else 
        DeathStorage_2:Destroy();
    end;
    DeathTheme1.Stop(fenv.DeathTheme1);
    CubeOfDeathArea = DeathTheme1.CubeOfDeathArea;
    FindFirstChild = DeathTheme1.FindFirstChild;
    if FindFirstChild(CubeOfDeathArea, "Death's bless") then 

    end;
    FindFirstChild(CubeOfDeathArea, "Death's bless"):Destroy();
    game:GetService("Workspace");
    R385_Result_2 = FindFirstChild(CubeOfDeathArea, "the cube of death(i heard it kills)");
    if R385_Result_2 then 
        R385_Result_2.CanTouch = true;
    end;
end;
LocalPlayer.CharacterAdded:Connect(PlayerDead);
local AbilityFrame = Instance.new("Frame", Death_Gu_2);
AbilityFrame.Name = "AbilityFrame";
local UDim2_New = UDim2.new;
AbilityFrame.Size = UDim2_New(0.3, 0, 0.25, 0);
AbilityFrame.Position = UDim2_New(0.67, 0, 0.6, 0);
local FromRGB = Color3.fromRGB;
AbilityFrame.BackgroundColor3 = FromRGB(0, 0, 0);
AbilityFrame.BorderSizePixel = 0;
AbilityFrame.BackgroundTransparency = 0.5;
AbilityFrame.Active = true;
AbilityFrame.Draggable = true;
AbilityFrame.Visible = false;
local UIGridLayout = Instance.new"UIGridLayout";
UIGridLayout.CellSize = UDim2_New(0.23, 0, 0.46, 0);
UIGridLayout.FillDirection = DeathTheme1.Horizontal;
UIGridLayout.Parent = AbilityFrame;
local Ability1 = Instance.new"TextButton";
Ability1.Name = "Ability1";
Ability1.Text = "1";
Ability1.TextScaled = true;
local Color3_New = Color3.new;
Ability1.BackgroundColor3 = Color3_New(0, 0, 0);
Ability1.BorderColor3 = Color3_New(1, 1, 1);
Ability1.BorderSizePixel = 3;
Ability1.TextColor3 = Color3_New(1, 1, 1);
Ability1.Font = DeathTheme1.Arcade;
Ability1.MouseEnter:Connect(function(a_9, b_9, c_9, ...)
    TweenInfo_New = TweenInfo.new;
    DeathTheme1.Play(
        TweenService:Create(Ability1, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1.05, 0, 1.05, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability1, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 0)
        })
    );
end);
Ability1.MouseLeave:Connect(function(a_10, b_10, c_10, ...)
    DeathTheme1.Play(
        TweenService:Create(Ability1, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1, 0, 1, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability1, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 255)
        })
    );
end);
Ability1.Parent = AbilityFrame;
Ability1.MouseButton1Click:Connect(function(a_11, b_11, c_11, ...) end);
local Ability2 = Instance.new"TextButton";
Ability2.Name = "Ability2";
Ability2.Text = "2";
Ability2.TextScaled = true;
Ability2.BackgroundColor3 = Color3_New(0, 0, 0);
Ability2.BorderColor3 = Color3_New(1, 1, 1);
Ability2.BorderSizePixel = 3;
Ability2.TextColor3 = Color3_New(1, 1, 1);
Ability2.Font = DeathTheme1.Arcade;
Ability2.MouseEnter:Connect(function(a_11, b_11, c_11, ...)
    DeathTheme1.Play(
        TweenService:Create(Ability2, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1.05, 0, 1.05, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability2, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 0)
        })
    );
end);
Ability2.MouseLeave:Connect(function(a_12, b_12, c_12, ...)
    DeathTheme1.Play(
        TweenService:Create(Ability2, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1, 0, 1, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability2, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 255)
        })
    );
end);
Ability2.Parent = AbilityFrame;
Ability2.MouseButton1Click:Connect(function(a_13, b_13, c_13, ...) end);
local Ability3 = Instance.new"TextButton";
Ability3.Name = "Ability3";
Ability3.Text = "3";
Ability3.TextScaled = true;
Ability3.BackgroundColor3 = Color3_New(0, 0, 0);
Ability3.BorderColor3 = Color3_New(1, 1, 1);
Ability3.BorderSizePixel = 3;
Ability3.TextColor3 = Color3_New(1, 1, 1);
Ability3.Font = DeathTheme1.Arcade;
Ability3.MouseEnter:Connect(function(a_13, b_13, c_13, ...)
    DeathTheme1.Play(
        TweenService:Create(Ability3, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1.05, 0, 1.05, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability3, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 0)
        })
    );
end);
Ability3.MouseLeave:Connect(function(a_14, b_14, c_14, ...)
    DeathTheme1.Play(
        TweenService:Create(Ability3, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1, 0, 1, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability3, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 255)
        })
    );
end);
Ability3.Parent = AbilityFrame;
Ability3.MouseButton1Click:Connect(function(a_15, b_15, c_15, ...) end);
local Ability4 = Instance.new"TextButton";
Ability4.Name = "Ability4";
Ability4.Text = "4";
Ability4.TextScaled = true;
Ability4.BackgroundColor3 = Color3_New(0, 0, 0);
Ability4.BorderColor3 = Color3_New(1, 1, 1);
Ability4.BorderSizePixel = 3;
Ability4.TextColor3 = Color3_New(1, 1, 1);
Ability4.Font = DeathTheme1.Arcade;
Ability4.MouseEnter:Connect(function(a_15, b_15, c_15, ...)
    DeathTheme1.Play(
        TweenService:Create(Ability4, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1.05, 0, 1.05, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability4, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 0)
        })
    );
end);
Ability4.MouseLeave:Connect(function(a_16, b_16, c_16, ...)
    DeathTheme1.Play(
        TweenService:Create(Ability4, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1, 0, 1, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability4, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 255)
        })
    );
end);
Ability4.Parent = AbilityFrame;
Ability4.MouseButton1Click:Connect(function(a_17, b_17, c_17, ...) end);
local Ability5 = Instance.new"TextButton";
Ability5.Name = "Ability5";
Ability5.Text = "5";
Ability5.TextScaled = true;
Ability5.BackgroundColor3 = Color3_New(0, 0, 0);
Ability5.BorderColor3 = Color3_New(1, 1, 1);
Ability5.BorderSizePixel = 3;
Ability5.TextColor3 = Color3_New(1, 1, 1);
Ability5.Font = DeathTheme1.Arcade;
Ability5.MouseEnter:Connect(function(a_17, b_17, c_17, ...)
    DeathTheme1.Play(
        TweenService:Create(Ability5, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1.05, 0, 1.05, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability5, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 0)
        })
    );
end);
Ability5.MouseLeave:Connect(function(a_18, b_18, c_18, ...)
    DeathTheme1.Play(
        TweenService:Create(Ability5, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1, 0, 1, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability5, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 255)
        })
    );
end);
Ability5.Parent = AbilityFrame;
Ability5.MouseButton1Click:Connect(function(a_19, b_19, c_19, ...) end);
local Ability6 = Instance.new"TextButton";
Ability6.Name = "Ability6";
Ability6.Text = "6";
Ability6.TextScaled = true;
Ability6.BackgroundColor3 = Color3_New(0, 0, 0);
Ability6.BorderColor3 = Color3_New(1, 1, 1);
Ability6.BorderSizePixel = 3;
Ability6.TextColor3 = Color3_New(1, 1, 1);
Ability6.Font = DeathTheme1.Arcade;
Ability6.MouseEnter:Connect(function(a_19, b_19, c_19, ...)
    DeathTheme1.Play(
        TweenService:Create(Ability6, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1.05, 0, 1.05, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability6, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 0)
        })
    );
end);
Ability6.MouseLeave:Connect(function(a_20, b_20, c_20, ...)
    DeathTheme1.Play(
        TweenService:Create(Ability6, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1, 0, 1, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability6, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 255)
        })
    );
end);
Ability6.Parent = AbilityFrame;
Ability6.MouseButton1Click:Connect(function(a_21, b_21, c_21, ...) end);
local Ability7 = Instance.new"TextButton";
Ability7.Name = "Ability7";
Ability7.Text = "7";
Ability7.TextScaled = true;
Ability7.BackgroundColor3 = Color3_New(0, 0, 0);
Ability7.BorderColor3 = Color3_New(1, 1, 1);
Ability7.BorderSizePixel = 3;
Ability7.TextColor3 = Color3_New(1, 1, 1);
Ability7.Font = DeathTheme1.Arcade;
Ability7.MouseEnter:Connect(function(a_21, b_21, c_21, ...)
    DeathTheme1.Play(
        TweenService:Create(Ability7, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1.05, 0, 1.05, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability7, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 0)
        })
    );
end);
Ability7.MouseLeave:Connect(function(a_22, b_22, c_22, ...)
    DeathTheme1.Play(
        TweenService:Create(Ability7, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1, 0, 1, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability7, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 255)
        })
    );
end);
Ability7.Parent = AbilityFrame;
Ability7.MouseButton1Click:Connect(function(a_23, b_23, c_23, ...) end);
local Ability8 = Instance.new"TextButton";
Ability8.Name = "Ability8";
Ability8.Text = "8";
Ability8.TextScaled = true;
Ability8.BackgroundColor3 = Color3_New(0, 0, 0);
Ability8.BorderColor3 = Color3_New(1, 1, 1);
Ability8.BorderSizePixel = 3;
Ability8.TextColor3 = Color3_New(1, 1, 1);
Ability8.Font = DeathTheme1.Arcade;
Ability8.MouseEnter:Connect(function(a_23, b_23, c_23, ...)
    DeathTheme1.Play(
        TweenService:Create(Ability8, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1.05, 0, 1.05, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability8, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 0)
        })
    );
end);
Ability8.MouseLeave:Connect(function(a_24, b_24, c_24, ...)
    DeathTheme1.Play(
        TweenService:Create(Ability8, TweenInfo_New(0.3), {
            ["Size"] = UDim2_New(1, 0, 1, 0)
        })
    );
    DeathTheme1.Play(
        TweenService:Create(Ability8, TweenInfo_New(0.3), {
            ["BorderColor3"] = FromRGB(255, 255, 255)
        })
    );
end);
Ability8.Parent = AbilityFrame;
Ability8.MouseButton1Click:Connect(function(a_25, b_25, c_25, ...) end);
local InputBegan = UserInputService.InputBegan;
InputBegan:Connect(function(a_25, b_25, c_25, ...)
    if (DeathTheme1.UserInputType ~= DeathTheme1.MouseButton1) then 
    end;
end);
InputBegan:Connect(function(a_26, b_26, c_26, ...)
    if (DeathTheme1.KeyCode == DeathTheme1.Two) then
    else 
    end;
end);
InputBegan:Connect(function(a_27, b_27, c_27, ...)
    if (DeathTheme1.KeyCode == DeathTheme1.Three) then
    else 
    end;
end);
InputBegan:Connect(function(a_28, b_28, c_28, ...)
    if (DeathTheme1.KeyCode ~= DeathTheme1.Four) then 
    end;
end);
InputBegan:Connect(function(a_29, b_29, c_29, ...)
    if (DeathTheme1.KeyCode == DeathTheme1.Five) then
    else 
    end;
end);
InputBegan:Connect(function(a_30, b_30, c_30, ...)
    if (DeathTheme1.KeyCode ~= DeathTheme1.Six) then 
    end;
end);
InputBegan:Connect(function(a_31, b_31, c_31, ...)
    if (DeathTheme1.KeyCode == DeathTheme1.Seven) then
    else 
    end;
end);
InputBegan:Connect(function(a_32, b_32, c_32, ...)
    if (DeathTheme1.KeyCode ~= DeathTheme1.Eight) then 
    end;
end);
InputBegan:Connect(function(a_33, b_33, c_33, ...)
    if (DeathTheme1.KeyCode ~= DeathTheme1.One) then 
    end;
end);
tick();
DeathTheme1.Value = "Death";
error"Value is not a valid member of nil \"nil\"";