local TweenService = game:GetService("TweenService")
local info = TweenInfo.new(1)
local camera = game.Workspace.CurrentCamera
local CamParts = game.Workspace:WaitForChild("TeleportAnimParts"):WaitForChild("BuildShop")

local goals = {}
goals.CFrame = CamParts["2"].CFrame

local tweenToCam2 = TweenService:Create(camera, info, goals)

local goals2 = {}
goals2.CFrame = CamParts["4"].CFrame

local tweenToCam4 = TweenService:Create(camera, info, goals2)

local BuildAnimEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("TeleportBuildAnim")
local player = game.Players.LocalPlayer
local BuildTutorial = player.PlayerGui:WaitForChild("ConfirmationsGui"):WaitForChild("BuildShop")

local debounce = false
BuildAnimEvent.OnClientEvent:Connect(function()
	if debounce then return end
	debounce = true
	
	camera.CameraType = Enum.CameraType.Scriptable
	camera.CFrame = CamParts["1"].CFrame
	
	tweenToCam2:Play()
	
	wait(1)
	camera.CFrame = CamParts["3"].CFrame
	
	tweenToCam4:Play()
	
	wait(1)
	
	camera.CameraType = Enum.CameraType.Custom
	debounce = false
	
	if player.leaderstats:GetAttribute("WentToBuildShop") then
		BuildTutorial:Destroy()
	else
		BuildTutorial.Visible = true
	end
end)