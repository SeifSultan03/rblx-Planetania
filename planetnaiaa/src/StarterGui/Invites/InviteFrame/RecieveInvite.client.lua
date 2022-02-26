local PlayerRecievingInvite = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("PlayerRecieveInvite")
local ScreenGui = script.Parent.Parent.Parent:WaitForChild("ScreenGui")
local Text = script.Parent:WaitForChild("Info")
local AcceptButton = script.Parent:WaitForChild("Accept")
local player = game.Players.LocalPlayer

PlayerRecievingInvite.OnClientEvent:Connect(function(playerInviting)
	if player.leaderstats:GetAttribute("TutorialLevel") < 9 then return end
	script.Parent.Visible = true
	ScreenGui.Enabled = false
	Text.Text = playerInviting.." has invited you to their spaceship"
	AcceptButton.Name = playerInviting
end)