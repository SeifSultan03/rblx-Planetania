local Button = script.Parent
local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Size = Button.Size + UDim2.new(0, 5, 0, 5)
local goalsSmaller = {}
goalsSmaller.Size = Button.Size
local tweenInfo = TweenInfo.new(0.2)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)

local goalsColor = {}
goalsColor.BackgroundColor3 = Color3.new(1, 0.796078, 0.054902)
goalsColorBackToBlack = {}
goalsColorBackToBlack.BackgroundColor3 = Color3.new(0.105882, 0.164706, 0.207843)
local colorInfo = TweenInfo.new(0.5)
local TweenColor = TweenService:Create(Button, colorInfo, goalsColor)
local goalsColorText = {}
goalsColorText.TextColor3 = Color3.new(0.105882, 0.164706, 0.207843)
local goalsColorBackToBlackText = {}
goalsColorBackToBlackText.TextColor3 = Color3.new(1, 0.796078, 0.054902)
local TweenColorText = TweenService:Create(Button.TextLabel, colorInfo, goalsColorText)

Button.MouseEnter:Connect(function()
	TweenBigger:Play()
end)

Button.MouseLeave:Connect(function()
	TweenSmaller:Play()
end)

Button.MouseButton1Down:Connect(function()
	-- change button colors
	for i, v in pairs (script.Parent.Parent:GetChildren()) do
		if v:IsA("TextButton") and v.Name ~= script.Parent.Name then
			local TweenColorBack = TweenService:Create(v, colorInfo, goalsColorBackToBlack)
			TweenColorBack:Play()
			local TweenColorBack = TweenService:Create(v.TextLabel, colorInfo, goalsColorBackToBlackText)
			TweenColorBack:Play()
		end
	end
	-- close all BUT NOT starpass frame
	for i, v in pairs(Button.Parent:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "QuestsFrame" then
			v.Visible = false
			if v.Name == "StarPassFrame" then -- copy paste and change to desired
				v.Visible = true
			end
		end
	end
	-- CaseIcon = orange
	Button.Parent.CasesButton.CasesIcon.Image = "rbxassetid://7940738989"
	-- premium icon = orange
	Button.Parent.PremiumButton.PremiumIcon.Image = "rbxassetid://7819752377"
	-- battle pass icon = black
	Button.Parent.BattlePassButton.BattlePassIcon.Image = "rbxassetid://7819986969"
	-- Daily = orange
	Button.Parent.DailyShopButton.ShopIcon.Image = "rbxassetid://7819158941"

	TweenColor:Play()
	TweenColorText:Play()
end)