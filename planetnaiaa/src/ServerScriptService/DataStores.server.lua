local Players = game:GetService("Players")
local DSS = game:GetService("DataStoreService")
local MyDataStore = DSS:GetDataStore("MyDataedStore")
local HttpServ = game:GetService("HttpService")
local rep = game:GetService("ReplicatedStorage")
local showDailyReward = rep:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("ShowDailyReward")
local startTutorial = rep:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("StartTutorial")
local setUpFurniture = rep:WaitForChild("Remotes"):WaitForChild("SetUpFurniture")
local FurnitureFolder = rep:WaitForChild("Furniture")
local ErrorLoading = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ErrorLoad")
local NotificationsRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("Notifications")

local playerLoadingArray = {}

function givePet (player, pet)
	if player then
		local character = player.Character or player.CharacterAdded:Wait()

		local humRootPart = character.HumanoidRootPart
		local clone = pet:Clone() -- whole pet
		local MainPart = clone:FindFirstChild("m") -- main part
		clone.Parent = character

		local bodyPos = Instance.new("BodyPosition")
		bodyPos.Parent = MainPart
		bodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

		local bodyGyro = Instance.new("BodyGyro")
		bodyGyro.Parent = MainPart
		bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)

		task.spawn(function()
			while MainPart.Parent do
				wait()
				bodyPos.Position = humRootPart.Position + Vector3.new(2, 2, 3)--these are the numbers to edit if you want to change the position the block goes to
				bodyGyro.CFrame = humRootPart.CFrame * CFrame.Angles(0, math.rad(-90), 0)
			end
			print("the spawn got done")
		end)
	end
end

local function CreateTextures(parent, TextureID)
	local Texture = Instance.new("Texture")
	Texture.Parent = parent
	Texture.Texture = TextureID
	Texture.StudsPerTileU = 10
	Texture.StudsPerTileV = 10
	Texture.Transparency = 0.7
	Texture.Face = "Top"
	local Clone1 = Texture:Clone()
	Clone1.Parent = parent
	Clone1.Face = "Bottom"
	local Clone2 = Texture:Clone()
	Clone2.Parent = parent
	Clone2.Face = "Front"
	local Clone3 = Texture:Clone()
	Clone3.Parent = parent
	Clone3.Face = "Back"
	local Clone4 = Texture:Clone()
	Clone4.Parent = parent
	Clone4.Face = "Right"
	local Clone5 = Texture:Clone()
	Clone5.Parent = parent
	Clone5.Face = "Left"
end

