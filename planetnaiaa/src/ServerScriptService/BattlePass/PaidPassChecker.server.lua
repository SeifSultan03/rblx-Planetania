local StarPassRemote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("StarPassRemotePaid")

function StarPassRemote.OnServerInvoke(player, tier)
	local playerLevel = player.leaderstats:GetAttribute("Level")
	local playerClaimedOrNot = player.WearInventory:GetAttribute("PaidTier_"..tostring(tier))
	if playerLevel >= tier and playerClaimedOrNot == false and player.leaderstats:GetAttribute("OwnsStarPass") == true then
		local module = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("PaidStarPassRewards"))
		module["GiveReward"..tostring(tier)](player)
		player.WearInventory:SetAttribute("PaidTier_"..tostring(tier), true)
			-- give player stuff
		return true
	else
		return false
	end
end
