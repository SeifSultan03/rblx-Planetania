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
local CosmeticsFrame = Button.Parent.Parent

-- player variables
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()


Button.MouseEnter:Connect(function()
	TweenBigger:Play()
end)

Button.MouseLeave:Connect(function()
	TweenSmaller:Play()
end)

Button.MouseButton1Down:Connect(function()
	Button.Parent.Visible = false
	CosmeticsFrame.BaseUi.ImageButton.Image = "rbxassetid://7841279797"
	for i, v in pairs(CosmeticsFrame:GetChildren()) do
		if v:IsA("TextButton") then
			v.Visible = false
		end
	end
	CosmeticsFrame.Parent.FullMenuFrame.Visible = true
	CosmeticsFrame.Parent.XpBarFrame.Visible = true
	CosmeticsFrame.Parent.BuildAndInv.Visible = true
	CosmeticsFrame.Parent.ExtrasFrame.Visible = true
	CosmeticsFrame.Parent.HouseUpgrades.Visible = true
	
end)
