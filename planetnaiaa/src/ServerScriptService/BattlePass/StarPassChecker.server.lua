local StarPassRemote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("StarPassRemote")

function StarPassRemote.OnServerInvoke(player, tier)
	local playerLevel = player.leaderstats:GetAttribute("Level")
	local playerClaimedOrNot = player.WearInventory:GetAttribute("Tier_"..tostring(tier))
	if playerLevel >= tier and playerClaimedOrNot == false then
		local module = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("FreeStarPassRewards"))
		
		module["GiveReward"..tostring(tier)](player)
		
		player.WearInventory:SetAttribute("Tier_"..tostring(tier), true)
	
			-- give player stuff
		return true
	else
		return false
	end
end

