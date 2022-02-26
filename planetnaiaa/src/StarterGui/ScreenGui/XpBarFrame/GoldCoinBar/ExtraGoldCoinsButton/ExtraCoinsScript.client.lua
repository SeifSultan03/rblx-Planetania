local Button = script.Parent
local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Size = Button.Size + UDim2.new(0, 5, 0, 5)
local goalsSmaller = {}
goalsSmaller.Size = Button.Size
local tweenInfo = TweenInfo.new(0.2)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)

Button.MouseEnter:Connect(function()
	TweenBigger:Play()
end)

Button.MouseLeave:Connect(function()
	TweenSmaller:Play()
end)

local ScreenGui = Button.Parent.Parent.Parent

local goalsColor = {}
goalsColor.BackgroundColor3 = Color3.new(1, 0.796078, 0.054902)
local goalsColorBackToBlack = {}
goalsColorBackToBlack.BackgroundColor3 = Color3.new(0.105882, 0.164706, 0.207843)
local colorInfo = TweenInfo.new(0.5)
local goalsColorText = {}
goalsColorText.TextColor3 = Color3.new(0.105882, 0.164706, 0.207843)
local goalsColorBackToBlackText = {}
goalsColorBackToBlackText.TextColor3 = Color3.new(1, 0.796078, 0.054902)


Button.MouseButton1Down:Connect(function()
	
	local Button = ScreenGui.FullMenuFrame.BaseUi.OpenMenuButton
	
	Button.Image = "rbxassetid://7808164343"
	-- open the menu UI, hide other UIs
	Button.Parent.Parent.Menu.Visible = true
	ScreenGui.XpBarFrame.Visible = false
	ScreenGui.BuildAndInv.Visible = false
	ScreenGui.CosmeticsFrame.Visible = false
	ScreenGui.ExtrasFrame.Visible = false
	ScreenGui.HouseUpgrades.Visible = false

	local PlayerGui = ScreenGui.Parent
	PlayerGui.CodeButton.Enabled = false
	
	local Button = ScreenGui.FullMenuFrame.Menu.CasesButton
	local TweenColorText = TweenService:Create(Button.TextLabel, colorInfo, goalsColorText)
	local TweenColor = TweenService:Create(Button, colorInfo, goalsColor)
	
	for i, v in pairs (Button.Parent:GetChildren()) do
		if v:IsA("TextButton") and v.Name ~= Button.Name then
			local TweenColorBack = TweenService:Create(v, colorInfo, goalsColorBackToBlack)
			TweenColorBack:Play()
			local TweenColorBack = TweenService:Create(v.TextLabel, colorInfo, goalsColorBackToBlackText)
			TweenColorBack:Play()
		end
	end

	-- close all BUT NOT Currency frame
	for i, v in pairs(Button.Parent:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "QuestsFrame" then
			v.Visible = false
			if v.Name == "CurrencyFrame" then -- copy paste and change to desired
				v.Visible = true
			end
		end
	end
	-- CaseIcon = black
	Button.Parent.CasesButton.CasesIcon.Image = "rbxassetid://7940807750"
	-- premium icon = orange
	Button.Parent.PremiumButton.PremiumIcon.Image = "rbxassetid://7819752377" 
	-- battle pass icon = orange
	Button.Parent.BattlePassButton.BattlePassIcon.Image = "rbxassetid://7819176942"
	-- Daily = orange
	Button.Parent.DailyShopButton.ShopIcon.Image = "rbxassetid://7819158941"
	TweenColor:Play()
	TweenColorText:Play()
end)
