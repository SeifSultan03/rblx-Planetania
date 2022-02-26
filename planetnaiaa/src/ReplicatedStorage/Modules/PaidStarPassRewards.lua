local PaidStarPassRewards = {}
	
function PaidStarPassRewards.GiveReward1(player)
	player.leaderstats.Coins.Value += 500
	print("given")
end

function PaidStarPassRewards.GiveReward2(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end	

function PaidStarPassRewards.GiveReward3(player)
	player.leaderstats.Coins.Value += 750
	print("given")
end

function PaidStarPassRewards.GiveReward4(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end

function PaidStarPassRewards.GiveReward5(player)
	player.leaderstats.Coins.Value += 1000
	print("given")
end

function PaidStarPassRewards.GiveReward6(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end	

function PaidStarPassRewards.GiveReward7(player)
	player.leaderstats.Coins.Value += 1150
	print("given")
end

function PaidStarPassRewards.GiveReward8(player)
	player.leaderstats.Coins.Value += 1250
	print("given")
end

function PaidStarPassRewards.GiveReward9(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end

function PaidStarPassRewards.GiveReward10(player)
	player.leaderstats.Coins.Value += 1500
	print("given")
end

function PaidStarPassRewards.GiveReward11(player)
	player.leaderstats.Coins.Value += 1750
	print("given")
end

function PaidStarPassRewards.GiveReward12(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end	

function PaidStarPassRewards.GiveReward13(player)
	player.leaderstats.Coins.Value += 2000
	print("given")
end

function PaidStarPassRewards.GiveReward14(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end	

function PaidStarPassRewards.GiveReward15(player)
	player.leaderstats.Coins.Value += 2500
	print("given")
end

function PaidStarPassRewards.GiveReward16(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end

function PaidStarPassRewards.GiveReward17(player)
	player.leaderstats.Coins.Value += 3000
	print("given")
end

function PaidStarPassRewards.GiveReward18(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end	

function PaidStarPassRewards.GiveReward19(player)
	local hatClone = game.ReplicatedStorage.Buildables:FindFirstChild("FlowerPotIDKDecoration"):Clone()
	hatClone.Parent = player.Inventory
end	

function PaidStarPassRewards.GiveReward20(player)
	player.leaderstats.Coins.Value += 3500
	print("given")
end

function PaidStarPassRewards.GiveReward21(player)
	local hatClone = game.ReplicatedStorage.Buildables:FindFirstChild("CirclesDecoration"):Clone()
	hatClone.Parent = player.Inventory
end	

function PaidStarPassRewards.GiveReward22(player)
	player.leaderstats.Coins.Value += 4000
	print("given")
end

function PaidStarPassRewards.GiveReward23(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end

function PaidStarPassRewards.GiveReward24(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end	

function PaidStarPassRewards.GiveReward25(player)
	player.leaderstats.Coins.Value += 4500
	print("given")
end

function PaidStarPassRewards.GiveReward26(player)
	local hatClone = game.ReplicatedStorage.Buildables:FindFirstChild("RedRosesDecoration"):Clone()
	hatClone.Parent = player.Inventory
end	

function PaidStarPassRewards.GiveReward27(player)
	player.leaderstats.Coins.Value += 5000
	print("given")
end

function PaidStarPassRewards.GiveReward28(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 100)
	print("given")
end	

function PaidStarPassRewards.GiveReward29(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 250)
	print("given")
end	

function PaidStarPassRewards.GiveReward30(player)
	player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 750)
	print("given")
end	

return PaidStarPassRewards
