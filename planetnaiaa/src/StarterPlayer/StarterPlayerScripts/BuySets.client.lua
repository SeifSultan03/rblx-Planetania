local player = script.Parent.Parent
local rep = game.ReplicatedStorage
local ScreenGui = player.PlayerGui:WaitForChild("BillboardScreen")
local MarketPlaceService = game:GetService("MarketplaceService")

local IDS = {
	["Set1"] = 1230526347,
	["Set2"] = 1230526631,
	["Set3"] = 1230526762,
	["Set4"] = 1230528304,
	["Set5"] = 1230528500
}
for i, v in pairs(game.Workspace:WaitForChild("Assets"):WaitForChild("FurnitureSets"):GetChildren()) do
	local BillboardGui = v:WaitForChild("BillboardGui")
	BillboardGui.Parent = ScreenGui
	BillboardGui.Adornee = v
	local buyButton = BillboardGui:WaitForChild("Frame"):WaitForChild("BuyButton")
	buyButton.MouseButton1Down:Connect(function()
		MarketPlaceService:PromptProductPurchase(player, IDS[v.Name])
	end)
end