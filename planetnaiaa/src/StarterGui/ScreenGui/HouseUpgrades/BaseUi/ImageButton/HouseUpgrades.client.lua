local Button = script.Parent 

local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Size = Button.Size + UDim2.new(0, 5, 0, 5)
local goalsSmaller = {}
goalsSmaller.Size = Button.Size
local tweenInfo = TweenInfo.new(0.2)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)

local BuildAndInv = Button.Parent.Parent-- buildandinv is actually houseupgrades
local HouseUI = BuildAndInv.HouseUI

local player = game.Players.LocalPlayer

Button.MouseEnter:Connect(function()
	TweenBigger:Play()
end)

Button.MouseLeave:Connect(function()
	TweenSmaller:Play()
end)
Button.MouseButton1Down:Connect(function()
	if HouseUI.Visible == true then -- if inventory open, close it
		HouseUI.Visible = false
		BuildAndInv.Parent.BuildingTools.Visible = false -- hide building tools
		Button.Image = "rbxassetid://8099207348"
		for i, v in pairs(BuildAndInv:GetChildren()) do
			if v:IsA("TextButton") then
				v.Visible = false
			end
		end
		BuildAndInv.Parent.FullMenuFrame.Visible = true -- menu visible
		BuildAndInv.Parent.XpBarFrame.Visible = true -- xpbar vis
		BuildAndInv.Parent.CosmeticsFrame.Visible = true -- cosmetics button vis
		BuildAndInv.Parent.ExtrasFrame.Visible = true
		BuildAndInv.Parent.BuildAndInv.Visible = true
		
		local PlayerGui = script.Parent.Parent.Parent.Parent.Parent
		PlayerGui.CodeButton.Enabled = true
	return end
	Button.Image = "rbxassetid://8099197708" -- if inventory closed, open it and hide other UIs
	BuildAndInv.Parent.FullMenuFrame.Visible = false -- hide
	BuildAndInv.Parent.XpBarFrame.Visible = false -- hide
	BuildAndInv.Parent.CosmeticsFrame.Visible = false -- hide cosmetics button
	BuildAndInv.Parent.ExtrasFrame.Visible = false
	BuildAndInv.Parent.BuildAndInv.Visible = false
	
	local PlayerGui = script.Parent.Parent.Parent.Parent.Parent
	PlayerGui.CodeButton.Enabled = false
	
	HouseUI.Visible = true
end)
