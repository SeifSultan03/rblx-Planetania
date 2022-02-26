local Button = script.Parent

local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Size = Button.Size + UDim2.new(0, 5, 0, 5)
local goalsSmaller = {}
goalsSmaller.Size = Button.Size
local tweenInfo = TweenInfo.new(0.2)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)

local player = game.Players.LocalPlayer

Button.MouseEnter:Connect(function()
	TweenBigger:Play()
end)

Button.MouseLeave:Connect(function()
	TweenSmaller:Play()
end)
-- 7936221555 beach
-- 7800270226 main
-- 7936218437 tropical
local LevelUpID = 1230539895
local MarketPlaceService = game:GetService("MarketplaceService")

Button.MouseButton1Down:Connect(function()
	if game.PlaceId == 8420193736 then return end
	if player.leaderstats:GetAttribute("Level") >= 8 then
		game:GetService("TeleportService"):Teleport(8420193736)
	else
		script.Parent.Level.TextColor3 = Color3.fromRGB(255, 0, 4)
		wait(1)
		script.Parent.Level.TextColor3 = Color3.fromRGB(145, 145, 145)
		MarketPlaceService:PromptProductPurchase(player, LevelUpID)
	end
end)
