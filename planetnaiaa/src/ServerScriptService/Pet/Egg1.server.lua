local Egg1Remote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Pets"):WaitForChild("Egg1")

local Egg1 = game.ReplicatedStorage:WaitForChild("Pets"):WaitForChild("Egg1")

local Percentages = {
	["Common"] = 400,
	["Rare"] = 300,
	["Epic"] = 200,
	["Legendary"] = 95,
	["Mythical"] = 5
}

local PercentagesX2 = {
	["Common"] = 400,
	["Rare"] = 300,
	["Epic"] = 200,
	["Legendary"] = 190,
	["Mythical"] = 10
}

local PercentagesX10 = {
	["Common"] = 400,
	["Rare"] = 300,
	["Epic"] = 200,
	["Legendary"] = 950,
	["Mythical"] = 50
}

local Leg1 = game.ReplicatedStorage:WaitForChild("Pets"):WaitForChild("Egg1"):WaitForChild("SharkPet")
local Leg2 =  game.ReplicatedStorage:WaitForChild("Pets"):WaitForChild("Egg1"):WaitForChild("Golden CatPet")
local Myth = game.ReplicatedStorage:WaitForChild("Pets"):WaitForChild("Egg1"):WaitForChild("Aqua DragonPet")

local function FindPetOfRarity(Rarity, Folder)
	
	while wait() do
		print("Attempting")
		local pets = Folder:GetChildren()
		local rand = math.random(1, #pets)
		if pets[rand]:GetAttribute("Rarity") == Rarity then
			return pets[rand]
		end
	end
end

function Egg1Remote.OnServerInvoke(player)
	
	if player.leaderstats:GetAttribute("MaxPets") <= #player.Pets:GetChildren() then
		return false
	end
	if player.leaderstats.Coins.Value >= 1000 then
		player.leaderstats.Coins.Value -= 1000
	else
		return nil
	end
	if player.leaderstats:GetAttribute("BoughtEgg1Before") then
		if player.leaderstats:GetAttribute("OwnsX10Luck") then
			local total = 0
			for i, v in pairs(PercentagesX10) do
				total += v
			end
			print(total)
			local rand = math.random(1, total)
			
			local counter = 0
			for i, v in pairs(PercentagesX10) do
				counter += v 
				if counter >= rand then
					local pet = FindPetOfRarity(i, Egg1)
					local petClone = pet:Clone()
					petClone.Parent = player.Pets
					return pet
				end
			end
		elseif player.leaderstats:GetAttribute("OwnsX2Luck") then
			local total = 0
			for i, v in pairs(PercentagesX2) do
				total += v
			end
			print(total)
			local rand = math.random(1, total)

			local counter = 0
			for i, v in pairs(PercentagesX2) do
				counter += v 
				if counter >= rand then
					local pet = FindPetOfRarity(i, Egg1)
					local petClone = pet:Clone()
					petClone.Parent = player.Pets
					return pet
				end
			end
		else
			local total = 0
			for i, v in pairs(Percentages) do
				total += v
			end
			print(total)
			local rand = math.random(1, total)

			local counter = 0
			for i, v in pairs(Percentages) do
				counter += v 
				if counter >= rand then
					local pet = FindPetOfRarity(i, Egg1)
					local petClone = pet:Clone()
					petClone.Parent = player.Pets
					return pet
				end
			end
		end
	else
		-- 10x  forced  luck
		player.leaderstats:SetAttribute("BoughtEgg1Before", true)
		local Rand = math.random(1, 3)
		if Rand == 1 then
			local clone = Myth:Clone()
			clone.Parent = player.Pets
			return Myth
		elseif Rand == 2 then
			local clone = Leg1:Clone()
			clone.Parent = player.Pets
			return Leg1
		else
			local clone = Leg2:Clone()
			clone.Parent = player.Pets
			return Leg2
		end
	end
end
		
	
