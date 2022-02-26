local Button = script.Parent
local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Size = Button.Size + UDim2.new(0, 5, 0, 5)
local goalsSmaller = {}
goalsSmaller.Size = Button.Size
local goalsColor = {}
goalsColor.BackgroundColor3 = Color3.new(1, 0.796078, 0.054902)
goalsColorBackToBlack = {}
goalsColorBackToBlack.BackgroundColor3 = Color3.new(0.105882, 0.164706, 0.207843)
local tweenInfo = TweenInfo.new(0.2)
local colorInfo = TweenInfo.new(0.5)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)
local TweenColor = TweenService:Create(Button, colorInfo, goalsColor)
local BuildAndInv = Button.Parent
Button.MouseEnter:Connect(function()
	TweenBigger:Play()
end)

Button.MouseLeave:Connect(function()
	TweenSmaller:Play()
end)

local ScrollingFrame = script.Parent.Parent.BuildInventory.ScrollingFrame
local player = game.Players.LocalPlayer

local function UpdateCanvasSize(Canvas, Constraint)
	Canvas.CanvasSize = UDim2.new(0, Constraint.AbsoluteContentSize.X, 0, Constraint.AbsoluteContentSize.Y)
end

Button.MouseButton1Down:Connect(function()
	-- and also switch to the All(prolly by checking the attribute type. delete everything and clone everything)
	--
	--
	for i, v in pairs(BuildAndInv:GetChildren()) do
		if v:IsA("TextButton") and v.Name ~= script.Parent.Name then
			local TweenColorBack = TweenService:Create(v, colorInfo, goalsColorBackToBlack)
			TweenColorBack:Play()
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
		if Item:IsA("Folder") == false and string.match(Item.Name, "BuildableNeon")then

			local TemplateClone = ScrollingFrame.Template:Clone()
			TemplateClone.Name = Item.Name
			TemplateClone.Parent = ScrollingFrame
			TemplateClone.Visible = true
			TemplateClone.Count.Text = "x"..tostring(Item:GetAttribute("Count"))
			TemplateClone:WaitForChild("TemplateSetStuff").Disabled = false

			UpdateCanvasSize(ScrollingFrame, ScrollingFrame.UIListLayout)
		end
	end

	TweenColor:Play()

end)