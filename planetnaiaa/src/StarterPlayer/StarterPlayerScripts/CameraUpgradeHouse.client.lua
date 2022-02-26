local rep = game.ReplicatedStorage
local ChangeCamToHouseEvent = rep:WaitForChild("Remotes"):WaitForChild("Camera"):WaitForChild("CameraToHouseUpgrade")
local player = game.Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera

ChangeCamToHouseEvent.OnClientEvent:Connect(function(playerCurrentHouse)
	
	player.PlayerGui.ScreenGui.Enabled = false
	
	Camera.CameraType = Enum.CameraType.Scriptable
	local maxLength = math.max(playerCurrentHouse:GetExtentsSize().Z, playerCurrentHouse:GetExtentsSize().Y)/2
	local CenterCF = playerCurrentHouse:GetBoundingBox()
	Camera.CFrame = CFrame.new(CenterCF.p + Vector3.new( maxLength/math.tan(math.rad(35)) + playerCurrentHouse:GetExtentsSize().Z/2, 0, 0), CenterCF.p)
	
	wait(5)
	
	player.PlayerGui.ScreenGui.Enabled = true
	Camera.CameraType = Enum.CameraType.Custom
end)

