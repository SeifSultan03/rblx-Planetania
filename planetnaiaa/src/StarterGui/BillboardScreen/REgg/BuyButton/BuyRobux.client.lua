local ID = 1231244846
local MarketPlaceService = game:GetService("MarketplaceService")
local player = game.Players.LocalPlayer

script.Parent.MouseButton1Down:Connect(function()
	MarketPlaceService:PromptProductPurchase(player, ID)
end)
