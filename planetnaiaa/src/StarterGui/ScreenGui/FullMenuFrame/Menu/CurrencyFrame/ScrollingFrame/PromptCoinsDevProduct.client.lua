local SmallBuckies = 1226087281
local MediumBuckies = 1227806070
local LargeBuckies = 1227806529
local SmallGoldBuckies = 1227808309
local MediumGoldBuckies = 1227812999
local BigGoldBuckies = 1227813122

local player = game.Players.LocalPlayer
local MarketPlaceService = game:GetService("MarketplaceService")

local smallButton = script.Parent:WaitForChild("1000Buckies").TextButton
local mediumButton = script.Parent:WaitForChild("2500Buckies").TextButton
local bigButton = script.Parent:WaitForChild("6000Buckies").TextButton
local smallGoldButton = script.Parent:WaitForChild("200GoldenBuckies").TextButton
local mediumGoldButton = script.Parent:WaitForChild("500GoldenBuckies").TextButton
local bigGoldButton = script.Parent:WaitForChild("1000GoldenBuckies").TextButton

smallButton.MouseButton1Down:Connect(function()
	MarketPlaceService:PromptProductPurchase(player, SmallBuckies)
end)
mediumButton.MouseButton1Down:Connect(function()
	MarketPlaceService:PromptProductPurchase(player, MediumBuckies)
end)
bigButton.MouseButton1Down:Connect(function()
	MarketPlaceService:PromptProductPurchase(player, LargeBuckies)
end)
smallGoldButton.MouseButton1Down:Connect(function()
	MarketPlaceService:PromptProductPurchase(player, SmallGoldBuckies)
end)
mediumGoldButton.MouseButton1Down:Connect(function()
	MarketPlaceService:PromptProductPurchase(player, MediumGoldBuckies)
end)
bigGoldButton.MouseButton1Down:Connect(function()
	MarketPlaceService:PromptProductPurchase(player, BigGoldBuckies)
end)