local ID10 = 1230631458
local ID25 = 1231152819
local ID100 = 1230631501
local ID250 = 1231154461
local ID1000 = 1230631551
local ID2500 = 1230631595

local R10 = script.Parent:WaitForChild("R10")
local R25 = script.Parent:WaitForChild("R25")
local R100 = script.Parent:WaitForChild("R100")
local R250 = script.Parent:WaitForChild("R250")
local R1000 = script.Parent:WaitForChild("R1000")
local R2500 = script.Parent:WaitForChild("R2500")

local MarketPlaceService = game:GetService("MarketplaceService")
local player = game.Players.LocalPlayer

R10.MouseButton1Down:Connect(function()
	MarketPlaceService:PromptProductPurchase(player, ID10)
end)

R25.MouseButton1Down:Connect(function()
	MarketPlaceService:PromptProductPurchase(player, ID25)
end)

R100.MouseButton1Down:Connect(function()
	MarketPlaceService:PromptProductPurchase(player, ID100)
end)

R250.MouseButton1Down:Connect(function()
	MarketPlaceService:PromptProductPurchase(player, ID250)
end)

R1000.MouseButton1Down:Connect(function()
	MarketPlaceService:PromptProductPurchase(player, ID1000)
end)

R2500.MouseButton1Down:Connect(function()
	MarketPlaceService:PromptProductPurchase(player, ID2500)
end)