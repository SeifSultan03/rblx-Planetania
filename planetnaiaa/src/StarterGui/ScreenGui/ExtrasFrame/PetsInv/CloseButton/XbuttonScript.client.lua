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
local ExtrasFrame = Button.Parent.Parent

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
	ExtrasFrame.BaseUi.PetsButton.Image = "rbxassetid://8375338315"
	for i, v in pairs(ExtrasFrame:GetChildren()) do
		if v:IsA("TextButton") then
			v.Visible = false
		end
	end
	ExtrasFrame.Parent.FullMenuFrame.Visible = true
	ExtrasFrame.Parent.XpBarFrame.Visible = true
	ExtrasFrame.Parent.BuildAndInv.Visible = true
	ExtrasFrame.Parent.CosmeticsFrame.Visible = true
	ExtrasFrame.Parent.HouseUpgrades.Visible = true
	ExtrasFrame.Parent.Parent.CodeButton.Enabled = true
	
	
end)
