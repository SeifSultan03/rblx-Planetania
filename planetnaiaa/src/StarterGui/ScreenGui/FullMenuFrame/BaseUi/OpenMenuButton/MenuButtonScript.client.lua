local Button = script.Parent
local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Size = Button.Size + UDim2.new(0, 5, 0, 5)
local goalsSmaller = {}
goalsSmaller.Size = Button.Size
local tweenInfo = TweenInfo.new(0.2)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)
local ScreenGui = Button.Parent.Parent.Parent

local player = game:GetService("Players").LocalPlayer

Button.MouseEnter:Connect(function()
	TweenBigger:Play()
end)

Button.MouseLeave:Connect(function()
	TweenSmaller:Play()
end)

local HouseUi = ScreenGui:WaitForChild("HouseUpgrades"):WaitForChild("HouseUI")

local function OpenStuff()
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

	local PlayerLevel = player.leaderstats:GetAttribute("Level")
	-- getting the claim buttons for the FreeStarPass GUI
	for i, v in pairs(Button.Parent.Parent.Menu.StarPassFrame.NonStarPassScroll:GetChildren()) do
		if v:IsA("ImageLabel") and tonumber(v.Name) ~= nil then
			local Number = tonumber(v.Name) - 100
			print(PlayerLevel, Number)
			if PlayerLevel >= Number and player:WaitForChild("WearInventory"):GetAttribute("Tier_"..tostring(Number)) == false then
				print("Claimbutton for", Number, "is visible")
				v.ClaimButton.Visible =  true
			end
		end
	end
	for i, v in pairs(Button.Parent.Parent.Menu.StarPassFrame.StarPassScroll:GetChildren()) do
		-- getting the claim buttons for the FreeStarPass GUI
		if v:IsA("ImageLabel") and tonumber(v.Name) ~= nil then
			local Number = tonumber(v.Name) - 100
			if PlayerLevel >= Number and player:WaitForChild("WearInventory"):GetAttribute("PaidTier_"..tostring(Number)) == false then
				print("Claimbutton for", Number, "is visible")
				v.ClaimButton.Visible = true
			end
		end
	end
	
end


Button.MouseButton1Down:Connect(function()
	if Button.Image == "rbxassetid://7808164343" then
		if HouseUi.Visible then
			Button.Image = "rbxassetid://7804041528"
			Button.Parent.Parent.Menu.Visible = false
			ScreenGui.HouseUpgrades.Visible = true
			return
		end
		Button.Image = "rbxassetid://7804041528"
		-- close the menu UI, and show the other UIs
		ScreenGui.XpBarFrame.Visible = true
		Button.Parent.Parent.Menu.Visible = false
		ScreenGui.BuildAndInv.Visible = true
		ScreenGui.CosmeticsFrame.Visible = true
		ScreenGui.ExtrasFrame.Visible = true
		ScreenGui.HouseUpgrades.Visible = true
		
		local PlayerGui = ScreenGui.Parent
		PlayerGui.CodeButton.Enabled = true
	else
		OpenStuff()
	end
end)

local Menu = Button.Parent.Parent:WaitForChild("Menu")

Menu.Changed:Connect(function()
	if Menu.Visible then
		OpenStuff()
	end
end)

Menu.Parent.Changed:Connect(function()
	if Menu.Visible then
		OpenStuff()
	end
end)
