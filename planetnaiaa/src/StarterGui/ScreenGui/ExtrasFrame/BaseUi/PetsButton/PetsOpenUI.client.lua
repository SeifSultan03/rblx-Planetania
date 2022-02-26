local Button = script.Parent
local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Size = Button.Size + UDim2.new(0, 5, 0, 5)
local goalsSmaller = {}
goalsSmaller.Size = Button.Size
local tweenInfo = TweenInfo.new(0.2)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)

local ExtrasFrame = Button.Parent.Parent
local InventoryFrame = ExtrasFrame.PetsInv

-- player speed
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local Template = script.Parent.Parent.Parent:WaitForChild("PetsInv"):WaitForChild("Inventory"):WaitForChild("Template")

local Colors = {
	["Common"] = Color3.new(0.266667, 1, 0),
	["Rare"] = Color3.new(0, 0.768627, 1),
	["Epic"] = Color3.new(0.933333, 0, 1),
	["Legendary"] = Color3.new(1, 0.835294, 0),
	["Mythical"] = Color3.new(1, 0, 0.0156863)
}

local function UpdateCanvasSize(Canvas, Constraint)
	Canvas.CanvasSize = UDim2.new(0, Constraint.AbsoluteContentSize.X, 0, Constraint.AbsoluteContentSize.Y)
end

local function UpdateUi()
	for i, v in pairs(Template.Parent:GetChildren()) do
		if v:IsA("TextButton") and v.Name ~= "Template" then
			v:Destroy()
		end
	end
	
	InventoryFrame.BackPack.Text = tostring(#player.Pets:GetChildren()).."/"..tostring(player.leaderstats:GetAttribute("MaxPets"))

	for i, pets in pairs(player.Pets:GetChildren()) do
		local clone = Template:Clone()
		clone.Parent = Template.Parent
		clone.Visible = true
		clone.Name = pets.Name
		clone.LayoutOrder = 1000 / tonumber(pets:GetAttribute("Multi")) * 100
		clone.Multiplier.Text = "x"..pets:GetAttribute("Multi")
		clone.Multiplier.TextColor3 = Colors[pets:GetAttribute("Rarity")]
		clone.Rarity.Text = pets:GetAttribute("Rarity")
		clone.Rarity.TextColor3 = Colors[pets:GetAttribute("Rarity")]

		local VPF = clone:WaitForChild("ViewportFrame")
		local PetClone = pets:Clone()
		PetClone.Parent = VPF

		local VPFCam = Instance.new("Camera")
		VPFCam.Parent = VPF
		VPF.CurrentCamera = VPFCam
		local mainPart = PetClone:WaitForChild("m")
		VPFCam.CFrame = CFrame.new(mainPart.Position - Vector3.new(3 + (mainPart.Size.Y/2)/math.tan(math.rad(35)), 0, 0), mainPart.Position)

	end
	local current = player.CurrentPet:FindFirstChildOfClass("Model")
	if current then
		for i, v in pairs(Template.Parent:GetChildren()) do
			print(v.Name, current.Name)
			if v.Name == current.Name then
				v.BackgroundColor3 = Color3.new(0.0156863, 1, 0)
				break
			end
		end
	end
	UpdateCanvasSize(InventoryFrame.Inventory, InventoryFrame.Inventory.UIGridLayout)
end

Button.MouseEnter:Connect(function()
	TweenBigger:Play()
end)

Button.MouseLeave:Connect(function()
	TweenSmaller:Play()
end)

Button.MouseButton1Down:Connect(function()
	if InventoryFrame.Visible == true then -- if inventory open, close it
		InventoryFrame.Visible = false
		Button.Image = "rbxassetid://8375338315"
		
		ExtrasFrame.Parent.FullMenuFrame.Visible = true -- menu visible
		ExtrasFrame.Parent.XpBarFrame.Visible = true -- xpbar vis
		ExtrasFrame.Parent.BuildAndInv.Visible = true -- buildbutton vis
		ExtrasFrame.Parent.CosmeticsFrame.Visible = true -- cosmetics but vis
		ExtrasFrame.Parent.HouseUpgrades.Visible = true
		
		local PlayerGui = ExtrasFrame.Parent.Parent
		PlayerGui.CodeButton.Enabled = true
	return end
	Button.Image = "rbxassetid://8375331397" -- if inventory closed, open it and hide other UIs
	ExtrasFrame.Parent.FullMenuFrame.Visible = false -- hide
	ExtrasFrame.Parent.XpBarFrame.Visible = false -- hide outer UI
	ExtrasFrame.Parent.BuildAndInv.Visible = false
	ExtrasFrame.Parent.CosmeticsFrame.Visible = false
	ExtrasFrame.Parent.HouseUpgrades.Visible = false

	
	local PlayerGui = ExtrasFrame.Parent.Parent
	PlayerGui.CodeButton.Enabled = false
	
	InventoryFrame.Visible = true
	
	UpdateUi()
end)

local UpdateBindable = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Pets"):WaitForChild("UpdateUI")

UpdateBindable.Event:Connect(function()
	wait(0.25)
	UpdateUi()
end)
