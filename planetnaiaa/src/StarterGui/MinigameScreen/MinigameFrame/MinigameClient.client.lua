local ShowJoinUIRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("ShowJoinUI")
local ShowNotEnoughPlayersRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("ShowNotEnoughPlayers")
local WinnerRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("Winner")
local LoserRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("Loser")
local OutOfBoundsRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("OutOfBounds")

local player = game.Players.LocalPlayer
local ScreenGui = script.Parent.Parent.Parent:WaitForChild("ScreenGui")

ShowJoinUIRemote.OnClientEvent:Connect(function()
	if script.Parent.Visible == false then return end
	if player.leaderstats:GetAttribute("TutorialLevel") <= 8 then return end
	
	script.Parent:WaitForChild("ConfirmPlay").Visible = true
	ScreenGui.Enabled = false
end)

ShowNotEnoughPlayersRemote.OnClientEvent:Connect(function()
	if script.Parent.Visible == false then return end
	script.Parent:WaitForChild("NotEnoughJoined").Visible = true
	ScreenGui.Enabled = false
end)

WinnerRemote.OnClientEvent:Connect(function(numOfPlayers)
	if script.Parent.Visible == false then return end
	script.Parent:WaitForChild("Winner").Visible = true
	ScreenGui.Enabled = false
	local text = script.Parent.Winner.Info
	if numOfPlayers == 1 then
		text.Text = "You were the last one standing! here's 300 Buckies as a reward"
	else
		text.Text = "You and "..tostring(numOfPlayers - 1).." others survived the meteor shower, heres 300 Buckies as a reward"
	end
end)

LoserRemote.OnClientEvent:Connect(function()
	if script.Parent.Visible == false then return end
	script.Parent:WaitForChild("Loser").Visible = true
	ScreenGui.Enabled = false
end)

OutOfBoundsRemote.OnClientEvent:Connect(function()
	if script.Parent.Visible == false then return end
	script.Parent:WaitForChild("OutOfBounds").Visible = true
	ScreenGui.Enabled = false
end)

