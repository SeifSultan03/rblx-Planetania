local Button = script.Parent
local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Size = Button.Size + UDim2.new(0, 5, 0, 5)
local goalsSmaller = {}
goalsSmaller.Size = Button.Size
local tweenInfo = TweenInfo.new(0.2)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)

local InventoryFrame = Button.Parent
local BuildAndInv = Button.Parent.Parent
local DecorBut = BuildAndInv.Decoration

Button.MouseEnter:Connect(function()
	TweenBigger:Play()
end)

Button.MouseLeave:Connect(function()
	TweenSmaller:Play()
end)

Button.MouseButton1Down:Connect(function()
	Button.Parent.Visible = false
	BuildAndInv.BaseUi.ImageButton.Image = "rbxassetid://7809144208"
	for i, v in pairs(BuildAndInv:GetChildren()) do
		if v:IsA("TextButton") then
			v.Visible = false
		end
	end
	BuildAndInv.Parent.FullMenuFrame.Visible = true
	BuildAndInv.Parent.XpBarFrame.Visible = true
	BuildAndInv.Parent.CosmeticsFrame.Visible = true
	BuildAndInv.Parent.ExtrasFrame.Visible = true
	BuildAndInv.Parent.BuildingTools.Visible = false
	BuildAndInv.Parent.HouseUpgrades.Visible = true
	BuildAndInv.Parent.Parent.CodeButton.Enabled = true
end)