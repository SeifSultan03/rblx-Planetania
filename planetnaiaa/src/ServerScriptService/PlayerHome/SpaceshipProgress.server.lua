local rep = game.ReplicatedStorage
local IncreaseProgress = rep:WaitForChild("Remotes"):WaitForChild("SpaceshipProgress")
local ServerTextEvent = rep:WaitForChild("Remotes"):WaitForChild("ServerTextEvent")
local function IncreaseHomeLevelAndSetProgressToZero(player)
	player.leaderstats:SetAttribute("SpaceshipProgress", 0)
	player.leaderstats:SetAttribute("SpaceshipLevel", player.leaderstats:GetAttribute("SpaceshipLevel") + 1)
end

IncreaseProgress.OnServerEvent:Connect(function(player, amount)
	local Coins = player.leaderstats.Coins
	
	if typeof(amount) ~= "number" then player:Kick("No malforming. DM Killerz#6703 if you think it's unjustified code: 12SP") return end
	if amount ~= 100 and amount ~= 1000 then player:Kick("No malforming. DM Killerz#6703 if you think it's unjustified code: 13SP") return end
	
	if Coins.Value >= amount then
		-- has the coins so make a function to subtract whatevers left
		local playerSpaceshipLevel = player.leaderstats:GetAttribute("SpaceshipLevel")
		local playerNextSpaceship = rep:WaitForChild("Domes"):FindFirstChild("Lvl"..tostring(playerSpaceshipLevel + 1).."Ship")
		
		if not playerNextSpaceship then player:Kick("No malforming. DM Killerz#6703 if you think it's unjustified code: 20SP") return end
		
		local price = playerNextSpaceship:GetAttribute("Price")
		local Progress = player.leaderstats:GetAttribute("SpaceshipProgress")
		
		if Progress + amount >= price then
			local amountLeft = price - Progress
			player.leaderstats.Coins.Value -= amountLeft
			IncreaseHomeLevelAndSetProgressToZero(player)
			-- write a message to world by an event
			local Message = player.Name.." just upgraded their spaceship to level "..tostring(playerSpaceshipLevel + 1).."!"
			ServerTextEvent:FireAllClients(Message)
		else
			player.leaderstats.Coins.Value -= amount
			player.leaderstats:SetAttribute("SpaceshipProgress", Progress + amount)
		end
	end
end)