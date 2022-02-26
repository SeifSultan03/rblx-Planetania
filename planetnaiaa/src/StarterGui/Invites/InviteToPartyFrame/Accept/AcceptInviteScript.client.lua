local AcceptTeleportRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("AcceptTeleport")
local InviteFrame = script.Parent.Parent
local ScreenGui = script.Parent.Parent.Parent.Parent:WaitForChild("ScreenGui")

script.Parent.MouseButton1Down:Connect(function()
	AcceptTeleportRemote:FireServer(script.Parent.Name) -- playerName
	ScreenGui.Enabled = true
	InviteFrame.Visible = false
end)