local AcceptTeleportRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("AcceptTeleport")
local InviteFrame = script.Parent.Parent
local ScreenGui = script.Parent.Parent.Parent.Parent:WaitForChild("ScreenGui")

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local playerFolder = game.Workspace:WaitForChild(player.Name.."f")

script.Parent.MouseButton1Down:Connect(function()
	local playerSpaceship
	for i, v in pairs(playerFolder:GetChildren()) do
		if string.match(v.Name, "Lvl") then
			playerSpaceship = v
		end
	end
	
	ScreenGui.Enabled = true
	ScreenGui.Parent.CodeButton.Frame.Codes.CodeButton.Visible = true
	InviteFrame.Visible = false
	-- teleport to home
	char:SetPrimaryPartCFrame(playerSpaceship.PrimaryPart.CFrame + Vector3.new(0, 5, 0))
end)