local MarketPlaceService = game:GetService("MarketplaceService")

local GamepassId = 25581331

local function promptPurchase()
	local player = game.Players.LocalPlayer
	local hasPass = false

	local success, message = pcall(function()
		hasPass = MarketPlaceService:UserOwnsGamePassAsync(player.UserId, GamepassId)
	end)

	if hasPass == true  then
		print("player already has the gamepass")
	else
		MarketPlaceService:PromptGamePassPurchase(player, GamepassId)
	end
end


script.Parent.MouseButton1Down:Connect(function()
	promptPurchase()
end)

local StarPassFrame = script.Parent.Parent.Parent.Parent:WaitForChild("ScreenGui"):WaitForChild("FullMenuFrame"):WaitForChild("Menu"):WaitForChild("StarPassFrame")
local StarPassScroll = StarPassFrame:WaitForChild("StarPassScroll")

MarketPlaceService.PromptGamePassPurchaseFinished:Connect(function(player, PurchaseID, PurchaseSuccess)
	if PurchaseSuccess == true and PurchaseID == GamepassId then
		local PlayerLevel = game.Players.LocalPlayer.leaderstats:GetAttribute("Level")
		for i, v in pairs(StarPassScroll:GetChildren()) do
			if v:IsA("ImageLabel") and tonumber(v.Name) ~= nil then
				local Number = tonumber(v.Name) - 100
				if PlayerLevel >= Number and player:WaitForChild("WearInventory"):GetAttribute("PaidTier_"..tostring(Number)) ~= true then
					v.ClaimButton.Visible = true
				end
			end
		end
	end
end)