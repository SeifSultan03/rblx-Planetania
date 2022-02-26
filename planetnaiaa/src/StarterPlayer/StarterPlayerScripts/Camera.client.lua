
while not success do
	success = pcall(function()
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", false)
		game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
		game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
	end)
	if success then
		break
	else
		print'coregui being slow for ResetButtonCallback'
	end
	wait(.2)
end

local Camera = game.Workspace.CurrentCamera
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

char:WaitForChild("Humanoid").Died:Connect(function()
	player:Kick("Unkown error.")
end)
local CamFolder = game.Workspace:WaitForChild("Cameras")
local EventToBlocks = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Camera"):WaitForChild("ChangePlrCamera")

local TweenService = game:GetService("TweenService")
local Info = TweenInfo.new(0.3)

local ScreenGui = player.PlayerGui:WaitForChild("ScreenGui")
local MoveCameraGui = player.PlayerGui:WaitForChild("MoveCameraGui")
local CodesGui = player.PlayerGui:WaitForChild("CodeButton")
local MinigamesGui = player.PlayerGui:WaitForChild("MinigameScreen")
local LeftButton = MoveCameraGui:WaitForChild("LeftButton")
local RightButton = MoveCameraGui:WaitForChild("RightButton")
local ExitButton = MoveCameraGui:WaitForChild("ExitButton")

local debounce = false
local CurrentPart
local function ChangeCamCFtoPart(partName)
	if debounce then return end
	if CamFolder:FindFirstChild(partName) then
		debounce = true
		print("Found CameraPart")
		local CamPart = CamFolder:FindFirstChild(partName)
		CurrentPart = CamPart.Name
		Camera.CameraType = Enum.CameraType.Scriptable
		local goals ={}
		goals.CFrame = CamPart.CFrame
		local tween = TweenService:Create(Camera, Info, goals)
		tween:Play()
		wait(0.1)
		debounce = false
	end
end

EventToBlocks.OnClientEvent:Connect(function(partName)
	ScreenGui.Enabled = false
	MoveCameraGui.Enabled = true
	CodesGui.Enabled = false
	MinigamesGui.Enabled = false
	ChangeCamCFtoPart(partName)
end)

LeftButton.MouseButton1Down:Connect(function()
	
	if not CurrentPart then player:Kick("Error Camera 42 local. Report to Killerz#6091") return end
	
	local number = tonumber(CurrentPart)
	local target = number - 1
	local targetName = tostring(target)
	ChangeCamCFtoPart(targetName)
end)

RightButton.MouseButton1Down:Connect(function()

	if not CurrentPart then player:Kick("Error Camera 52 local. Report to Killerz#6091") return end

	local number = tonumber(CurrentPart)
	local target = number + 1
	local targetName = tostring(target)
	ChangeCamCFtoPart(targetName)
end)

ExitButton.MouseButton1Down:Connect(function()
	Camera.CameraType = Enum.CameraType.Custom
	ScreenGui.Enabled = true
	MoveCameraGui.Enabled = false
	CodesGui.Enabled = true
	MinigamesGui.Enabled = true
end)