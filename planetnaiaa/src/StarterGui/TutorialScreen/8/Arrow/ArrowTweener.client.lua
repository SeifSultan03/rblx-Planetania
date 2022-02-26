local Button = script.Parent
local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Position = UDim2.new(Button.Position.X.Scale - 0.05, 0, Button.Position.Y.Scale, 0)
local goalsSmaller = {}
goalsSmaller.Position = Button.Position
local tweenInfo = TweenInfo.new(1)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)

while true do
	TweenBigger:Play()
	wait(1)
	TweenSmaller:Play()
	wait(1)
end