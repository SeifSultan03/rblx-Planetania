local coinEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("GivePlayerCoin")

local debounce = false
script.Parent.Touched:Connect(function(hit)
	if debounce then return end
	if hit.Parent:FindFirstChild("Humanoid") then
		local char = hit.Parent
		local player = game.Players:GetPlayerFromCharacter(char)
		local current = player.leaderstats:GetAttribute("CoinsRecurring")
		player.leaderstats:SetAttribute("CoinsRecurring", current + 1)
		local remainder = current % 5
		-- script.Coin.TimePosition = 0
		script.Parent.Position -= Vector3.new(0, 10, 0)
		script.Parent.Transparency = 1
		debounce = true
		player.leaderstats:SetAttribute("XP", player.leaderstats:GetAttribute("XP") + 1)
		
		if remainder == 0 and current ~= 0 then
			-- give player 25 coins and fireclient with the num
			player.leaderstats.Coins.Value += 25
			coinEvent:FireClient(player, 2.25)
		else
			-- give player 1 coin fireclient with GUI for 1 coin
			coinEvent:FireClient(player, 1 + 0.25 * remainder)
			player.leaderstats.Coins.Value += 1
			
		end
		wait(2)
		local currentNow = player.leaderstats:GetAttribute("CoinsRecurring")
		if current + 1 == currentNow then
			player.leaderstats:SetAttribute("CoinsRecurring", 0)
		end
		wait(18)
		script.Parent.Transparency = 0
		debounce = false
	end
end)