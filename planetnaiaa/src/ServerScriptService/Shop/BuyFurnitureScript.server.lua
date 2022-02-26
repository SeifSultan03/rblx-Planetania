local rep = game:GetService("ReplicatedStorage")
local Buildables = rep:WaitForChild("Buildables")
local BuyFurnitureEvent = rep:WaitForChild("Remotes"):WaitForChild("BuyFurnitureEvent")
local FurnitureFolder = rep:WaitForChild("Furniture")

local goldCoin = "rbxassetid://7940738989"
local silverCoin = "rbxassetid://7940807750"

function BuyFurnitureEvent.OnServerInvoke(player, ItemName)
	print("Fired")
	if typeof(ItemName) ~= "string" then player:Kick("No malforming") return end
	
	print(ItemName, "was sent to server to buy")
	local Item = FurnitureFolder:FindFirstChild(ItemName)
	local ItemInRep = Buildables:FindFirstChild(ItemName)
	local Currency = Item.BillboardGui.Frame.Currency.Image
	local Price = tonumber(Item.BillboardGui.Frame.Price.Text)
	
	if Item and ItemInRep then
		if Currency == goldCoin then
			local playerGoldCoins = player.leaderstats:GetAttribute("GoldCoins")
			if playerGoldCoins >= Price then
				player.leaderstats:SetAttribute("GoldCoins", playerGoldCoins - Price)
				if player.Inventory:FindFirstChild(ItemName) then
					player.Inventory:FindFirstChild(ItemName):SetAttribute("Count", player.Inventory:FindFirstChild(ItemName):GetAttribute("Count") + 1)
				else
					local clone = ItemInRep:Clone()
					clone.Parent = player.Inventory
				end
				return true
			else
				return nil
			end
		elseif Currency == silverCoin then
			if player.leaderstats.Coins.Value >= Price then
				player.leaderstats.Coins.Value -= Price
				if player.Inventory:FindFirstChild(ItemName) then
					player.Inventory:FindFirstChild(ItemName):SetAttribute("Count", player.Inventory:FindFirstChild(ItemName):GetAttribute("Count") + 1)
				else
					local clone = ItemInRep:Clone()
					clone.Parent = player.Inventory
				end
				return true
			else
				return nil
			end
		else player:Kick("Error Currency Not Found BFS. Killerz#6091") return end
	else
		return nil
	end
end
