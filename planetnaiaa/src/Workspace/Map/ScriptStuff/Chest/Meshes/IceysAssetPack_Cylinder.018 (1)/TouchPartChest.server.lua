local showHourlyRewardRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("ShowHourlyReward")
script.Parent.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		local char = hit.Parent
		local plr = game.Players:GetPlayerFromCharacter(char)
		if os.time() - plr.leaderstats:GetAttribute("HourlyChest") >= 3600 then
			plr.leaderstats:SetAttribute("GoldCoins", plr.leaderstats:GetAttribute("GoldCoins") + 10)
			plr.leaderstats:SetAttribute("HourlyChest", os.time())
			script.Parent.UpgradinSpaceship:Play()
			showHourlyRewardRemote:FireClient(plr)
		end
	end
end)