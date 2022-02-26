local ScreenGui = script.Parent.Parent.Parent:WaitForChild("ScreenGui")
local Text = script.Parent:WaitForChild("Info")
local AcceptButton = script.Parent:WaitForChild("Accept")
local player = game.Players.LocalPlayer
local RecievingParty = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("RecieveParty")

RecievingParty.OnClientEvent:Connect(function(playerInviting)
	if player.Name == playerInviting then return end
	script.Parent.Visible = true
	ScreenGui.Enabled = false
	Text.Text = playerInviting.." is hosting a party at their spaceship and you're invited!"
	AcceptButton.Name = playerInviting
end)