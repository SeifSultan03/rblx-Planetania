local Button = script.Parent
local BuildInvUI = Button.Parent.Parent.BuildInventory

local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Size = Button.Size + UDim2.new(0, 5, 0, 5)
local goalsSmaller = {}
goalsSmaller.Size = Button.Size
local tweenInfo = TweenInfo.new(0.2)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)

local BuildAndInv = Button.Parent.Parent
local InventoryFrame = BuildAndInv.BuildInventory

local player = game.Players.LocalPlayer
local ScrollingFrame = script.Parent.Parent.Parent:WaitForChild("BuildInventory"):WaitForChild("ScrollingFrame")

local function UpdateCanvasSize(Canvas, Constraint)
	Canvas.CanvasSize = UDim2.new(0, Constraint.AbsoluteContentSize.X, 0, Constraint.AbsoluteContentSize.Y)
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
		BuildAndInv.Parent.BuildingTools.Visible = false -- hide building tools
		Button.Image = "rbxassetid://7809144208"
		for i, v in pairs(BuildAndInv:GetChildren()) do
			if v:IsA("TextButton") then
				v.Visible = false
			end
		end
		BuildAndInv.Parent.FullMenuFrame.Visible = true -- menu visible
		BuildAndInv.Parent.XpBarFrame.Visible = true -- xpbar vis
		BuildAndInv.Parent.CosmeticsFrame.Visible = true -- cosmetics button vis
		BuildAndInv.Parent.ExtrasFrame.Visible = true
		BuildAndInv.Parent.HouseUpgrades.Visible = true
		
		local PlayerGui = BuildAndInv.Parent.Parent
		PlayerGui.CodeButton.Enabled = true
		
	return end
	Button.Image = "rbxassetid://7809139638" -- if inventory closed, open it and hide other UIs
	BuildAndInv.Parent.FullMenuFrame.Visible = false -- hide
	BuildAndInv.Parent.XpBarFrame.Visible = false -- hide
	BuildAndInv.Parent.CosmeticsFrame.Visible = false -- hide cosmetics button
	BuildAndInv.Parent.ExtrasFrame.Visible = false
	BuildAndInv.Parent.HouseUpgrades.Visible = false
	
	local PlayerGui = BuildAndInv.Parent.Parent
	PlayerGui.CodeButton.Enabled = false
	
	BuildAndInv.Parent.BuildingTools.Visible = true -- show building tools
	InventoryFrame.Visible = true
	for i, v in pairs(BuildAndInv:GetChildren()) do
		if v:IsA("TextButton") then
			-- make colors black (unpressed)
			v.BackgroundColor3 = Color3.new(0.105882, 0.164706, 0.207843)
			v.Visible = true
			if v.Name == "All" then
				-- make the "ALL" button activated (yellow)
			v.BackgroundColor3 = Color3.new(1, 0.796078, 0.054902)
			end
		end
	end
	
	-- delete the stuff already there
	for i, v in pairs(ScrollingFrame:GetChildren()) do
		print(v)
		if v:IsA("ImageButton") and v.Name ~= "Template" then 
			print("destroying "..tostring(v))
			v:Destroy()
		end
	end
	-- clone the stuff
	for Number, Item in pairs(player.Inventory:GetChildren()) do
		if Item:IsA("Folder") == false then

			local TemplateClone = ScrollingFrame.Template:Clone()
			TemplateClone.Name = Item.Name
			TemplateClone.Parent = ScrollingFrame
			TemplateClone.Visible = true
			TemplateClone.Count.Text = "x"..tostring(Item:GetAttribute("Count"))
			TemplateClone:WaitForChild("TemplateSetStuff").Disabled = false

			UpdateCanvasSize(ScrollingFrame, ScrollingFrame.UIListLayout)
		end
	end
end)