local function FindNewFurniture(player)
	local Available = FurnitureFolder:GetChildren()
	local rand = math.random(1, #Available)
	
	if player.FurnitureData:FindFirstChild(Available[rand].Name) then
		FindNewFurniture(player)
	else
		local furniture = Instance.new("IntValue")
		furniture.Parent = player.FurnitureData
		furniture.Name = Available[rand].Name 
	end
end

Players.PlayerAdded:Connect(function(player)
	print("playerAdded")

	table.insert(playerLoadingArray, player.Name)
	
	--[[if player.Name == "SeifSultan03" then
		local SeifsChar = player.Character or player.CharacterAdded:Wait()
		SeifsChar:WaitForChild("Accessory"):Destroy()
	end]]--
	
	if game.Workspace:FindFirstChild(player.Name.."f") then player:Kick("Rejoining to same lobby too quick") return end
	
	local char = player.Character or player.CharacterAdded:Wait()
	-- leaderstats
	
	local playerFolder = Instance.new("Folder")
	playerFolder.Parent = game.Workspace
	playerFolder.Name = player.Name.."f"
	
	local FurnitureData = Instance.new("Folder")
	FurnitureData.Parent = player
	FurnitureData.Name = "FurnitureData"
	
	
	local folder = Instance.new("Folder")
	folder.Parent = player
	folder.Name = "leaderstats"
	-- coins
	local Coins = Instance.new("NumberValue")
	Coins.Parent = folder
	Coins.Name = "Coins"
	Coins.Value = 100
	
	local PetsFolder = Instance.new("Folder")
	PetsFolder.Parent = player
	PetsFolder.Name = "Pets"
	
	local CurrentPet = Instance.new("Folder")
	CurrentPet.Parent = player
	CurrentPet.Name = "CurrentPet"
	
	folder:SetAttribute("CoinsRecurring", 0) -- for coins collectin

	folder:SetAttribute("XP", 0)
	
	folder:SetAttribute("XPNeededForLevelUp", 50)
	
	folder:SetAttribute("Level", 1)
	
	folder:SetAttribute("GoldCoins", 0)
	
	folder:SetAttribute("OwnsStarPass", false)
	
	folder:SetAttribute("OwnsVIP", false)
	
	folder:SetAttribute("SpaceshipLevel", 1)
	
	folder:SetAttribute("SpaceshipProgress", 0)

	folder:SetAttribute("JoinTime", os.time())
	
	folder:SetAttribute("LoginStreak", 1)
	
	folder:SetAttribute("TutorialLevel", 1)
	
	folder:SetAttribute("LastGift", 0)
	
	folder:SetAttribute("HourlyChest", 0)
	
	folder:SetAttribute("FurnitureUpdate", os.time())
	
	folder:SetAttribute("RobuxDonated", 0)
	
	folder:SetAttribute("OwnsGridSize", false)
	
	folder:SetAttribute("BoughtEgg1Before", false)
	
	folder:SetAttribute("OwnsX2Luck", false)
	
	folder:SetAttribute("OwnsX10Luck", false)
	
	folder:SetAttribute("MaxPets", 20)
	
	folder:SetAttribute("WentToBuildShop", false)
	-- wearInventory
	local WearInventory = Instance.new("Folder")
	WearInventory.Parent = player
	WearInventory.Name = "WearInventory"
	-- currently wearing
	local CurrentlyWearing = Instance.new("Folder")
	CurrentlyWearing.Parent = WearInventory
	CurrentlyWearing.Name = "CurrentlyWearing"
	
	local ExtrasInventory = Instance.new("Folder")
	ExtrasInventory.Parent = WearInventory
	ExtrasInventory.Name = "ExtrasInventory"
	
	local ColorsInventory = Instance.new("Folder")
	ColorsInventory.Parent = player
	ColorsInventory.Name = "ColorsInventory"
	
	local TexturesInventory = Instance.new("Folder")
	TexturesInventory.Parent = player
	TexturesInventory.Name = "TexturesInventory"
	local EmptyTexture = Instance.new("IntValue")
	EmptyTexture.Parent = TexturesInventory
	EmptyTexture.Name = ""
	
	for i, v in pairs(rep:WaitForChild("StarPassItems"):WaitForChild("Free"):GetChildren()) do 
		-- setting bool values for if claimed or not
		WearInventory:SetAttribute("Tier_"..tostring(i), false)
	end
	
	for i, v in pairs(rep:WaitForChild("StarPassItems"):WaitForChild("Paid"):GetChildren()) do 
		-- setting bool values for if claimed or not StarPass
		WearInventory:SetAttribute("PaidTier_"..tostring(i), false)
	end
	
	-- build inventory
	local Inventory = Instance.new("Folder")
	Inventory.Parent = player
	Inventory.Name = "Inventory"
	-- inventory count adder
	Inventory.ChildAdded:Connect(function(ItemAdded) -- when something gets added into the inventory it fires
		rep:WaitForChild("Remotes"):WaitForChild("ItemAddedRemote"):FireClient(player, ItemAdded.Name)
		ItemAdded:SetAttribute("Count", 1)
		print(ItemAdded)
	end)
	-- daily rewards claimed
	for count = 1, 5 do
		Inventory:SetAttribute("DailyReward"..tostring(count), false)
	end
	
	-- detecting player level up
	folder:GetAttributeChangedSignal("XP"):Connect(function()
		if folder:GetAttribute("XP") >= folder:GetAttribute("XPNeededForLevelUp") then
			-- xp needed for level up + 50 x level
			folder:SetAttribute("XPNeededForLevelUp", folder:GetAttribute("XPNeededForLevelUp") + 20 * folder:GetAttribute("Level"))
			-- plus level
			folder:SetAttribute("Level", folder:GetAttribute("Level") + 1)
			-- reset XP
			folder:SetAttribute("XP", 0)
		end
	end)
	
	
	-- set a location for player
	local playerLocation
	if game.Workspace:WaitForChild("Locations"):FindFirstChild("Location") then
		playerLocation = game.Workspace.Locations:FindFirstChild("Location")
		playerLocation.Name = player.Name.."Location"
	else
		player:Kick("Location not found DSS 147. Report to Killerz#6091") return
	end
	
	-- set a portal for player
	local portal
	if game.Workspace:WaitForChild("Portals"):FindFirstChild("Portal") then
		portal = game.Workspace:WaitForChild("Portals"):FindFirstChild("Portal")
		portal.Name = player.Name.."Portal"
		portal.Part.NameGui.TextLabel.Text = player.Name
		for i, v in pairs(portal:GetDescendants()) do
			if v:IsA("Part") or v:IsA("MeshPart") then
				v.Position += Vector3.new(0, 20, 0)
			end
		end
	else
		player:Kick("Portal not found DSS 154. Report to Killerz#6091") return
	end
	
	print("Reached LoadDataPoint")
	
	local data
	local success, errormessage = pcall(function()
		data = MyDataStore:GetAsync(player.UserId)
	end)

	if success and data ~= nil then
		
		print("Chars Used In Datastore: ", string.len(HttpServ:JSONEncode(data)))
		print("Loading Data")
		
		local successLoad, errorLoad = pcall(function()
			Coins.Value = data["Coins"]
			folder:SetAttribute("Level", data["Level"])
			folder:SetAttribute("XPNeededForLevelUp", data["XPNeededForLevelUp"])
			folder:SetAttribute("XP", data["XP"])
			folder:SetAttribute("GoldCoins", data["GoldCoins"])
			folder:SetAttribute("OwnsStarPass", data["OwnsStarPass"])
			-- set player spaceshipLevel and spaceship progress
			folder:SetAttribute("SpaceshipLevel", data["SpaceshipLevel"])
			folder:SetAttribute("SpaceshipProgress", data["SpaceshipProgress"])
			folder:SetAttribute("JoinTime", data["JoinTime"])
			folder:SetAttribute("OwnsVIP", data["OwnsVIP"])
			folder:SetAttribute("LoginStreak", data["LoginStreak"])
			folder:SetAttribute("TutorialLevel", data["TutorialLevel"])
			folder:SetAttribute("LastGift", data["LastGift"])
			folder:SetAttribute("HourlyChest", data["HourlyChest"])
			folder:SetAttribute("FurnitureUpdate", data["FurnitureUpdate"])
			folder:SetAttribute("RobuxDonated", data["RobuxDonated"])
			folder:SetAttribute("OwnsGridSize", data["OwnsGridSize"])
			
			if data["WentToBuildShop"] then
				folder:SetAttribute("WentToBuildShop", data["WentToBuildShop"])
			end
			
			if data["BoughtEgg1Before"] then
				folder:SetAttribute("BoughtEgg1Before", data["BoughtEgg1Before"])
			end
			
			if data["OwnsX2Luck"] then
				folder:SetAttribute("OwnsX2Luck", data["OwnsX2Luck"])
			end
			
			if data["OwnsX10Luck"] then
				folder:SetAttribute("OwnsX10Luck", data["OwnsX10Luck"])
			end
			
			if data["MaxPets"] then
				folder:SetAttribute("MaxPets", data["MaxPets"])
			end

			-- 7200 for 2 hours
			-- furniture
			if os.time() - folder:GetAttribute("FurnitureUpdate") >= 7200 then
				folder:SetAttribute("FurnitureUpdate", os.time())
				for count = 1, 16 do
					FindNewFurniture(player)
				end
				task.spawn(function()
					wait(16)
					NotificationsRemote:FireClient(player, "New furniture available in buildables shop! (Main Planet)")
				end)
			else
				for i, v in pairs(data.FurnitureData) do
					local furniture = Instance.new("IntValue")
					furniture.Parent = FurnitureData
					furniture.Name = v
				end
			end
			setUpFurniture:FireClient(player)

			-- tutorial 
			if folder:GetAttribute("TutorialLevel") < 100 then
				startTutorial:FireClient(player, folder:GetAttribute("TutorialLevel"))
			end

			for i, v in pairs(data.Codes) do
				ColorsInventory:SetAttribute(i, v)
			end

			for i, v in pairs(data.DailyRewards) do
				Inventory:SetAttribute(i, v)
			end

			local everythingClaimed = true
			for i, v in pairs(Inventory:GetAttributes()) do
				if v == false then everythingClaimed = false break end
			end

			if folder:GetAttribute("LoginStreak") % 5 == 1 and everythingClaimed then
				for attName, v in pairs(Inventory:GetAttributes()) do
					print(attName)
					Inventory:SetAttribute(attName, false)
				end
			end

			for i, v in pairs(rep:WaitForChild("StarPassItems"):WaitForChild("Free"):GetChildren()) do 
				-- setting bool values for if claimed or not
				WearInventory:SetAttribute("Tier_"..tostring(i), data.StarPassTiers["Tier_"..tostring(i)])
			end
			-- ONLY FOR STAR PASS OWNERS 
			if folder:GetAttribute("OwnsStarPass") == true then
				for i, v in pairs(rep:WaitForChild("StarPassItems"):WaitForChild("Paid"):GetChildren()) do 
					-- setting bool values for if claimed or not
					WearInventory:SetAttribute("PaidTier_"..tostring(i), data.StarPassTiers["PaidTier_"..tostring(i)])
				end
			end
			
				
				-- Build Inventory
				if data.BuildInventory then
					for build, count in pairs(data.BuildInventory) do
						if rep:WaitForChild("Buildables"):WaitForChild(build, 5) then
							local BuildableClone = rep:FindFirstChild("Buildables"):FindFirstChild(build):Clone()
							BuildableClone.Parent = Inventory
							BuildableClone:SetAttribute("Count", count)
						end
					end
				end
				-- spawn a spaceship to the location place
				local playerSpaceshipLevel = tostring(folder:GetAttribute("SpaceshipLevel"))
				local spaceship = rep:WaitForChild("Domes"):WaitForChild("Lvl"..playerSpaceshipLevel.."Ship")
				local spaceshipClone
				if spaceship then
					spaceshipClone = spaceship:Clone()
					local Position = game.Workspace.Locations:FindFirstChild(player.Name.."Location").Position
					spaceshipClone:SetPrimaryPartCFrame(CFrame.new(Position))
					spaceshipClone.Parent = playerFolder
					char:WaitForChild("HumanoidRootPart").CFrame = spaceshipClone.PrimaryPart.CFrame + Vector3.new(0, 5, 0)
				end
				-- loading player builds
				if data.Builds then
					-- set the colors and textures
					for i, child in pairs(spaceshipClone:GetChildren()) do
						if child.Name == "BuildableFloor" then
							child.BrickColor = BrickColor.new(data.Builds.BuildableFloorColor)
							if data.Builds.BuildableFloorTexture then
								-- texute
								CreateTextures(child, data.Builds.BuildableFloorTexture)
							end
						elseif child.Name == "Color1" then
							child.BrickColor = BrickColor.new(data.Builds.Color1)
							if data.Builds.Color1Texture then
								-- texture
								CreateTextures(child, data.Builds.Color1Texture)
							end
						elseif child.Name == "Color2" then
							child.BrickColor = BrickColor.new(data.Builds.Color2)
							if data.Builds.Color2Texture then
								-- texture
								CreateTextures(child, data.Builds.Color2Texture)
							end
						elseif child.Name == "Wall" then
							child.BrickColor = BrickColor.new(data.Builds.WallColor)
						end 
					end
					-- put the builds
					for key, Data in pairs(data.Builds) do
						local subbed = string.gsub(key, "%d+", "")
						if rep.Buildables:FindFirstChild(subbed) then
							local RelativeCFrame = CFrame.fromMatrix(Vector3.new(Data.pX, Data.pY, Data.pZ), Vector3.new(Data.rXx, Data.rXy, Data.rXz), Vector3.new(Data.rYx, Data.rYy, Data.rYz))
							local BuildableClone = rep.Buildables:FindFirstChild(subbed):Clone()
							if game.Workspace:FindFirstChild(player.Name.."f") and game.Workspace.Locations:FindFirstChild(player.Name.."Location") then
								BuildableClone.Parent = game.Workspace:FindFirstChild(player.Name.."f")
								BuildableClone:SetPrimaryPartCFrame(RelativeCFrame + game.Workspace.Locations:FindFirstChild(player.Name.."Location").Position)
								print(BuildableClone, "CFrame is", BuildableClone.PrimaryPart.CFrame)
								BuildableClone:SetPrimaryPartCFrame(CFrame.new(Vector3.new(math.round(BuildableClone.PrimaryPart.Position.X),math.round(BuildableClone.PrimaryPart.Position.Y),math.round(BuildableClone.PrimaryPart.Position.Z))) * BuildableClone.PrimaryPart.CFrame.Rotation)
								print(BuildableClone, "CFrame is", BuildableClone.PrimaryPart.CFrame)
							end
						end
					end
				end
				if data.Colors then
					for i, colorName in pairs(data.Colors) do
						local colorCreate = Instance.new("IntValue")
						colorCreate.Parent = ColorsInventory
						colorCreate.Name = colorName
					end
				end
				if data.Textures then
					for i, TextureID in pairs(data.Textures) do
						if string.len(TextureID) >= 2 then
							local TextureCreate = Instance.new("IntValue")
							TextureCreate.Parent = TexturesInventory
							TextureCreate.Name = TextureID
						end
					end
				end
			

			if data.Pets then
				for i, v in pairs(data.Pets) do
					print(v)
					local petInRep = game.ReplicatedStorage.Pets:FindFirstChild(v, true)
					if petInRep then
						local clone = petInRep:Clone()
						clone.Parent = PetsFolder
					else
						warn("pet not found in rep")
					end
				end

				if data.CurrentPet then
					local petInRep = game.ReplicatedStorage.Pets:FindFirstChild(data.CurrentPet, true)
					if petInRep then
						local clone = petInRep:Clone()
						clone.Parent = CurrentPet
						givePet(player, petInRep)
					end
				end
			end

			-- login streak calculator
			print(os.time() - folder:GetAttribute("JoinTime"))
			local timeInSeconds = os.time() - folder:GetAttribute("JoinTime")
			print(timeInSeconds)
			if timeInSeconds > 86400 then
				-- reset time
				folder:SetAttribute("JoinTime", os.time())
				-- +1 login streak
				folder:SetAttribute("LoginStreak", folder:GetAttribute("LoginStreak") + 1)
				-- fireClient show the new reward
				showDailyReward:FireClient(player)
			end


			for count = 1, folder:GetAttribute("LoginStreak") % 5 do
				if Inventory:GetAttribute("DailyReward"..tostring(count)) == false then
					showDailyReward:FireClient(player)
					break
				end
			end


			-- set login streak to the portal
			portal.Part.StreakGui.TextLabel.Text = "Login Streak:\n"..tostring(folder:GetAttribute("LoginStreak"))

			print("Data Fully Loaded")
			
			
			--remove player from playerloading array since he is alr done
			for index = 1, #playerLoadingArray do
				if playerLoadingArray[index] == player.Name then
					table.remove(playerLoadingArray, index)
				end
			end
			
		end)
		
		if not successLoad then
			warn(errorLoad)
			ErrorLoading:FireClient(player)
		end
	else
		--==================== ERROR/NEW PLAYER
		warn(errormessage)
		print("error getting data for player")
		-- give player a spaceship
		local playerSpaceshipLevel = tostring(folder:GetAttribute("SpaceshipLevel"))
		local spaceship = rep:WaitForChild("Domes"):WaitForChild("Lvl"..playerSpaceshipLevel.."Ship")
		if spaceship then
			local spaceshipClone = spaceship:Clone()
			local Position = game.Workspace.Locations:FindFirstChild(player.Name.."Location").Position
			spaceshipClone:SetPrimaryPartCFrame(CFrame.new(Position))
			spaceshipClone.Parent = playerFolder
			char:WaitForChild("HumanoidRootPart").CFrame = spaceshipClone.PrimaryPart.CFrame + Vector3.new(0, 5, 0)
		end
		-- fireClient to start tutorial
		startTutorial:FireClient(player, 1)
		
		-- give player a few colors and textures to start with
		local white = Instance.new("IntValue")
		white.Name = "Institutional white"
		white.Parent = ColorsInventory

		local fossil = Instance.new("IntValue")
		fossil.Name = "Fossil"
		fossil.Parent = ColorsInventory

		local bronze = Instance.new("IntValue")
		bronze.Name = "Bronze"
		bronze.Parent = ColorsInventory

		local starterTexture = Instance.new("IntValue")
		starterTexture.Name = "rbxassetid://6794164216"
		starterTexture.Parent = TexturesInventory
		
		-- create furniture Data
		for count = 1, 16 do
			FindNewFurniture(player)
		end
		
		task.spawn(function()
			wait(16)
			NotificationsRemote:FireClient(player, "New furniture available in buildables shop! (Main Planet)")
		end)
		
		setUpFurniture:FireClient(player)
		
		-- give him some glass blocks cuz why not
		local glassBlocksClones = game.ReplicatedStorage:WaitForChild("Buildables"):WaitForChild("BuildableGlassBlock"):Clone()
		glassBlocksClones.Parent = Inventory
		glassBlocksClones:SetAttribute("Count", 10)
		
		local ChairClone = game.ReplicatedStorage:WaitForChild("Buildables"):WaitForChild("OneSeataFurniture", 5):Clone()
		ChairClone.Parent = Inventory
		
		-- starter pet
		local BearPetClone = game.ReplicatedStorage:WaitForChild("Pets"):WaitForChild("Starter"):WaitForChild("BearPet"):Clone()
		BearPetClone.Parent = PetsFolder
		
		--remove player from playerloading array since he is alr done
		for index = 1, #playerLoadingArray do
			if playerLoadingArray[index] == player.Name then
				table.remove(playerLoadingArray, index)
			end
		end
		
	end
end)

--========================================== player removing

local function GetPlayerData(Player)
	
	local DataToSave = {}
	print(playerLoadingArray)
	for index = 1, #playerLoadingArray do
		if playerLoadingArray[index] == Player.Name then print("not loaded so delete") return end
	end
	for _, leaderstats in ipairs(Player.leaderstats:GetChildren()) do
		DataToSave[leaderstats.Name] = leaderstats.Value
	end
	for AttribName, Attributes in pairs(Player.leaderstats:GetAttributes()) do
		DataToSave[AttribName] = Attributes
	end
	-- save pets
	DataToSave.Pets = {}
	for i, v in pairs(Player.Pets:GetChildren()) do
		DataToSave.Pets["Pet"..tostring(i)] = v.Name
	end
	if Player.CurrentPet:FindFirstChildOfClass("Model") then
		DataToSave.CurrentPet = Player.CurrentPet:FindFirstChildOfClass("Model").Name
	end
	
	DataToSave.StarPassTiers = {}
	for AttName, bool in pairs(Player.WearInventory:GetAttributes()) do
		DataToSave.StarPassTiers[AttName] = bool
	end
	-- saving daily rewards
	DataToSave.DailyRewards = {}
	for AttName, bool in pairs(Player.Inventory:GetAttributes()) do
		DataToSave.DailyRewards[AttName] = bool
	end
	-- save Furniture Data
	DataToSave.FurnitureData = {}
	for i, v in pairs(Player.FurnitureData:GetChildren()) do
		DataToSave.FurnitureData["Furniture_"..tostring(i)] = v.Name
	end
	
	-- saving player colors
	DataToSave.Colors = {}
	for i, v in pairs(Player.ColorsInventory:GetChildren()) do
		DataToSave.Colors["Color"..tostring(i)] = v.Name
	end
	-- saving player Codes Claimed
	DataToSave.Codes = {}
	for attName, v in pairs(Player.ColorsInventory:GetAttributes()) do
		DataToSave.Codes[attName] = true
	end
	-- saving player TextureInventory
	DataToSave.Textures = {}
	for i, v in pairs(Player.TexturesInventory:GetChildren()) do
		DataToSave.Textures["TextureID"..tostring(i)] = v.Name
	end
	-- saving build inventory
	DataToSave.BuildInventory = {}
	for i, v in pairs(Player.Inventory:GetChildren()) do
		DataToSave.BuildInventory[v.Name] = v:GetAttribute("Count")
	end
	-- save their builds
	DataToSave.Builds = {}
	if game.Workspace:FindFirstChild(Player.Name.."f") and game.Workspace.Locations:FindFirstChild(Player.Name.."Location") then
		local PlayerLocation = game.Workspace.Locations:FindFirstChild(Player.Name.."Location")
		for i, Models in pairs(game.Workspace:FindFirstChild(Player.Name.."f"):GetChildren()) do
			-- models inside the player's folder
			if string.match(Models.Name, "Lvl") then
				-- child of the spaceship
				DataToSave.Builds["BuildableFloorColor"] = tostring(Models:FindFirstChild("BuildableFloor").BrickColor)
				DataToSave.Builds["Color1"] = tostring(Models:FindFirstChild("Color1").BrickColor)
				DataToSave.Builds["Color2"] = tostring(Models:FindFirstChild("Color2").BrickColor)
				DataToSave.Builds["WallColor"] = tostring(Models:FindFirstChild("Wall").BrickColor)
				
				if Models:FindFirstChild("BuildableFloor"):FindFirstChildOfClass("Texture") then
					DataToSave.Builds["BuildableFloorTexture"] = Models:FindFirstChild("BuildableFloor"):FindFirstChildOfClass("Texture").Texture
				end
				if Models:FindFirstChild("Color1"):FindFirstChildOfClass("Texture") then
					DataToSave.Builds["Color1Texture"] = Models:FindFirstChild("Color1"):FindFirstChildOfClass("Texture").Texture
				end
				if Models:FindFirstChild("Color2"):FindFirstChildOfClass("Texture") then
					DataToSave.Builds["Color2Texture"] = Models:FindFirstChild("Color2"):FindFirstChildOfClass("Texture").Texture
				end		
				
			else
				-- it is a buildable so save it
				local cf = Models:GetPivot() - PlayerLocation.Position
				local t = 
					{pX = cf.Position.X, pY = cf.Position.Y, pZ = cf.Position.Z,
					rXx = cf.RightVector.X, rXy = cf.RightVector.Y, rXz = cf.RightVector.Z,
						rYx = cf.UpVector.X, rYy = cf.UpVector.Y, rYz = cf.UpVector.Z}
				
				-- reduce floats to 0s
				for i, v in pairs(t) do
					if math.abs(v) < 0.0001 then
						t[i] = 0
					end
				end
				DataToSave.Builds[Models.Name..tostring(i)] = t
			end
		end
		
	else
		DataToSave.Builds = MyDataStore:GetAsync(Player.UserId).Builds
	end

	print(DataToSave)

	return DataToSave
end

Players.PlayerRemoving:Connect(function(player)
	print("playerremovefired")
	
	local PlayerData = GetPlayerData(player)

	local success, errormessage = pcall(function()
		MyDataStore:SetAsync(player.UserId, PlayerData)
		table.insert(playerLoadingArray, player)
	end)
	
	wait(20)
	
	-- player folder
	if game.Workspace:FindFirstChild(player.Name.."f") then
		game.Workspace:FindFirstChild(player.Name.."f"):Destroy()
	end
	
	local plrLocation = game.Workspace.Locations:FindFirstChild(player.Name.."Location")
	if plrLocation then
		local parts = game.Workspace:GetPartsInPart(plrLocation)
		for i, v in pairs(parts, {math.huge}) do
			if v.Name == "HumanoidRootPart" then
				v.Parent:SetPrimaryPartCFrame(game.Workspace.Teleports.TeleportToSpawn.CFrame)
			end
		end
		
		plrLocation = "Location"
	end
	
	if game.Workspace.Portals:FindFirstChild(player.Name.."Portal") then
		for i, v in pairs(game.Workspace.Portals:FindFirstChild(player.Name.."Portal"):GetDescendants()) do
			if v:IsA("Part") or v:IsA("MeshPart") then
				v.Position -= Vector3.new(0, 20, 0)
			end
		end
		game.Workspace.Portals:FindFirstChild(player.Name.."Portal").Name = "Portal"
	end
	for i, v in pairs(playerLoadingArray) do
		if v == player.Name then
			table.remove(playerLoadingArray, i)
			print("Removed from player loading array", player)
		end
	end

	if success then
		print("PlayerData successfully saved")
	else
		print("error saving player data")
		warn(errormessage)
	end
end)

game:BindToClose(function()
	for _, players in ipairs(game.Players:GetPlayers()) do
		print("BindToClose Fired")
		
		local PlayerData = GetPlayerData(players)

		local success, errormessage = pcall(function()
			for i, v in pairs(playerLoadingArray) do
				if v == players.Name then
					return
				end
			end
			MyDataStore:SetAsync(players.UserId, PlayerData)
		end)
		
		if success then
			print("PlayerData successfully saved")
		else
			print("error saving player data")
			warn(errormessage)
		end
	end
end)


