local GamepassId = 26623032
local MarketPlaceService = game:GetService("MarketplaceService")


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