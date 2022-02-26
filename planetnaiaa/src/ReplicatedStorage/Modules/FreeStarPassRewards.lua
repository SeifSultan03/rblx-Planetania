local FreeStarPassRewards = {}
	
function FreeStarPassRewards.GiveReward1(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 100
	print("given")
end

function FreeStarPassRewards.GiveReward2(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 150
	print("given")
end

function FreeStarPassRewards.GiveReward3(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end

function FreeStarPassRewards.GiveReward4(player)
	local hatClone = game.ReplicatedStorage.Buildables:FindFirstChild("YellowFlowasDecoration"):Clone()
	hatClone.Parent = player.Inventory
end

function FreeStarPassRewards.GiveReward5(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 250
	print("given")
end

function FreeStarPassRewards.GiveReward6(player)
	local hatClone = game.ReplicatedStorage.Buildables:FindFirstChild("Candle1Decoration"):Clone()
	hatClone.Parent = player.Inventory
end	

function FreeStarPassRewards.GiveReward7(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 250
	print("given")
end

function FreeStarPassRewards.GiveReward8(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 350
	print("given")
end

function FreeStarPassRewards.GiveReward9(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 400
	print("given")
end

function FreeStarPassRewards.GiveReward10(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end	

function FreeStarPassRewards.GiveReward11(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 500
	print("given")
end

function FreeStarPassRewards.GiveReward12(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 500
	print("given")
end

function FreeStarPassRewards.GiveReward13(player)
	local hatClone = game.ReplicatedStorage.Buildables:FindFirstChild("SatelliteDecoration"):Clone()
	hatClone.Parent = player.Inventory
end	

function FreeStarPassRewards.GiveReward14(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 650
	print("given")
end

function FreeStarPassRewards.GiveReward15(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end	

function FreeStarPassRewards.GiveReward16(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 700
	print("given")
end

function FreeStarPassRewards.GiveReward17(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end

function FreeStarPassRewards.GiveReward18(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 750
	print("given")
end

function FreeStarPassRewards.GiveReward19(player)
	local hatClone = game.ReplicatedStorage.Buildables:FindFirstChild("PlanetPoTDecoration"):Clone()
	hatClone.Parent = player.Inventory
end	

function FreeStarPassRewards.GiveReward20(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end	

function FreeStarPassRewards.GiveReward21(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 900
	print("given")
end

function FreeStarPassRewards.GiveReward22(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 1000
	print("given")
end

function FreeStarPassRewards.GiveReward23(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end	

function FreeStarPassRewards.GiveReward24(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end	

function FreeStarPassRewards.GiveReward25(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 1500
	print("given")
end

function FreeStarPassRewards.GiveReward26(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 1750
	print("given")
end

function FreeStarPassRewards.GiveReward27(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end	

function FreeStarPassRewards.GiveReward28(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 2000
	print("given")
end

function FreeStarPassRewards.GiveReward29(player)
	player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 2000
	print("given")
end

function FreeStarPassRewards.GiveReward30(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 500)
	print("given")
end	

return FreeStarPassRewards
