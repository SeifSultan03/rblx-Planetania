local Codes = {}
	
--[[function FreeStarPassRewards.GiveReward1(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 100
	print("given")
end]]--

function Codes.release(player)
	print(player.Name.." used code release")
	player.leaderstats.Coins.Value += 1000
end

Codes.releaset = "Rewarded 1000 Coins"
	


	

return Codes
