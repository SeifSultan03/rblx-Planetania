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
Button.MouseButton1Down:Connect(function()
	if game.PlaceId == 6735306373 then return end
	game:GetService("TeleportService"):Teleport(6735306373)
end)
