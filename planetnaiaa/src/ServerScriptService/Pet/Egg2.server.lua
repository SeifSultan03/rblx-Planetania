local Egg1Remote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Pets"):WaitForChild("Egg2")

local Egg2 = game.ReplicatedStorage:WaitForChild("Pets"):WaitForChild("Egg2")

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
	if player.leaderstats:GetAttribute("GoldCoins") >= 100 then
		player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") - 100)
	else
		return nil
	end
	
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
					local pet = FindPetOfRarity(i, Egg2)
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
					local pet = FindPetOfRarity(i, Egg2)
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
					local pet = FindPetOfRarity(i, Egg2)
					local petClone = pet:Clone()
					petClone.Parent = player.Pets
					return pet
				end
			end
		end
	
end
		
	
