local GiftRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("SendGift")
local NotificationsRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("Notifications")


GiftRemote.OnServerEvent:Connect(function(playerSending, playerRecievingName)
	print("recieved", playerRecievingName)
	local playerRecieving = game.Players:FindFirstChild(playerRecievingName)
	if playerRecieving then
		if os.time() - playerSending.leaderstats:GetAttribute("LastGift") >= 3600 then
			playerSending.leaderstats:SetAttribute("LastGift", os.time())
			playerSending.leaderstats.Coins.Value += 100
			playerRecieving.leaderstats.Coins.Value += 100
			NotificationsRemote:FireClient(playerSending, "recieved 100 Buckies for sending a gift!")
			NotificationsRemote:FireClient(playerRecieving, playerSending.Name.." sent you a gift (100 Buckies)!")
		end
	end
	
end)