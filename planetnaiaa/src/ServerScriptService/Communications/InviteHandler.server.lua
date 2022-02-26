local InviteRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("PlayerInvite")
local PlayerRecievingInvite = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("PlayerRecieveInvite")

InviteRemote.OnServerEvent:Connect(function(playerSending, playerRecievingName)
	
	local playerRecieving = game.Players:FindFirstChild(playerRecievingName)
	if playerRecieving then
		PlayerRecievingInvite:FireClient(playerRecieving, playerSending.Name)
	end
	
end)