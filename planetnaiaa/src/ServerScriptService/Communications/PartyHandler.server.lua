local PartyRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("PartyInvite")
local RecievingParty = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("RecieveParty")

PartyRemote.OnServerEvent:Connect(function(playerSending)
	
	RecievingParty:FireAllClients(playerSending.Name)
	
end)