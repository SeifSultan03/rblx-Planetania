local MarketPlaceService = game:GetService("MarketplaceService")

local StarPassID = 25581331
local VipID = 25801911
local XLSpaceship = 26469186
local GlassBundleID = 26470077
local StarterPackID = 26470612
local GridSizeID = 26472093
local x2Luck = 26623021
local x10Luck = 26623032
local Pet10Space = 26670032

local rep = game:GetService("ReplicatedStorage")

local tags = {
	["VIP"] = {TagText = "VIP", TagColor = Color3.fromRGB(255, 183, 0)}, 
}

local chatService = require(game.ServerScriptService:WaitForChild("ChatServiceRunner"):WaitForChild("ChatService"))

MarketPlaceService.PromptGamePassPurchaseFinished:Connect(function(player, PurchaseID, PurchaseSuccess)
	if PurchaseSuccess == true and PurchaseID == StarPassID then
		player.leaderstats:SetAttribute("OwnsStarPass", true)
		for i, v in pairs(rep:WaitForChild("StarPassItems"):WaitForChild("Paid"):GetChildren()) do 
			-- setting bool values for if claimed or not
			player.WearInventory:SetAttribute("PaidTier_"..tostring(i), false)
		end
	end
	
	if PurchaseSuccess == true and PurchaseID == VipID then
		player.leaderstats:SetAttribute("OwnsVIP", true)
		print("given tag")
		local speaker = chatService:GetSpeaker(player.Name)
		speaker:SetExtraData("Tags",{tags["VIP"]})
	end
	
	if PurchaseSuccess == true and PurchaseID == XLSpaceship then
		player.leaderstats:SetAttribute("SpaceshipLevel", 90)
	end
	
	if PurchaseSuccess == true and PurchaseID == GlassBundleID then
		if player.Inventory:FindFirstChild("BuildableGlassBlock") then
			player.Inventory:FindFirstChild("BuildableGlassBlock"):SetAttribute("Count", player.Inventory:FindFirstChild("BuildableGlassBlock"):GetAttribute("Count") + 30)
		else
			local clone = game.ReplicatedStorage.Buildables:WaitForChild("BuildableGlassBlock"):Clone()
			clone.Parent = player.Inventory
			clone:SetAttribute("Count", 30)
		end
	end
	
	if PurchaseSuccess == true and PurchaseID == StarterPackID then
		player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 1000)
		player.leaderstats.Coins.Value += 6000
	end
	
	if PurchaseSuccess == true and PurchaseID == GridSizeID then
		player.leaderstats:SetAttribute("OwnsGridSize", true)
	end
	
	if PurchaseSuccess == true and PurchaseID == x2Luck then
		player.leaderstats:SetAttribute("OwnsX2Luck", true)
	end
	
	if PurchaseSuccess == true and PurchaseID == x10Luck then
		player.leaderstats:SetAttribute("OwnsX10Luck", true)
	end
	
	if PurchaseSuccess == true and PurchaseID == Pet10Space then
		player.leaderstats:SetAttribute("MaxPets", player.leaderstats:GetAttribute("MaxPets") + 50)
	end
	
end)

