--[[
 ______  ______   _____         _                
|  ____||  ____| / ____|       | |               
| |__   | |__   | (___    __ _ | | __ ___  _ __  
|  __|  |  __|   \___ \  / _` || |/ // _ \| '_ \ 
| |     | |____  ____) || (_| ||   <|  __/| | | |
|_|     |______||_____/  \__,_||_|\_\\___||_| |_|
       
[CREDITS]:
// Melon - Scripted everything
// ZerX - Movement scripting (last part only, i edited it a bit)
// Emper - Reanimation
// Forsaken - Animations
// @cybop_ and @tacocat3071 - Rig/Hat suggestions

[FREE] Hair Rig:
// https://www.roblox.com/catalog/104558082150911/Pursuer
// https://www.roblox.com/catalog/62724852/Chestnut-Bun
// https://www.roblox.com/catalog/301818464/Lins-Hair
// https://www.roblox.com/catalog/451220849/Lavender-Updo
// https://www.roblox.com/catalog/376526888/Straight-Blonde-Hair
// https://www.roblox.com/catalog/4819740796/Robox

[FREE] Fedora Rig:
// https://www.roblox.com/catalog/3033910400/International-Fedora-Germany
// https://www.roblox.com/catalog/3409612660/International-Fedora-USA
// https://www.roblox.com/catalog/4381707497/International-Fedora-Turkey
// https://www.roblox.com/catalog/4645404679/International-Fedora-Thailand
// https://www.roblox.com/catalog/4391384843/International-Fedora-Russia
// https://www.roblox.com/catalog/3662265036/International-Fedora-Indonesia
// https://www.roblox.com/catalog/4819740796/Robox

[PAID] Classic Rig:
// https://www.roblox.com/catalog/12344545199/Extra-Left-hand-moving-Blocky-white
// https://www.roblox.com/catalog/12344591101/Extra-Right-hand-moving-Blocky-white
// https://www.roblox.com/catalog/13779879140/Black-Fluffy-Fur-Body
// https://www.roblox.com/catalog/11263254795/Dummy-Head-For-Headless
// https://www.roblox.com/catalog/11159410305/Rectangle-Head-For-Headless

[PAID] Soldier Rig:
// https://www.roblox.com/catalog/139102413583361/Metal-Arm
// https://www.roblox.com/catalog/121830551276315/Prosthetic
// https://www.roblox.com/catalog/99726531005445/Black-Prosthetic-Metal-Arm-RIGHT
// https://www.roblox.com/catalog/18989526470/Black-Prosthetic-Metal-Arm-LEFT
// https://www.roblox.com/catalog/74295684215899/Emo-Black-Armored-Vest

// [PAID] Hats:
https://www.roblox.com/catalog/98099894849025/VHS-Glitched-Dummy-Animated
https://www.roblox.com/catalog/94622218233849/Pursuer-Die-of-Death-Sword-Waist
https://www.roblox.com/catalog/92726717965695/Pursuer-Die-of-Death-Sword-Backpack

Find the others here:
// https://www.roblox.com/games/15541318313/Melons-Baseplate
]]

local Sounds = {
GashingWound = {"PursuerGash.ogg", "https://github.com/MelonsStuff/FE-Scripts/raw/refs/heads/main/FESaken/Sounds/Forsaken/PusuerJason/Purs-gash.ogg"},
Punch = {"PursuerPunch.ogg", "https://github.com/MelonsStuff/FE-Scripts/raw/refs/heads/main/FESaken/Sounds/Forsaken/PusuerJason/Purs-punch.ogg"},
Stunned = {"PursuerStun.ogg", "https://github.com/MelonsStuff/FE-Scripts/raw/refs/heads/main/FESaken/Sounds/Forsaken/PusuerJason/Purs-stun.ogg"},
RagingPace = {"PursuerRage.ogg", "https://github.com/MelonsStuff/FE-Scripts/raw/refs/heads/main/FESaken/Sounds/Forsaken/PusuerJason/Purs-pace.ogg"},
PacingRage = {"PursuerChase.ogg", "https://github.com/MelonsStuff/FE-Scripts/raw/refs/heads/main/FESaken/Sounds/Forsaken/PusuerJason/Pursuer-Chase.ogg"},
}
local Path = "FESaken/PursuerJason/Sounds/"
local Theme
if not isfolder(Path) then makefolder(Path) end

for i, v in pairs(Sounds) do
local path = Path..v[1]
if not isfile(path) then
writefile(path, game:HttpGet(v[2]))
end
end

if isfile(Path.."PursuerChase.ogg") then
Theme = Instance.new("Sound")
Theme.SoundId = getcustomasset(Path.."PursuerChase.ogg")
Theme.Volume = 0.5
Theme.Parent = nil
Theme.Looped = true
else
return print("Not every sound was downloaded, please try again or clear FESaken folder in your exectors Workspace directory.")
end

if not isfile("FESaken/PursuerJason.rbxmx") then
writefile("FESaken/PursuerJason.rbxmx",  game:HttpGet("https://github.com/MelonsStuff/FE-Scripts/raw/refs/heads/main/FESaken/Dependencies/PursuerJason.rbxmx"))
end

if game.CoreGui:FindFirstChild("TemporaryUI") then
game.CoreGui:FindFirstChild("TemporaryUI"):Destroy()
end

setfpscap(144)

do
local Accessories = {}
local Aligns = {}
local Attachments = {}
local BindableEvent = nil
local Blacklist = {}
local CFrame = CFrame
local CFrameidentity = CFrame.identity
local CFramelookAt = CFrame.lookAt
local CFramenew = CFrame.new
local Character = nil
local CurrentCamera = nil
local Enum = Enum
local Custom = Enum.CameraType.Custom
local Health = Enum.CoreGuiType.Health
local HumanoidRigType = Enum.HumanoidRigType
local R6 = HumanoidRigType.R6
local Dead = Enum.HumanoidStateType.Dead
local LockCenter = Enum.MouseBehavior.LockCenter
local MouseButton1 = Enum.UserInputType.MouseButton1
local Exceptions = {}
local game = game
local Clone = game.Clone
local Close = game.Close
local Connect = Close.Connect
local Disconnect = Connect(Close, function() end).Disconnect
local Wait = Close.Wait
local Destroy = game.Destroy
local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
local FindFirstChild = game.FindFirstChild
local FindFirstChildOfClass = game.FindFirstChildOfClass
local Players = FindFirstChildOfClass(game, "Players")
local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
local GetPlayers = Players.GetPlayers
local LocalPlayer = Players.LocalPlayer
local CharacterAdded = LocalPlayer.CharacterAdded
--local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
local Mouse = LocalPlayer:GetMouse()
local Kill = LocalPlayer.Kill
local RunService = FindFirstChildOfClass(game, "RunService")
local PostSimulation = RunService.PostSimulation
local PreRender = RunService.PreRender
local PreSimulation = RunService.PreSimulation
local StarterGui = FindFirstChildOfClass(game, "StarterGui")
local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
local SetCore = StarterGui.SetCore
local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
local Workspace = FindFirstChildOfClass(game, "Workspace")
local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
local HatDropY = FallenPartsDestroyHeight - 0.7
local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
local UserInputService = FindFirstChildOfClass(game, "UserInputService")
local InputBegan = UserInputService.InputBegan
local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
local GetChildren = game.GetChildren
local GetDescendants = game.GetDescendants
local GetPropertyChangedSignal = game.GetPropertyChangedSignal
local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
local IsA = game.IsA
local IsDescendantOf = game.IsDescendantOf
local Highlights = {}
local Instancenew = Instance.new
local R15Animation = Instancenew("Animation")
local R6Animation = Instancenew("Animation")
local HumanoidDescription = Instancenew("HumanoidDescription")
local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
local SetAccessories = HumanoidDescription.SetAccessories
local ModelBreakJoints = HumanoidModel.BreakJoints
local Head = HumanoidModel.Head
local BasePartBreakJoints = Head.BreakJoints
local GetJoints = Head.GetJoints
local IsGrounded = Head.IsGrounded
local Humanoid = HumanoidModel.Humanoid
local ApplyDescription = Humanoid.ApplyDescription
local ChangeState = Humanoid.ChangeState
local EquipTool = Humanoid.EquipTool
local GetAppliedDescription = Humanoid.GetAppliedDescription
local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
local LoadAnimation = Humanoid.LoadAnimation
local Move = Humanoid.Move
local UnequipTools = Humanoid.UnequipTools
local ScaleTo = HumanoidModel.ScaleTo

local IsFirst = false
local IsHealthEnabled = nil
local IsLockCenter = false
local IsRegistered = false
local IsRunning = false
local LastTime = nil

local math = math
local mathrandom = math.random
local mathsin = math.sin
local nan = 0 / 0
local next = next

local OptionsAccessories = nil
local OptionsApplyDescription = nil
local OptionsBreakJointsDelay = nil
local OptionsClickFling = nil
local OptionsDisableCharacterCollisions = nil
local OptionsDisableHealthBar = nil
local OptionsDisableRigCollisions = nil
local OptionsDefaultFlingOptions = nil
local OptionsHatDrop = nil
local OptionsHideCharacter = nil
local OptionsParentCharacter = nil
local OptionsPermanentDeath = nil
local OptionsRefit = nil
local OptionsRigTransparency = nil
local OptionsSetCameraSubject = nil
local OptionsSetCameraType = nil
local OptionsSetCharacter = nil
local OptionsSetCollisionGroup = nil
local OptionsSimulationRadius = nil
local OptionsTeleportRadius = nil
local OptionsUseServerBreakJoints

local osclock = os.clock

local PreRenderConnection = nil

local RBXScriptConnections = {}

local Refitting = false

local replicatesignal = replicatesignal

local Rig = nil
local RigHumanoid = nil
local RigHumanoidRootPart = nil

local sethiddenproperty = sethiddenproperty
local setscriptable = setscriptable
local stringfind = string.find

local table = table
local tableclear = table.clear
local tablefind = table.find
local tableinsert = table.insert
local tableremove = table.remove

local Targets = {}

local task = task
local taskdefer = task.defer
local taskspawn = task.spawn
local taskwait = task.wait

local Time = nil

local Vector3 = Vector3
local Vector3new = Vector3.new
local FlingVelocity = Vector3new(16384, 16384, 16384)
local HatDropLinearVelocity = Vector3new(0, 27, 0)
local HideCharacterOffset = Vector3new(0, -30, 0)
local Vector3one = Vector3.one
local Vector3xzAxis = Vector3new(1, 0, 1)
local Vector3zero = Vector3.zero
local AntiSleep = Vector3zero

R15Animation.AnimationId = "rbxassetid://507767968"
R6Animation.AnimationId = "rbxassetid://180436148"

Humanoid = nil
Destroy(HumanoidDescription)
HumanoidDescription = nil

local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
for Index, Child in next, GetChildren(Parent) do
if IsA(Child, ClassName) and Child.Name == Name then
return Child
end
end
end

local GetHandleFromTable = function(Table)
for Index, Child in GetChildren(Character) do
if IsA(Child, "Accoutrement") then
local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

if Handle then
local MeshId = nil
local TextureId = nil

if IsA(Handle, "MeshPart") then
MeshId = Handle.MeshId
TextureId = Handle.TextureID
else
local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

if SpecialMesh then
MeshId = SpecialMesh.MeshId
TextureId = SpecialMesh.TextureId
end
end

if MeshId then
if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
return Handle
end
end
end
end
end
end

local NewIndex = function(self, Index, Value)
self[Index] = Value
end

local DescendantAdded = function(Descendant)
if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
if sethiddenproperty then
sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
elseif setscriptable then
setscriptable(Descendant, "BackendAccoutrementState", true)
Descendant.BackendAccoutrementState = 0
end
end
elseif IsA(Descendant, "Attachment") then
local Attachment = Attachments[Descendant.Name]

if Attachment then
local Parent = Descendant.Parent

if IsA(Parent, "BasePart") then
local MeshId = nil
local TextureId = nil

if IsA(Parent, "MeshPart") then
MeshId = Parent.MeshId
TextureId = Parent.TextureID
else
local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

if SpecialMesh then
MeshId = SpecialMesh.MeshId
TextureId = SpecialMesh.TextureId
end
end

if MeshId then
for Index, Table in next, Accessories do
if Table.MeshId == MeshId and Table.TextureId == TextureId then
local Handle = Table.Handle

tableinsert(Aligns, {
LastPosition = Handle.Position,
Offset = CFrameidentity,
Part0 = Parent,
Part1 = Handle
})

return
end
end

for Index, Table in next, OptionsAccessories do
if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
local Instance = nil
local TableName = Table.Name
local TableNames = Table.Names

if TableName then
Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
else
for Index, TableName in next, TableNames do
local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

if not ( TableNames[Index + 1] and Blacklist[Child] ) then
Instance = Child
break
end
end
end

if Instance then
local Blacklisted = Blacklist[Instance]

if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
tableinsert(Aligns, {
Offset = Table.Offset,
Part0 = Parent,
Part1 = Instance
})

Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

return
end
end
end
end

local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

if Accoutrement and IsA(Accoutrement, "Accoutrement") then
local AccoutrementClone = Clone(Accoutrement)

local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
HandleClone.Transparency = OptionsRigTransparency

for Index, Descendant in next, GetDescendants(HandleClone) do
if IsA(Descendant, "JointInstance") then
Destroy(Descendant)
end
end

local AccessoryWeld = Instancenew("Weld")
AccessoryWeld.C0 = Descendant.CFrame
AccessoryWeld.C1 = Attachment.CFrame
AccessoryWeld.Name = "AccessoryWeld"
AccessoryWeld.Part0 = HandleClone
AccessoryWeld.Part1 = Attachment.Parent
AccessoryWeld.Parent = HandleClone

AccoutrementClone.Parent = Rig

tableinsert(Accessories, {
Handle = HandleClone,
MeshId = MeshId,
TextureId = TextureId
})
tableinsert(Aligns, {
Offset = CFrameidentity,
Part0 = Parent,
Part1 = HandleClone
})
end
end
end
end
end
end

local SetCameraSubject = function()
local CameraCFrame = CurrentCamera.CFrame
local Position = RigHumanoidRootPart.CFrame.Position

CurrentCamera.CameraSubject = RigHumanoid
Wait(PreRender)
CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
end

local OnCameraSubjectChanged = function()
if CurrentCamera.CameraSubject ~= RigHumanoid then
taskdefer(SetCameraSubject)
end
end

local OnCameraTypeChanged = function()
if CurrentCamera.CameraType ~= Custom then
CurrentCamera.CameraType = Custom
end
end

local OnCurrentCameraChanged = function()
local Camera = Workspace.CurrentCamera

if Camera and OptionsSetCameraSubject then
CurrentCamera = Workspace.CurrentCamera

taskspawn(SetCameraSubject)

OnCameraSubjectChanged()
tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

if OptionsSetCameraType then
OnCameraTypeChanged()
tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
end
end
end

local SetCharacter = function()
LocalPlayer.Character = Rig
end

local SetSimulationRadius = function()
LocalPlayer.SimulationRadius = OptionsSimulationRadius
end

local WaitForChildOfClass = function(Parent, ClassName)
local Child = FindFirstChildOfClass(Parent, ClassName)

while not Child do
Wait(Parent.ChildAdded)
Child = FindFirstChildOfClass(Parent, ClassName)
end

return Child
end

local WaitForChildOfClassAndName = function(Parent, ...)
local Child = FindFirstChildOfClassAndName(Parent, ...)

while not Child do
Wait(Parent.ChildAdded)
Child = FindFirstChildOfClassAndName(Parent, ...)
end

return Child
end

local Fling = function(Target, Options)
if Target then
local Highlight = Options.Highlight

if IsA(Target, "Humanoid") then
Target = Target.Parent
end
if IsA(Target, "Model") then
Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
end

if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
local Model = FindFirstAncestorOfClass(Target, "Model")

if Model and FindFirstChildOfClass(Model, "Humanoid") then
Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
else
Model = Target
end

if Highlight then
local HighlightObject = type(Highlight) == "boolean" and Highlight and Instancenew("Highlight") or Clone(Highlight)
HighlightObject.Adornee = Model
HighlightObject.Parent = Model

Options.HighlightObject = HighlightObject
tableinsert(Highlights, HighlightObject)
end

Targets[Target] = Options

if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
--replicatesignal(ConnectDiedSignalBackend)
end
end
end
end

local OnCharacterAdded = function(NewCharacter)
if NewCharacter ~= Rig then
tableclear(Aligns)
tableclear(Blacklist)

Character = NewCharacter

if OptionsSetCameraSubject then
taskspawn(SetCameraSubject)
end

if OptionsSetCharacter then
taskdefer(SetCharacter)
end

if OptionsParentCharacter then
Character.Parent = Rig
end

for Index, Descendant in next, GetDescendants(Character) do
taskspawn(DescendantAdded, Descendant)
end

tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

Humanoid = WaitForChildOfClass(Character, "Humanoid")
local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

if IsFirst then
if OptionsApplyDescription and Humanoid then
local AppliedDescription = GetAppliedDescription(Humanoid)
SetAccessories(AppliedDescription, {}, true)
ApplyDescription(RigHumanoid, AppliedDescription)
end

if HumanoidRootPart then
RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

if OptionsSetCollisionGroup then
local CollisionGroup = HumanoidRootPart.CollisionGroup

for Index, Descendant in next, GetDescendants(Rig) do
if IsA(Descendant, "BasePart") then
Descendant.CollisionGroup = CollisionGroup
end
end
end
end

IsFirst = false
end

local IsAlive = true

if HumanoidRootPart then
for Target, Options in next, Targets do
if IsDescendantOf(Target, Workspace) then
local FirstPosition = Target.Position
local PredictionFling = Options.PredictionFling
local LastPosition = FirstPosition
local Timeout = osclock() + Options.Timeout or 1

if HumanoidRootPart then
while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
local DeltaTime = taskwait()
local Position = Target.Position

if ( Position - FirstPosition ).Magnitude > 100 then
break
end

local Offset = Vector3zero

if PredictionFling then
Offset = ( Position - LastPosition ) / DeltaTime * 0.13
end

HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

HumanoidRootPart.CFrame = Target.CFrame + Offset
LastPosition = Position
end
end
end

local HighlightObject = Options.HighlightObject

if HighlightObject then
Destroy(HighlightObject)
end

Targets[Target] = nil
end

HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

if OptionsHatDrop then
taskspawn(function()
WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
AnimationTrack:Stop()
end

LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

local RootPartCFrame = RigHumanoidRootPart.CFrame
RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z)

while IsAlive do
HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
HumanoidRootPart.CFrame = RootPartCFrame

taskwait()
end
end)
elseif OptionsHideCharacter then
local HideCharacterOffset = typeof(OptionsHideCharacter) == "Vector3" and OptionsHideCharacter or HideCharacterOffset
local RootPartCFrame = RigHumanoidRootPart.CFrame + HideCharacterOffset

taskspawn(function()
while IsAlive do
HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
HumanoidRootPart.CFrame = RootPartCFrame

taskwait()
end
end)
elseif OptionsTeleportRadius then
HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
end
end

if OptionsPermanentDeath and replicatesignal then
--replicatesignal(ConnectDiedSignalBackend)

taskwait(Players.RespawnTime + 0.1)

Refitting = false
replicatesignal(Kill)
else
taskwait(OptionsBreakJointsDelay)
end

ModelBreakJoints(Character)

if Humanoid then
if replicatesignal and OptionsUseServerBreakJoints then
replicatesignal(Humanoid.ServerBreakJoints)
end

ChangeState(Humanoid, Dead)
Wait(Humanoid.Died)
end

IsAlive = false

if OptionsHatDrop then
pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
end
end
end

local OnInputBegan = function(InputObject)
if InputObject.UserInputType == MouseButton1 then
local Target = Mouse.Target

local HatFling = OptionsDefaultFlingOptions.HatFling
local ToolFling = OptionsDefaultFlingOptions.ToolFling

if HatFling and OptionsHatDrop then
local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

if not Part then
for Index, Child in GetChildren(Character) do
if IsA(Child, "Accoutrement") then
local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

if Handle then
Part = Handle
break
end
end
end
end

if Part then
Exceptions[Part] = true

while IsMouseButtonPressed(UserInputService, MouseButton1) do
if Part.ReceiveAge == 0 then
Part.AssemblyAngularVelocity = FlingVelocity
Part.AssemblyLinearVelocity = FlingVelocity
Part.CFrame = Mouse.Hit + AntiSleep
end

taskwait()
end

Exceptions[Part] = false
end
elseif ToolFling then
local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
local Tool = nil

if type(ToolFling) == "string" then
Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
end

if not Tool then
Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
end

if Tool then
local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

if Handle then
UnequipTools(Humanoid)
taskwait()
EquipTool(Humanoid, Tool)

while IsMouseButtonPressed(UserInputService, MouseButton1) do
if Handle.ReceiveAge == 0 then
Handle.AssemblyAngularVelocity = FlingVelocity
Handle.AssemblyLinearVelocity = FlingVelocity
Handle.CFrame = Mouse.Hit + AntiSleep
end

taskwait()
end

UnequipTools(Humanoid)

Handle.AssemblyAngularVelocity = Vector3zero
Handle.AssemblyLinearVelocity = Vector3zero
Handle.CFrame = RigHumanoidRootPart.CFrame
end
end
else
Fling(Target, OptionsDefaultFlingOptions)
end
end
end

local OnPostSimulation = function()
Time = osclock()
local DeltaTime = Time - LastTime
LastTime = Time

if not OptionsSetCharacter and IsLockCenter then
local Position = RigHumanoidRootPart.Position
RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
end

if OptionsSimulationRadius then
pcall(SetSimulationRadius)
end

AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
local Axis = 27 + mathsin(Time)

for Index, Table in next, Aligns do
local Part0 = Table.Part0

if not Exceptions[Part0] then
if Part0.ReceiveAge == 0 then
if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
local Part1 = Table.Part1

Part0.AssemblyAngularVelocity = Vector3zero

local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
end
else
local Frames = Table.Frames or - 1
Frames = Frames + 1
Table.Frames = Frames

if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
Refitting = false
--replicatesignal(ConnectDiedSignalBackend)
end
end
end
end

if not OptionsSetCharacter and Humanoid then
Move(RigHumanoid, Humanoid.MoveDirection)
RigHumanoid.Jump = Humanoid.Jump
end

--[[if IsRegistered then
SetCore(StarterGui, "ResetButtonCallback", BindableEvent)
else
IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
end]]
end

local OnPreRender = function()
local Position = RigHumanoidRootPart.Position
RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

for Index, Table in next, Aligns do
local Part0 = Table.Part0

if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
Part0.CFrame = Table.Part1.CFrame * Table.Offset
end
end
end

local OnMouseBehaviorChanged = function()
IsLockCenter = UserInputService.MouseBehavior == LockCenter

if IsLockCenter then
PreRenderConnection = Connect(PreRender, OnPreRender)
tableinsert(RBXScriptConnections, PreRenderConnection)
elseif PreRenderConnection then
Disconnect(PreRenderConnection)
tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
end
end

local OnPreSimulation = function()
if OptionsDisableCharacterCollisions and Character then
for Index, Descendant in next, GetDescendants(Character) do
if IsA(Descendant, "BasePart") then
Descendant.CanCollide = false
end
end
end
if OptionsDisableRigCollisions then
for Index, Descendant in next, GetChildren(Rig) do
if IsA(Descendant, "BasePart") then
Descendant.CanCollide = false
end
end
end
end

Start = function(Options)
if not IsRunning then
IsFirst = true
IsRunning = true

Options = Options or {}
OptionsAccessories = Options.Accessories or {}
OptionsApplyDescription = Options.ApplyDescription
OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
OptionsClickFling = Options.ClickFling
OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
OptionsDisableHealthBar = Options.DisableHealthBar
OptionsDisableRigCollisions = Options.DisableRigCollisions
OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
OptionsHatDrop = Options.HatDrop
OptionsHideCharacter = Options.HideCharacter
OptionsParentCharacter = Options.ParentCharacter
OptionsPermanentDeath = Options.PermanentDeath
OptionsRefit = Options.Refit
local OptionsRigSize = Options.RigSize
OptionsRigTransparency = Options.RigTransparency or 1
OptionsSetCameraSubject = Options.SetCameraSubject
OptionsSetCameraType = Options.SetCameraType
OptionsSetCharacter = Options.SetCharacter
OptionsSetCollisionGroup = Options.SetCollisionGroup
OptionsSimulationRadius = Options.SimulationRadius
OptionsTeleportRadius = Options.TeleportRadius
OptionsUseServerBreakJoints = Options.UseServerBreakJoints

if OptionsDisableHealthBar then
IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
SetCoreGuiEnabled(StarterGui, Health, false)
end

BindableEvent = Instancenew("BindableEvent")
tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
Rig.Name = "non"
RigHumanoid = Rig.Humanoid
RigHumanoidRootPart = Rig.HumanoidRootPart
Rig.Parent = Workspace

local function CreateObject(Name)
local Part = Instance.new("Part")
Part.Name = Name
Part.CanCollide = true
Part.Transparency = 1
Part.Size = Vector3new(0.1, 0.1, 0.1)
Part.Parent = Rig
end

CreateObject("Reanimate_Dummy")
CreateObject("Reanimate_Machete")
CreateObject("Reanimate_Chainsaw")

for Index, Descendant in next, GetDescendants(Rig) do
if IsA(Descendant, "Attachment") then
Attachments[Descendant.Name] = Descendant
elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
Descendant.Transparency = OptionsRigTransparency
end
end

if OptionsRigSize then
ScaleTo(Rig, OptionsRigSize)

RigHumanoid.JumpPower = 50
RigHumanoid.WalkSpeed = 16
end

OnCurrentCameraChanged()
tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

if OptionsClickFling then
tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
end

local Character = LocalPlayer.Character

if Character then
OnCharacterAdded(Character)
end

tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

LastTime = osclock()
tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

if not OptionsSetCharacter then
OnMouseBehaviorChanged()
tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
end

if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
OnPreSimulation()
tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
end

IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)

if not IsRegistered then
taskspawn(function()
for Index = 1, 7 do
if not IsRegistered then
IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
taskwait()
else
break
end
end
end)
end

return {
BindableEvent = BindableEvent,
Fling = Fling,
Rig = Rig
}
end
end

Stop = function()
if IsRunning then
IsFirst = false
IsRunning = false

for Index, Highlight in Highlights do
Destroy(Highlight)
end

tableclear(Highlights)

for Index, RBXScriptConnection in next, RBXScriptConnections do
Disconnect(RBXScriptConnection)
end

tableclear(RBXScriptConnections)

Destroy(BindableEvent)

if Character.Parent == Rig then
Character.Parent = Workspace
end

if Humanoid then
ChangeState(Humanoid, Dead)
end

Destroy(Rig)

if OptionsPermanentDeath and replicatesignal then
replicatesignal(ConnectDiedSignalBackend)
end

if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
end

if IsRegistered then
pcall(SetCore, StarterGui, "ResetButtonCallback", true)
else
IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
end
end
end
end

local Rad = math.rad

Empyrean = Start({
Accessories = {
 -- New Free Hair Limbs
{ MeshId = "319354652", Name = "Left Arm", Offset = CFrame.new(0.15, 0, 0) *  CFrame.Angles(0, -1.57, 0), TextureId = "376186990" },
{ MeshId = "319354652", Name = "Right Arm", Offset = CFrame.new(-0.15, 0, 0) * CFrame.Angles(0, 1.57, 0), TextureId = "304117018" },
{ MeshId = "81642452", Name = "Left Leg", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, Rad(180)), TextureId = "6858317942" },
{ MeshId = "81642452", Name = "Right Leg", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, Rad(180)), TextureId = "6858318826" },
-- New Free Rig
{ MeshId = "4819720316", Name = "Torso", Offset = CFrame.Angles(0, 0, -0.25), TextureId = "4819722776" },
{ MeshId = "3030546036", Name = "Left Arm", Offset = CFrame.new(0.15, 0, 0) *  CFrame.Angles(-1.57, 0, 1.57), TextureId = "3650139425" },
{ MeshId = "4489232754", Name = "Left Arm", Offset = CFrame.new(0.15, -0.65, 0) *  CFrame.Angles(-1.57, 0, 1.57), TextureId = "4584026407" },
{ MeshId = "4324138105", Name = "Right Arm", Offset = CFrame.new(-0.15, 0, 0) * CFrame.Angles(-1.57, 0, -1.57), TextureId = "4391374782" },
{ MeshId = "4154474745", Name = "Right Arm", Offset = CFrame.new(-0.15, -0.65, 0) * CFrame.Angles(-1.57, 0, -1.57), TextureId = "4154474807" },
{ MeshId = "3030546036", Name = "Left Leg", Offset = CFrame.new(-0.15, 0.50, 0) * CFrame.Angles(-1.57, 0, 1.57), TextureId = "3033898741" },
{ MeshId = "3030546036", Name = "Left Leg", Offset = CFrame.new(-0.15, -0.25, 0) *  CFrame.Angles(-1.57, 0, 1.57), TextureId = "3409604993" },
{ MeshId = "4324138105", Name = "Right Leg", Offset = CFrame.new(0.15, 0.50, 0) * CFrame.Angles(-1.57, 0, -1.57), TextureId = "4381699432" },
{ MeshId = "3030546036", Name = "Right Leg", Offset = CFrame.new(0.15, -0.25, 0) * CFrame.Angles(-1.57, 0, -1.57), TextureId = "4645402630" },
-- SB Rig
{ MeshId = "125443585075666", Name = "Torso", Offset = CFrame.Angles(0, 3.15, 0), TextureId = "121023324229475" },
{ MeshId = "121342985816617", Name = "Left Arm", Offset = CFrame.Angles(0, 0, 1.57), TextureId = "129264637819824" },
{ MeshId = "121342985816617", Name = "Right Arm", Offset = CFrame.Angles(0, 3.15, 1.57), TextureId = "129264637819824" },
{ MeshId = "83395427313429", Names = { "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "97148121718581" },--18641142410
-- Prosthetics
{ MeshId = "117554824897780", Name = "Right Leg", Offset = CFrame.Angles(0, -1.57, 0), TextureId = "99077561039115" },
{ MeshId = "123388937940630", Name = "Left Leg", Offset = CFrame.Angles(0, 1.57, 0), TextureId = "99077561039115" },
{ MeshId = "117554824897780", Name = "Right Leg", Offset = CFrame.Angles(0, -1.57, 0), TextureId = "84429400539007" },
{ MeshId = "123388937940630", Name = "Left Leg", Offset = CFrame.Angles(0, 1.57, 0), TextureId = "84429400539007" },
-- Classic Cheap Rig
{ MeshId = "12344206657", Name = "Left Arm", Offset = CFrame.new(0.05, 0.05, -0.075) * CFrame.Angles(-2, 0, 0), TextureId = "12344206675" },
{ MeshId = "12344207333", Name = "Right Arm", Offset = CFrame.new(-0.05, 0.05, -0.075) * CFrame.Angles(-1.95, 0, 0), TextureId = "12344207341" },
{ MeshId = "11159370334", Name = "Left Leg", Offset = CFrame.Angles(1.57, 1.57, 0), TextureId = "11159284657" },
{ MeshId = "11263221350", Name = "Right Leg", Offset = CFrame.Angles(1.57, -1.57, 0), TextureId = "11263219250" },
-- Grey Mesh Rig 
{ MeshId = "127552124837034", Names = {"Torso"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "131014325980101" },--14255556501
{ MeshId = "117287001096396", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "120169691545791" },--14255556501
{ MeshId = "121304376791439", Names = { "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 0), TextureId = "131014325980101" },--18641142410
-- Classical Products rig (white/black arms)
{ MeshId = "14241018198", Names = {"Torso"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14251599953" },
{ MeshId = "17374767929", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17374768001" },
{ MeshId = "17387586286", Names = { "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17387586304" },
{ MeshId = "14255522247", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14255543546" },
-- Noob Rig
{ MeshId = "18640899369", Name = "Torso", Offset = CFrame.Angles(0, 0, 0), TextureId = "18640899481" },
{ MeshId = "18640914129", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "18640914168" },
{ MeshId = "18640901641", Names = { "Left Leg", "Right Leg"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "18640901676" },
-- Genesis Black Rig
{ MeshId = "110684113028749", Name = "Torso", Offset = CFrame.identity, TextureId = "70661572547971" },
{ MeshId = "125405780718494", Name = "Left Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "136752500636691" },
{ MeshId = "125405780718494", Name = "Right Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "136752500636691" },
{ MeshId = "125405780718494", Name = "Left Leg", Offset = CFrame.Angles(0, 0, Rad(90)), TextureId = "136752500636691" },
{ MeshId = "125405780718494", Name = "Right Leg", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "136752500636691" },
-- Genesis White Rig
{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "130689541138804" },
{ MeshId = "99608462237958", Name = "Left Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "130809869695496" },
{ MeshId = "139733645770094", Name = "Right Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "130809869695496" },
{ MeshId = "105141400603933", Name = "Left Leg", Offset = CFrame.Angles(0, 0, Rad(90)), TextureId = "71060417496309" },
{ MeshId = "90736849096372", Name = "Right Leg", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "79186624401216" },
-- request
{ MeshId = "14768666349", Name = "Torso", Offset = CFrame.Angles(0, 0, 0), TextureId = "14768664565" },
{ MeshId = "14768684979", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14768683674" },
-- Align Set 1
{ MeshId = "135808007671052", TextureId = "129165992031838", Name = "Reanimate_Chainsaw", Offset = CFrame.new(-0.25, 0, 0.35) * CFrame.Angles(Rad(90), Rad(180), Rad(125)) }, 
{ MeshId = "125501940751001", TextureId = "129165992031838", Name = "Reanimate_Machete", Offset = CFrame.new(-0.05, -0.135, 0) * CFrame.Angles(Rad(70), 0, Rad(0))},
{ MeshId = "94956206180762", TextureId = "112319145642796", Name = "Reanimate_Dummy", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(Rad(0), 0, Rad(0))},
-- Align Set 2
{ MeshId = "18877041274", TextureId = "15571367979", Name = "Reanimate_Chainsaw", Offset = CFrame.new(-0.25, 0, 0.35) * CFrame.Angles(Rad(90), Rad(180), Rad(245)) }, 
{ MeshId = "14774855654", TextureId = "14774857315", Name = "Reanimate_Machete", Offset = CFrame.new(-0.05, -0.135, 0) * CFrame.Angles(Rad(0), Rad(90), Rad(180))},
{ MeshId = "124729674585433", TextureId = "71699258800359", Name = "Reanimate_Dummy", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(Rad(0), 0, Rad(0))},
-- Align Set 3
{ MeshId = "115178247400872", TextureId = "86122500644080", Name = "Reanimate_Chainsaw", Offset = CFrame.new(-0.25, 0, 0.35) * CFrame.Angles(Rad(-180), Rad(55), Rad(-90)) }, 
{ MeshId = "13791142719", TextureId = "13782111883", Name = "Reanimate_Machete", Offset = CFrame.new(0, 0.5, 0) * CFrame.Angles(Rad(45), Rad(0), Rad(0))},
{ MeshId = "81761678528796", TextureId = "87385382902155", Name = "Reanimate_Dummy", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(Rad(0), 0, Rad(0))},
-- Align Set 4
{ MeshId = "75581217916621", TextureId = "80038088613380", Name = "Reanimate_Chainsaw", Offset = CFrame.new(0, 0, 2) * CFrame.Angles(Rad(90), Rad(0), Rad(-45)) }, 
{ MeshId = "82172856362897", TextureId = "119056195093421", Name = "Reanimate_Machete", Offset = CFrame.new(0, -0.5, 0.1) * CFrame.Angles(Rad(45), Rad(90), Rad(0))},
{ MeshId = "137246576921101", TextureId = "117921839013255", Name = "Reanimate_Dummy", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(Rad(0), 0, Rad(0))},
-- Align Set 5
{ MeshId = "75581217916621", TextureId = "80038088613380", Name = "Reanimate_Chainsaw", Offset = CFrame.new(0, 0, 2) * CFrame.Angles(Rad(90), Rad(0), Rad(-45)) }, 
{ MeshId = "82172856362897", TextureId = "119056195093421", Name = "Reanimate_Machete", Offset = CFrame.new(0, -0.5, 0.1) * CFrame.Angles(Rad(45), Rad(90), Rad(0))},
{ MeshId = "137246576921101", TextureId = "117921839013255", Name = "Reanimate_Dummy", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(Rad(0), 0, Rad(0))},
-- Align Set 6
{ MeshId = "5254583415", TextureId = "5268538095", Name = "Reanimate_Chainsaw", Offset = CFrame.new(0, 0, 2) * CFrame.Angles(Rad(0), Rad(-35), Rad(90)) }, 
{ MeshId = "4315410540", TextureId = "", Name = "Reanimate_Machete", Offset = CFrame.new(0, -1.5, 0.1) * CFrame.Angles(Rad(45), Rad(90), Rad(0))},
{ MeshId = "137246576921101", TextureId = "136291455301053", Name = "Reanimate_Dummy", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(Rad(0), 0, Rad(0))},
-- Align Set 7
{ MeshId = "5254583415", TextureId = "5268538095", Name = "Reanimate_Chainsaw", Offset = CFrame.new(0, 0, 2) * CFrame.Angles(Rad(0), Rad(-35), Rad(90)) }, 
{ MeshId = "4315410540", TextureId = "", Name = "Reanimate_Machete", Offset = CFrame.new(0, -1.5, 0.1) * CFrame.Angles(Rad(45), Rad(90), Rad(0))},
{ MeshId = "137246576921101", TextureId = "136291455301053", Name = "Reanimate_Dummy", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(Rad(0), 0, Rad(0))},
-- Align Set 8
{ MeshId = "71421186110817", TextureId = "75858497774258", Name = "Reanimate_Chainsaw", Offset = CFrame.new(0, 0, 0.1) * CFrame.Angles(Rad(90), Rad(0), Rad(175))},
{ MeshId = "136044359353275", TextureId = "75858497774258", Name = "Reanimate_Machete", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(Rad(-45), Rad(0), Rad(0)) }, 
{ MeshId = "18100673275", TextureId = "18100673353", Name = "Reanimate_Dummy", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(Rad(0), 0, Rad(0))},
-- Align Set 9
{ MeshId = "5254583415", TextureId = "5268538095", Name = "Reanimate_Chainsaw", Offset = CFrame.new(0, 0, 2) * CFrame.Angles(Rad(0), Rad(-35), Rad(90)) }, 
{ MeshId = "4315410540", TextureId = "", Name = "Reanimate_Machete", Offset = CFrame.new(0, -1.5, 0.1) * CFrame.Angles(Rad(45), Rad(90), Rad(0))},
{ MeshId = "137246576921101", TextureId = "136291455301053", Name = "Reanimate_Dummy", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(Rad(0), 0, Rad(0))},
-- Align Set 10
{ MeshId = "17167152679", TextureId = "17167135180", Name = "Reanimate_Chainsaw", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(Rad(0), Rad(145), Rad(275)) }, 
{ MeshId = "97187257652488", TextureId = "138192604736537", Name = "Reanimate_Machete", Offset = CFrame.new(0, 0.10, -0.25) * CFrame.Angles(Rad(65), Rad(0), Rad(0))},
{ MeshId = "132522357304308", TextureId = "100110065619259", Name = "Reanimate_Dummy", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(Rad(0), 0, Rad(0))},
-- Free Align Set 1
{ MeshId = "7547179386", TextureId = "7547152243", Name = "Reanimate_Chainsaw", Offset = CFrame.new(0, -0.25, 0) * CFrame.Angles(Rad(90), Rad(0), Rad(-145)) }, 
{ MeshId = "11524268570", TextureId = "11524268595", Name = "Reanimate_Machete", Offset = CFrame.new(0.25, 0, 0) * CFrame.Angles(Rad(125), 0, Rad(180))},
{ MeshId = "12495661615", TextureId = "12495666203", Name = "Reanimate_Dummy", Offset = CFrame.new(0, -1, 0)},
},
ApplyDescription = true,
BreakJointsDelay = 0.255,
ClickFling = false,
DefaultFlingOptions = {
HatFling = false,
Highlight = false,
PredictionFling = false,
Timeout = 0.45,
ToolFling = false,
},
DisableCharacterCollisions = true,
DisableHealthBar = true,
DisableRigCollisions = true,
HatDrop = false,
HideCharacter = Vector3.new(0, -30, 0),
ParentCharacter = true,
PermanentDeath = false,
Refit = true,
RigSize = 1,
RigTransparency = 1,
R15 = false,
SetCameraSubject = true,
SetCameraType = true,
SetCharacter = false,
SetCollisionGroup = true,
SimulationRadius = 2147483647,
TeleportRadius = 12,
UseServerBreakJoints = true,
})

DefaultFlingOptions = {
HatFling = false,
Highlight = true,
PredictionFling = true,
Timeout = 0.25,
ToolFling = false,
}

local script = game:GetObjects(getcustomasset("FESaken/PursuerJason.rbxmx"))[1]
local Animations = script:WaitForChild("Animations")
local Idle, Walking, Running, Enraged = false, false, false, false
local Debounce, Shift, CanSlash = false, false, false
local AnimatorModule = loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/51f4829e57f3c5d5357f0be11d39d081/raw/1eb85e21d0fa325b40e53036708b3d5c2c0f9acb/JasonAnimator.lua"))()
local UserInputService = game:GetService("UserInputService")
local Player = game:GetService("Players").LocalPlayer
local Character = Empyrean.Rig
local Head = Character:WaitForChild("Head")
local Torso = Character:WaitForChild("Torso")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")
Humanoid.WalkSpeed = 13
pcall(function() Character:FindFirstChild("Animate"):Destroy() Humanoid:FindFirstChild("Animator"):Destroy() end)

local function CreateWeld(Parent, Part0, Part1)
local Weld = Instance.new("Weld")
Weld.Parent = Parent
Weld.Part0 = Part0
Weld.Part1 = Part1
end

Theme.Parent = RootPart
Theme:Play()

local GUI = script.UIs:WaitForChild("TemporaryUI")
GUI.Parent = game:GetService("CoreGui")
local AbilityContainer = GUI:WaitForChild("AbilityContainer")
GUI.PlayerInfo.PlayerIcon.Image = "rbxthumb://type=AvatarHeadShot&id=" .. Player.UserId .. "&w=420&h=420"

local ReanimateDummy = Character:WaitForChild("Reanimate_Dummy")
local ReanimateChainsaw = Character:WaitForChild("Reanimate_Chainsaw")
local ReanimateMachete = Character:WaitForChild("Reanimate_Machete")

local Machete = script.Weapons:WaitForChild("Machete"):Clone()
Machete:FindFirstChild("Machete").Transparency = 1
Machete.Parent = Character
Machete.Transparency =  1
Machete.CanTouch = true
local Chainsaw = script.Weapons:WaitForChild("Chainsaw"):Clone()
Chainsaw.Parent = Character
Chainsaw.Transparency = 1
local ChainsawWeld = script.Welds.Chainsaw:Clone()
ChainsawWeld.Parent = RootPart
ChainsawWeld.Part0 = RootPart
ChainsawWeld.Part1 = Chainsaw

local MacheteWeld = script.Welds.Machete:Clone()
MacheteWeld.Parent = RootPart
MacheteWeld.Part0 = RootPart
MacheteWeld.Part1 = Machete

local DummyWeld = Instance.new("Weld")
DummyWeld.Parent = RootPart
DummyWeld.Part0 = RootPart
DummyWeld.Part1 = ReanimateDummy
DummyWeld.C0 = CFrame.new(0, -15, 0)

CreateWeld(Character, Machete, ReanimateMachete)
CreateWeld(Character, Chainsaw, ReanimateChainsaw)

local function PlaySound(SoundID, TimePosition)
local Sound = Instance.new("Sound")
Sound.SoundId = getcustomasset(Path..SoundID)
Sound.Volume = 1
Sound.TimePosition = TimePosition
Sound.Parent = RootPart
Sound.PlayOnRemove = true
Sound:Destroy()
end

local Dummy = script.Extras.NPC
for i, v in ipairs(Dummy:GetDescendants()) do
if v:IsA("Accessory") or v:IsA("Decal") or v:IsA("BodyColors") or v:IsA("Shirt") or v:IsA("Pants") then
v:Destroy()
else if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
v.Transparency = 1
v.Color = Color3.fromRGB(170, 170, 170)
end
end
end

function PlayAnim(Rig, Animation, AnimFade, AnimSpeed)
if not AnimatorModule[Rig] then
AnimatorModule[Rig] = {}
end
if not AnimatorModule[Rig][Animation.Name] then
AnimatorModule[Rig][Animation.Name] = AnimatorModule:LoadAnimation(Rig, Animation)
end
for Animation, Track in next, AnimatorModule[Rig] do
if Animation ~= Animation.Name then
Track:Stop()
end
end
if not AnimatorModule[Rig][Animation.Name].IsPlaying then
AnimatorModule[Rig][Animation.Name]:Play(AnimFade or 1, AnimSpeed or 1)
end
end

function StopAnim(Rig, Anim)
if not AnimatorModule[Rig] then
AnimatorModule[Rig] = {}
end
if not AnimatorModule[Rig][Anim.Name] then
AnimatorModule[Rig][Anim.Name] = AnimatorModule:LoadAnimation(Rig, Anim)
end
AnimatorModule[Rig][Anim.Name]:Stop()
end

function Slash()
if Debounce then return end
Debounce = true
CanSlash = true
Humanoid.WalkSpeed = 3
PlayAnim(Character, Animations.Slash, 0.1, 1)
PlaySound("PursuerPunch.ogg", 0)
task.wait(0.65)
Debounce = false
CanSlash = false
if Shift == true then
Humanoid.WalkSpeed = 24
else
Humanoid.WalkSpeed = 13	
end
if RootPart.Velocity.Magnitude < 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
Idle = true
Walking = false
Running = false
if Enraged then
PlayAnim(Character, Animations.EnragedIdle, 0, 1)
else
PlayAnim(Character, Animations.Idle, 0, 1)
end
elseif RootPart.Velocity.Magnitude > 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
Idle = false
Walking = true
Running = false
if Enraged then
PlayAnim(Character, Animations.EnragedWalk, 0, 1)
else
PlayAnim(Character, Animations.Walk, 0, 1)
end
end 
end

function Behead()
if Debounce then return end
Debounce = true
CanSlash = true
Humanoid.WalkSpeed = 3
PlayAnim(Character, Animations.Behead, 0.1, 1)
task.wait(0.85)
Debounce = false
CanSlash = false
if RootPart.Velocity.Magnitude < 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
Idle = true
Walking = false
Running = false
if Enraged then
PlayAnim(Character, Animations.EnragedIdle, 0, 1)
else
PlayAnim(Character, Animations.Idle, 0, 1)
end
elseif RootPart.Velocity.Magnitude > 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
Idle = false
Walking = true
Running = false
if Enraged then
PlayAnim(Character, Animations.EnragedWalk, 0, 1)
else
PlayAnim(Character, Animations.Walk, 0, 1)
end
end
if Shift == true then
Humanoid.WalkSpeed = 24
else
Humanoid.WalkSpeed = 13	
end
end

local function Gash()
if Debounce then return end
Debounce = true
PlaySound("PursuerGash.ogg", 1)
Humanoid.AutoRotate = false
local NPC = Dummy:Clone()
NPC.Parent = workspace
local NPCRootPart = NPC:FindFirstChild("HumanoidRootPart")
NPCRootPart.Anchored = true
RootPart.Anchored = true
NPCRootPart.CFrame = CFrame.lookAt(RootPart.Position + (RootPart.CFrame.LookVector * 2.5), RootPart.Position) * CFrame.new(0, 0, -3) * CFrame.Angles(0, math.rad(180), 0)
PlayAnim(Character, Animations.GashingWound_KillerRig, 0, 2)
PlayAnim(NPC, Animations.GashingWound_PlayerRig, 0, 2)
DummyWeld.Part0 = NPC:FindFirstChild("Torso")
DummyWeld.Part1 = ReanimateDummy
DummyWeld.C0 = CFrame.new(0, 0, 0)
task.wait(2.65)
NPC:Destroy()
DummyWeld.Part0 = RootPart
DummyWeld.Part1 = ReanimateDummy
DummyWeld.C0 = CFrame.new(0, -15, 0)
RootPart.Anchored = false
Debounce = false
Humanoid.AutoRotate = true
if RootPart.Velocity.Magnitude < 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
Idle = true
Walking = false
Running = false
if Enraged then
PlayAnim(Character, Animations.EnragedIdle, 0, 1)
else
PlayAnim(Character, Animations.Idle, 0, 1)
end
elseif RootPart.Velocity.Magnitude > 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
Idle = false
Walking = true
Running = false
if Enraged then
PlayAnim(Character, Animations.EnragedWalk, 0, 1)
else
PlayAnim(Character, Animations.Walk, 0, 1)
end
end
if Shift == true then
Humanoid.WalkSpeed = 24
else
Humanoid.WalkSpeed = 13	
end
end

local function ToggleRage()
if Debounce then return end
Enraged = not Enraged
Debounce = true
if Enraged then
PlaySound("PursuerRage.ogg", 1)
PlayAnim(Character, Animations.EnragedStart, 0, 1)
task.wait(0.15)
task.wait(1)
Debounce = false
if RootPart.Velocity.Magnitude < 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
Idle = true
Walking = false
Running = false
PlayAnim(Character, Animations.EnragedIdle, 0, 1)
elseif RootPart.Velocity.Magnitude > 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
Idle = false
Walking = true
Running = false
PlayAnim(Character, Animations.EnragedWalk, 0, 1)
end	
else
Debounce = false
if RootPart.Velocity.Magnitude < 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
Idle = true
Walking = false
Running = false
PlayAnim(Character, Animations.Idle, 0, 1)
elseif RootPart.Velocity.Magnitude > 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
Idle = false
Walking = true
Running = false
PlayAnim(Character, Animations.Walk, 0, 1)
end	
end
if Shift == true then
Humanoid.WalkSpeed = 24
else
Humanoid.WalkSpeed = 13	
end
end

local function Execute()
if Debounce then return end
Debounce = true
Humanoid.AutoRotate = false
local NPC = Dummy:Clone()
NPC.Parent = workspace
local NPCRootPart = NPC:FindFirstChild("HumanoidRootPart")
NPCRootPart.Anchored = true
RootPart.Anchored = true
NPCRootPart.CFrame = CFrame.lookAt(RootPart.Position + (RootPart.CFrame.LookVector * 2.5), RootPart.Position) * CFrame.new(0, 0, -3) * CFrame.Angles(0, math.rad(180), 0)
PlayAnim(Character, Animations.Execution_KillerRig, 0, 2)
PlayAnim(NPC, Animations.Execution_PlayerRig, 0, 2)
DummyWeld.Part0 = NPC:FindFirstChild("Torso")
DummyWeld.Part1 = ReanimateDummy
DummyWeld.C0 = CFrame.new(0, 0, 0)
task.wait(1.15)
NPC:Destroy()
DummyWeld.Part0 = RootPart
DummyWeld.Part1 = ReanimateDummy
DummyWeld.C0 = CFrame.new(0, -15, 0)
RootPart.Anchored = false
Debounce = false
Humanoid.AutoRotate = true
if RootPart.Velocity.Magnitude < 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
Idle = true
Walking = false
Running = false
if Enraged then
PlayAnim(Character, Animations.EnragedIdle, 0, 1)
else
PlayAnim(Character, Animations.Idle, 0, 1)
end
elseif RootPart.Velocity.Magnitude > 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
Idle = false
Walking = true
Running = false
if Enraged then
PlayAnim(Character, Animations.EnragedWalk, 0, 1)
else
PlayAnim(Character, Animations.Walk, 0, 1)
end
end
if Shift == true then
Humanoid.WalkSpeed = 24
else
Humanoid.WalkSpeed = 13	
end
end

local function Stun()
if Debounce then return end
Debounce = true
RootPart.Anchored = true
PlaySound("PursuerStun.ogg", 1)
PlayAnim(Character, Animations.Stunned_Start, 0, 1)
task.wait(0.65)
PlayAnim(Character, Animations.Stunned_Loop, 0, 1)        
task.wait(0.65)
PlayAnim(Character, Animations.Stunned_End, 0, 1)
task.wait(0.65)
RootPart.Anchored = false
Debounce = false
if Shift == true then
Humanoid.WalkSpeed = 24
else
Humanoid.WalkSpeed = 13	
end
if RootPart.Velocity.Magnitude < 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
Idle = true
Walking = false
Running = false
if Enraged then
PlayAnim(Character, Animations.EnragedIdle, 0, 1)
else
PlayAnim(Character, Animations.Idle, 0, 1)
end
elseif RootPart.Velocity.Magnitude > 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
Idle = false
Walking = true
Running = false
if Enraged then
PlayAnim(Character, Animations.EnragedWalk, 0, 1)
else
PlayAnim(Character, Animations.Walk, 0, 1)
end
end 
end

local ShitlockController = Player.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("CameraModule"):WaitForChild("MouseLockController")
ShitlockController:FindFirstChild("BoundKeys").Value = "LeftControl, RightControl"

UserInputService.InputBegan:Connect(function(Key, GPE)
if GPE then return end
if Key.UserInputType == Enum.UserInputType.MouseButton1 then
Slash()
end
if Key.KeyCode == Enum.KeyCode.Q then
Behead()
end
if Key.KeyCode == Enum.KeyCode.E then
Gash()
end 
if Key.KeyCode == Enum.KeyCode.R then
ToggleRage()
end
if Key.KeyCode == Enum.KeyCode.One then
Stun()
end
if Key.KeyCode == Enum.KeyCode.Z then
Execute()
end
if Key.KeyCode == Enum.KeyCode.LeftShift or Key.KeyCode == Enum.KeyCode.RightShift then
Shift = true
Humanoid.WalkSpeed = 24
end
end)

UserInputService.InputEnded:Connect(function(Key)
if Key.KeyCode == Enum.KeyCode.LeftShift or Key.KeyCode == Enum.KeyCode.RightShift then
Shift = false
Humanoid.WalkSpeed = 13
end
end)

AbilityContainer.Slash.MouseButton1Down:Connect(function()
Slash()
end)

AbilityContainer.Behead.MouseButton1Down:Connect(function()
Behead()
end)

AbilityContainer.RagingPace.MouseButton1Down:Connect(function()
ToggleRage()
end)

AbilityContainer.GashingWound.MouseButton1Down:Connect(function()
Gash()
end)

Machete.Touched:Connect(function(Hit)
if not CanSlash then return end
if Hit:IsDescendantOf(Character) then return end
local Target = Hit.Parent
local TargetHumanoid = Target:FindFirstChildOfClass("Humanoid")
if TargetHumanoid then
Empyrean.Fling(Hit, DefaultFlingOptions)
end
end)

game:GetService("RunService").Heartbeat:Connect(function()
Humanoid.CameraOffset = Humanoid.CameraOffset:Lerp((RootPart.CFrame * CFrame.new(0, 1.5, 0)):PointToObjectSpace(Head.Position),  math.clamp(8 * 60 * 60, 0, 1))
for i,v in ipairs(Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks()) do
v:Stop(0)
end
if Debounce then
StopAnim(Character,Animations.Idle)
StopAnim(Character,Animations.Walk)
StopAnim(Character,Animations.Sprinting)
end
local HitFloor, HitPosition = workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character)
local TorsoVelocity = (RootPart.Velocity).Magnitude
local TorsoVerticalVelocity = RootPart.Velocity.Y
if TorsoVelocity < 1 and HitFloor ~= nil and Debounce == false then
if Idle == false and Enraged == false then
Idle = true
PlayAnim(Character,Animations.Idle, 0, 1)
elseif Idle == false and Enraged == true then
Idle = true
PlayAnim(Character,Animations.EnragedIdle, 0, 1)
end
Walking = false
Running = false
StopAnim(Character,Animations.Sprinting)
StopAnim(Character,Animations.Walk)
elseif TorsoVelocity > 1 and HitFloor ~= nil and Debounce == false and Shift == true then
if Running == false and Enraged == false then
Running = true
PlayAnim(Character,Animations.Sprinting, 0, 2)
elseif Running == false and Enraged == true then
Running = true
PlayAnim(Character,Animations.EnragedRun, 0, 2)
end
Idle = false
Walking = false
StopAnim(Character,Animations.Walk)
StopAnim(Character,Animations.Idle)
elseif TorsoVelocity > 1 and HitFloor ~= nil and Debounce == false then
if Walking == false and Enraged == false then
Walking = true
PlayAnim(Character, Animations.Walk, 0, 1)
elseif Walking == false and Enraged == true then
Walking = true
PlayAnim(Character,Animations.EnragedWalk, 0, 1)
end
Idle = false
Running = false
StopAnim(Character,Animations.Sprinting)
StopAnim(Character,Animations.Idle)
end
end)
