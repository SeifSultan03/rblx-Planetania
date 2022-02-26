local ClaimDailyRewardRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ClaimDailyReward")

ClaimDailyRewardRemote.OnServerEvent:Connect(function(player, claiming)
	local streak = player.leaderstats:GetAttribute("LoginStreak")
	
	if player.Inventory:GetAttribute("DailyReward"..claiming) == false then
		player.Inventory:SetAttribute("DailyReward"..claiming, true)
		-- give reward
		if claiming == "1" or claiming == "2" then
			player.leaderstats.Coins.Value += 250
		elseif claiming == "3" or claiming == "4" then
			player.leaderstats.Coins.Value += 500
		elseif claiming == "5" then
			player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
		else
			player:Kick("Unknown Error Code: DRG 16. Report to Killerz#6901")
		end
	end	
	
end)