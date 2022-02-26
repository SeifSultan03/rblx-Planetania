local Button = script.Parent 

local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Size = Button.Size + UDim2.new(0, 5, 0, 5)
local goalsSmaller = {}
goalsSmaller.Size = Button.Size
local tweenInfo = TweenInfo.new(0.2)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)

local ScreenGui = script.Parent.Parent.Parent.Parent
local ConfirmBackHomeFrame = ScreenGui.Parent:WaitForChild("ConfirmationsGui"):WaitForChild("ConfirmBackHome")

Button.MouseEnter:Connect(function()
	TweenBigger:Play()
end)

Button.MouseLeave:Connect(function()
	TweenSmaller:Play()
end)
Button.MouseButton1Down:Connect(function()
	ScreenGui.Enabled = false
	ScreenGui.Parent.CodeButton.Frame.Codes.CodeButton.Visible = false
	ConfirmBackHomeFrame.Visible = true
end)
