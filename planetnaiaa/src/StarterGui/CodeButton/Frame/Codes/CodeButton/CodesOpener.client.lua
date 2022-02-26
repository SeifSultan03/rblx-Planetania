local Button = script.Parent
local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Size = Button.Size + UDim2.new(0, 5, 0, 5)
local goalsSmaller = {}
goalsSmaller.Size = Button.Size
local tweenInfo = TweenInfo.new(0.2)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)

local CodeFrame = script.Parent.Parent.Parent.Parent:WaitForChild("CodesFrame")
local ScreenGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ScreenGui")
Button.MouseEnter:Connect(function()
	TweenBigger:Play()
end)

Button.MouseLeave:Connect(function()
	TweenSmaller:Play()
end)

Button.MouseButton1Down:Connect(function()
	if CodeFrame.Visible == true then -- if inventory open, close it
		CodeFrame.Visible = false
		ScreenGui.Enabled = true
		Button.Image = "rbxassetid://8258665174"
	else
		CodeFrame.Visible = true
		ScreenGui.Enabled = false
		Button.Image = "rbxassetid://8258656533" -- if inventory closed, open it and hide other UIs
		
	end
end)
