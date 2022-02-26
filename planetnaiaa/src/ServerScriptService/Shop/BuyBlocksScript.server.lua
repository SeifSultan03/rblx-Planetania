local rep = game:GetService("ReplicatedStorage")
local Buildables = rep:WaitForChild("Buildables")
local BuyBlockEvent = rep:WaitForChild("Remotes"):WaitForChild("BuyBlocksEvent")
local BlocksFolder = game.Workspace:WaitForChild("Assets"):WaitForChild("Blocks")

BuyBlockEvent.OnServerEvent:Connect(function(player, Item)
	print("Fired")
	if typeof(Item) ~= "string" then player:Kick("No malforming") return end
	
	local Block
	if BlocksFolder:FindFirstChild(Item) then
		print("FoundBlock")
		Block = BlocksFolder:FindFirstChild(Item)
	else player:Kick("Not Found. DM Killerz#6091 Code: BBS 12") return end
	local BlockInRep
	if Buildables:FindFirstChild(Item) then
		print("FoundInRep")
		BlockInRep = Buildables:FindFirstChild(Item)
	else player:Kick("Not Found. DM Killerz#6091 Code: BBS 17") return end
	
	local Price = tonumber(Block.BillboardGui.Frame.Price.Text)
	if Price then
		if Price == 25 then -- silver coins
			if player.leaderstats.Coins.Value < 25 then return end
			print("Price = 25")
			player.leaderstats.Coins.Value -= 25
			if player.Inventory:FindFirstChild(Item) then
				local ItemInInventory = player.Inventory:FindFirstChild(Item)
				local CurrentCount = ItemInInventory:GetAttribute("Count")
				ItemInInventory:SetAttribute("Count", CurrentCount + 1)
			else
				local BlockClone = BlockInRep:Clone()
				BlockClone.Parent = player.Inventory
			end
		else
			print("Price not 25")
			-- set coins
			local CurrentGoldCoins = player.leaderstats:GetAttribute("GoldCoins")
			if CurrentGoldCoins < 5 then return end
			player.leaderstats:SetAttribute("GoldCoins", CurrentGoldCoins - 5)
			-- add to inventory
			if player.Inventory:FindFirstChild(Item) then
				local ItemInInventory = player.Inventory:FindFirstChild(Item)
				local CurrentCount = ItemInInventory:GetAttribute("Count")
				ItemInInventory:SetAttribute("Count", CurrentCount + 1)
			else
				local BlockClone = BlockInRep:Clone()
				BlockClone.Parent = player.Inventory
			end
		end
	end
end)
