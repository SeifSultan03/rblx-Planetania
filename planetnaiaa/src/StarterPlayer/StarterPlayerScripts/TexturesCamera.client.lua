local Camera = game.Workspace.CurrentCamera
local player = game.Players.LocalPlayer
local ColorsEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Camera"):WaitForChild("TexturesShop")

local TweenService = game:GetService("TweenService")
local Info = TweenInfo.new(0.3)

local ScreenGui = player.PlayerGui:WaitForChild("ScreenGui")
local MoveCameraGui = player.PlayerGui:WaitForChild("MoveCameraTextures")
local CodesGui = player.PlayerGui:WaitForChild("CodeButton")
local MinigamesGui = player.PlayerGui:WaitForChild("MinigameScreen")
local LeftButton = MoveCameraGui:WaitForChild("LeftButton")
local RightButton = MoveCameraGui:WaitForChild("RightButton")
local UpButton = MoveCameraGui:WaitForChild("UpButton")
local DownButton = MoveCameraGui:WaitForChild("DownButton")
local ZoomInButton = MoveCameraGui:WaitForChild("ZoomInButton")
local ZoomOutButton = MoveCameraGui:WaitForChild("ZoomOutButton")

local ExitButton = MoveCameraGui:WaitForChild("ExitButton")

local debounce = false

ColorsEvent.OnClientEvent:Connect(function()
	ScreenGui.Enabled = false
	CodesGui.Enabled = false
	MinigamesGui.Enabled = false
	Camera.CameraType = Enum.CameraType.Scriptable
	Camera.CFrame = game.Workspace:WaitForChild("Cameras"):WaitForChild("PreTexturesShop").CFrame
	wait(0.5)
	local goals = {}
	goals.CFrame = game.Workspace.Cameras.TexturesShop.CFrame
	local tween = TweenService:Create(Camera, TweenInfo.new(1), goals)
	tween:Play()
	wait(1)
	MoveCameraGui.Enabled = true
end)

LeftButton.MouseButton1Down:Connect(function()
	if Camera.CFrame.X <= 80 then
		local goals = {}
		goals.CFrame = Camera.CFrame + Vector3.new(10, 0, 0)
		
		local tween = TweenService:Create(Camera, Info, goals)
		tween:Play()
	end
end)

RightButton.MouseButton1Down:Connect(function()
	if Camera.CFrame.X >= -70 then
		local goals = {}
		goals.CFrame = Camera.CFrame - Vector3.new(10, 0, 0)

		local tween = TweenService:Create(Camera, Info, goals)
		tween:Play()
	end
end)

UpButton.MouseButton1Down:Connect(function()
	if Camera.CFrame.Y <= 220 then
		local goals = {}
		goals.CFrame = Camera.CFrame + Vector3.new(0, 10, 0)

		local tween = TweenService:Create(Camera, Info, goals)
		tween:Play()
	end
end)

DownButton.MouseButton1Down:Connect(function()
	if Camera.CFrame.Y >= 90 then
		local goals = {}
		goals.CFrame = Camera.CFrame - Vector3.new(0, 10, 0)

		local tween = TweenService:Create(Camera, Info, goals)
		tween:Play()
	end
end)

ZoomInButton.MouseButton1Down:Connect(function()
	if Camera.CFrame.Z <= 600 then
		local goals = {}
		goals.CFrame = Camera.CFrame + Vector3.new(0, 0, 10)

		local tween = TweenService:Create(Camera, Info, goals)
		tween:Play()
	end
end)

ZoomOutButton.MouseButton1Down:Connect(function()
	if Camera.CFrame.Z >= 580 then
		local goals = {}
		goals.CFrame = Camera.CFrame - Vector3.new(0, 0, 10)

		local tween = TweenService:Create(Camera, Info, goals)
		tween:Play()
	end
end)


ExitButton.MouseButton1Down:Connect(function()
	Camera.CameraType = Enum.CameraType.Custom
	ScreenGui.Enabled = true
	CodesGui.Enabled = true
	MinigamesGui.Enabled = true
	MoveCameraGui.Enabled = false
end)