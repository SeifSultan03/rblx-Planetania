local rep = game:GetService("ReplicatedStorage")
local Extras = rep:WaitForChild("Extras")
local openGiftRemote = rep:WaitForChild("Remotes"):WaitForChild("BuyAccessoryGift")

local numToRarity = {"Mythical", "Legendary", "Epic", "Rare", "Common"}

local raritiesSmall = {
	[1] = 2,
	[2] = 28,
	[3] = 170,
	[4] = 300,
	[5] = 500
}

local raritiesMedium = {
	[1] = 10,
	[2] = 50,
	[3] = 240,
	[4] = 350,
	[5] = 350
}

local raritiesLarge = {
	[1] = 50,
	[2] = 200,
	[3] = 250,
	[4] = 250,
	[5] = 250
}

local ItemsFolder = game.ReplicatedStorage:WaitForChild("Random Items")

local Items = ItemsFolder:GetChildren()

local function getItemOfRarity(Rarity)
	while wait() do
		print("attempting")
		local rand = math.random(1, #Items)
		local ItemInRep = Extras:FindFirstChild(Items[rand].Name)
		if ItemInRep:GetAttribute("Rarity") == Rarity then
			print("found Item")
			return ItemInRep, Items[rand]
		end
	end
end

function openGiftRemote.OnServerInvoke(player, size)
	if size == 100 then
		-- small, 500
		if player.leaderstats.Coins.Value >= 200 then
			player.leaderstats.Coins.Value -= 200
			local rand = math.random(1, 1000)
			
			print(rand)
			
			local counter = 0
			for rarity, weight in ipairs(raritiesSmall) do
				print(rarity, weight)
				counter += weight
				if rand <= counter then
					-- this rarity is good
					print(rarity)
					rarity = numToRarity[rarity]
					print("Rarity after", rarity)
					local Item, fakeItem = getItemOfRarity(rarity)
					print(Item)
					if player.WearInventory.ExtrasInventory:FindFirstChild(Item.Name) then
						if rarity == "Common" then
							player.leaderstats.Coins.Value += 20
							return fakeItem, Item, 20
							--  refund, Item, owned
						elseif rarity == "Rare" then
							player.leaderstats.Coins.Value += 40
							return fakeItem, Item, 40
						elseif rarity == "Epic" then
							player.leaderstats.Coins.Value += 60
							return fakeItem, Item, 60
						elseif rarity == "Legendary" then
							player.leaderstats.Coins.Value += 80
							return fakeItem, Item, 80
						elseif rarity == "Mythical" then
							player.leaderstats.Coins.Value += 100
							return fakeItem, Item, 100
						end
					else
						local clone = Item:Clone()
						clone.Parent = player.WearInventory.ExtrasInventory
						return fakeItem, Item
					end
				end
			end
		else
			return nil
		end
		
	elseif size == 101 then
		-- medium, 2000
		if player.leaderstats.Coins.Value >= 500 then
			player.leaderstats.Coins.Value -= 500
			local rand = math.random(1, 1000)

			print(rand)

			local counter = 0
			for rarity, weight in ipairs(raritiesMedium) do
				print(rarity, weight)
				counter += weight
				if rand <= counter then
					-- this rarity is good
					print(rarity)
					rarity = numToRarity[rarity]
					print("Rarity after", rarity)
					local Item, fakeItem = getItemOfRarity(rarity)
					print(Item)
					if player.WearInventory.ExtrasInventory:FindFirstChild(Item.Name) then
						if rarity == "Common" then
							player.leaderstats.Coins.Value += 100
							return fakeItem, Item, 100
							--  refund, Item, owned
						elseif rarity == "Rare" then
							player.leaderstats.Coins.Value += 200
							return fakeItem, Item, 200
						elseif rarity == "Epic" then
							player.leaderstats.Coins.Value += 300
							return fakeItem, Item, 300
						elseif rarity == "Legendary" then
							player.leaderstats.Coins.Value += 400
							return fakeItem, Item, 400
						elseif rarity == "Mythical" then
							player.leaderstats.Coins.Value += 500
							return fakeItem, Item, 500
						end
					else
						local clone = Item:Clone()
						clone.Parent = player.WearInventory.ExtrasInventory
						return fakeItem, Item
					end
				end
			end
		else
			return nil
		end
	else
		-- large, 4000
		if player.leaderstats.Coins.Value >= 1000 then
			player.leaderstats.Coins.Value -= 1000
			local rand = math.random(1, 1000)

			print(rand)

			local counter = 0
			for rarity, weight in ipairs(raritiesLarge) do
				print(rarity, weight)
				counter += weight
				if rand <= counter then
					-- this rarity is good
					print(rarity)
					rarity = numToRarity[rarity]
					print("Rarity after", rarity)
					local Item, fakeItem = getItemOfRarity(rarity)
					print(Item)
					if player.WearInventory.ExtrasInventory:FindFirstChild(Item.Name) then
						if rarity == "Common" then
							player.leaderstats.Coins.Value += 200
							return fakeItem, Item, 200
							--  refund, Item, owned
						elseif rarity == "Rare" then
							player.leaderstats.Coins.Value += 400
							return fakeItem, Item, 400
						elseif rarity == "Epic" then
							player.leaderstats.Coins.Value += 600
							return fakeItem, Item, 600
						elseif rarity == "Legendary" then
							player.leaderstats.Coins.Value += 800
							return fakeItem, Item, 800
						elseif rarity == "Mythical" then
							player.leaderstats.Coins.Value += 1000
							return fakeItem, Item, 1000
						end
					else
						local clone = Item:Clone()
						clone.Parent = player.WearInventory.ExtrasInventory
						return fakeItem, Item
					end
				end
			end
		else
			return nil
		end
	end
	
	return true
end
