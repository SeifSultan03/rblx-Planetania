local MarketPlaceService = game:GetService("MarketplaceService")
local NotificationsRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("Notifications")

local UpgradeSpaceshipProductID = 1226086881
local LevelUpID = 1230539895

local SmallBuckies = 1226087281
local MediumBuckies = 1227806070
local LargeBuckies = 1227806529
local SmallGoldBuckies = 1227808309
local MediumGoldBuckies = 1227812999
local BigGoldBuckies = 1227813122

local set1 = 1230526347
local set2 = 1230526631
local set3 = 1230526762
local set4 = 1230528304
local set5 = 1230528500
local setsFolder = game.Workspace:WaitForChild("Assets"):WaitForChild("FurnitureSets")
local buildablesFolder = game.ReplicatedStorage:WaitForChild("Buildables")

local ID10 = 1230631458
local ID25 = 1231152819
local ID100 = 1230631501
local ID250 = 1231154461
local ID1000 = 1230631551
local ID2500 = 1230631595

local RobuxEgg = 1231244846

local function processReceipt(receiptInfo)
	print("Runnin")
	local player = game.Players:GetPlayerByUserId(receiptInfo.PlayerId)
	if not player then
		-- player not ingame so when they come back itll call back
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
	-- upgrade spaceship
	if receiptInfo.ProductId == UpgradeSpaceshipProductID then
		if player then
			print("player", player, "is buyin upgrade spaceship")
			local CurrentLevel = player.leaderstats:GetAttribute("SpaceshipLevel")
			if game.ReplicatedStorage.Domes:FindFirstChild("Lvl"..tostring(CurrentLevel + 1).."Ship") then
				-- if found a ship relating to player's level
				player.leaderstats:SetAttribute("SpaceshipLevel", CurrentLevel + 1)
				player.leaderstats:SetAttribute("SpaceshipProgres", 0)
				return Enum.ProductPurchaseDecision.PurchaseGranted
			end
		end
	end
	-- Coins
	if receiptInfo.ProductId == SmallBuckies then
		player.leaderstats.Coins.Value += 1000
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	if receiptInfo.ProductId == MediumBuckies then
		player.leaderstats.Coins.Value += 2500
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	if receiptInfo.ProductId == LargeBuckies then
		player.leaderstats.Coins.Value += 6000
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	-- goldCoins
	if receiptInfo.ProductId == SmallGoldBuckies then
		player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 200)
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	if receiptInfo.ProductId == MediumGoldBuckies then
		player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 500)
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	if receiptInfo.ProductId == BigGoldBuckies then
		player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 1000)
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	-- furniture sets
	if receiptInfo.ProductId == set1 then
		local items = setsFolder.Set1:GetChildren()
		local chair = buildablesFolder.SetOneChairFurniture
		local Table = buildablesFolder.SetOneTableFurniture
		if player.Inventory:FindFirstChild(Table.Name) then
			player.Inventory:FindFirstChild(Table.Name):SetAttribute("Count", player.Inventory:FindFirstChild(Table.Name):GetAttribute("Count") + 1)
		else
			local clone = Table:Clone()
			clone.Parent = player.Inventory
		end
		for count = 1, #items - 2 do
			if player.Inventory:FindFirstChild(chair.Name) then
				player.Inventory:FindFirstChild(chair.Name):SetAttribute("Count", player.Inventory:FindFirstChild(chair.Name):GetAttribute("Count") + 1)
			else
				local chairClone = chair:Clone()
				chairClone.Parent = player.Inventory
				wait(0.1)
			end	
		end
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	
	if receiptInfo.ProductId == set2 then
		local items = setsFolder.Set2:GetChildren()
		local chair = buildablesFolder.SetTwoChairFurniture
		local Table = buildablesFolder.SetTwoTableFurniture
		if player.Inventory:FindFirstChild(Table.Name) then
			player.Inventory:FindFirstChild(Table.Name):SetAttribute("Count", player.Inventory:FindFirstChild(Table.Name):GetAttribute("Count") + 1)
		else
			local clone = Table:Clone()
			clone.Parent = player.Inventory
		end
		for count = 1, #items - 2 do
			if player.Inventory:FindFirstChild(chair.Name) then
				player.Inventory:FindFirstChild(chair.Name):SetAttribute("Count", player.Inventory:FindFirstChild(chair.Name):GetAttribute("Count") + 1)
			else
				local chairClone = chair:Clone()
				chairClone.Parent = player.Inventory
				wait(0.1)
			end	
		end
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	
	if receiptInfo.ProductId == set3 then
		local items = setsFolder.Set3:GetChildren()
		local chair = buildablesFolder.SetThreeChairFurniture
		local Table = buildablesFolder.SetThreeTableFurniture
		if player.Inventory:FindFirstChild(Table.Name) then
			player.Inventory:FindFirstChild(Table.Name):SetAttribute("Count", player.Inventory:FindFirstChild(Table.Name):GetAttribute("Count") + 1)
		else
			local clone = Table:Clone()
			clone.Parent = player.Inventory
		end
		for count = 1, #items - 2 do
			if player.Inventory:FindFirstChild(chair.Name) then
				player.Inventory:FindFirstChild(chair.Name):SetAttribute("Count", player.Inventory:FindFirstChild(chair.Name):GetAttribute("Count") + 1)
			else
				local chairClone = chair:Clone()
				chairClone.Parent = player.Inventory
				wait(0.1)
			end	
		end
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	
	if receiptInfo.ProductId == set4 then
		local items = setsFolder.Set4:GetChildren()
		local chair = buildablesFolder.SetFourChairFurniture
		local Table = buildablesFolder.SetFourTableFurniture
		if player.Inventory:FindFirstChild(Table.Name) then
			player.Inventory:FindFirstChild(Table.Name):SetAttribute("Count", player.Inventory:FindFirstChild(Table.Name):GetAttribute("Count") + 1)
		else
			local clone = Table:Clone()
			clone.Parent = player.Inventory
		end
		for count = 1, #items - 2 do
			if player.Inventory:FindFirstChild(chair.Name) then
				player.Inventory:FindFirstChild(chair.Name):SetAttribute("Count", player.Inventory:FindFirstChild(chair.Name):GetAttribute("Count") + 1)
			else
				local chairClone = chair:Clone()
				chairClone.Parent = player.Inventory
				wait(0.1)
			end	
		end
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	
	if receiptInfo.ProductId == set5 then
		local items = setsFolder.Set5:GetChildren()
		local chair = buildablesFolder.SetFiveChairFurniture
		local Table = buildablesFolder.SetFiveTableFurniture
		if player.Inventory:FindFirstChild(Table.Name) then
			player.Inventory:FindFirstChild(Table.Name):SetAttribute("Count", player.Inventory:FindFirstChild(Table.Name):GetAttribute("Count") + 1)
		else
			local clone = Table:Clone()
			clone.Parent = player.Inventory
		end
		for count = 1, #items - 2 do
			if player.Inventory:FindFirstChild(chair.Name) then
				player.Inventory:FindFirstChild(chair.Name):SetAttribute("Count", player.Inventory:FindFirstChild(chair.Name):GetAttribute("Count") + 1)
			else
				local chairClone = chair:Clone()
				chairClone.Parent = player.Inventory
				wait(0.1)
			end	
		end
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	
	if receiptInfo.ProductId == LevelUpID then
		player.leaderstats:SetAttribute("XP", player.leaderstats:GetAttribute("XPNeededForLevelUp")) 
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	
	if receiptInfo.ProductId == ID10 then
		player.leaderstats:SetAttribute("RobuxDonated", player.leaderstats:GetAttribute("RobuxDonated") + 10)
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	
	if receiptInfo.ProductId == ID25 then
		player.leaderstats:SetAttribute("RobuxDonated", player.leaderstats:GetAttribute("RobuxDonated") + 25)
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	
	if receiptInfo.ProductId == ID100 then
		player.leaderstats:SetAttribute("RobuxDonated", player.leaderstats:GetAttribute("RobuxDonated") + 100)
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	
	if receiptInfo.ProductId == ID250 then
		player.leaderstats:SetAttribute("RobuxDonated", player.leaderstats:GetAttribute("RobuxDonated") + 250)
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	
	if receiptInfo.ProductId == ID1000 then
		player.leaderstats:SetAttribute("RobuxDonated", player.leaderstats:GetAttribute("RobuxDonated") + 1000)
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	
	if receiptInfo.ProductId == ID2500 then
		player.leaderstats:SetAttribute("RobuxDonated", player.leaderstats:GetAttribute("RobuxDonated") + 2500)
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	
	if receiptInfo.ProductId == RobuxEgg then
		local rand = math.random(1, 3)
		local pets = game.ReplicatedStorage.Pets.Robux1:GetChildren()
		local clone = pets[rand]:Clone()
		clone.Parent = player.Pets
		
		NotificationsRemote:FireClient(player, "Recieved Mythical pet: "..clone.Name)
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	-- add more
	
end

-- callback
MarketPlaceService.ProcessReceipt = processReceipt