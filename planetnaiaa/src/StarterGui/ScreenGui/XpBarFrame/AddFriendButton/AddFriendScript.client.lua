local Button = script.Parent
local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Size = Button.Size + UDim2.new(0, 5, 0, 5)
local goalsSmaller = {}
goalsSmaller.Size = Button.Size
local tweenInfo = TweenInfo.new(0.2)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)

-- player speed
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local FriendsFrame = script.Parent.Parent:WaitForChild("FriendsFrame")
local ScreenGui = script.Parent.Parent.Parent
local ScrollingFrame = FriendsFrame:WaitForChild("ScrollingFrame")
local Template = ScrollingFrame:WaitForChild("Template")

Button.MouseEnter:Connect(function()
	TweenBigger:Play()
end)

Button.MouseLeave:Connect(function()
	TweenSmaller:Play()
end)

local function UpdateCanvasSize(Canvas, Constraint)
	Canvas.CanvasSize = UDim2.new(0, Constraint.AbsoluteContentSize.X, 0, Constraint.AbsoluteContentSize.Y)
end

Button.MouseButton1Down:Connect(function()
	if FriendsFrame.Visible == true then -- if inventory open, close it
		FriendsFrame.Visible = false
		Button.Image = "rbxassetid://8187995877"
		for i, v in pairs(ScreenGui:GetChildren()) do
			if v.Name ~= "XpBarFrame" and v.Name ~= "BuildingTools" then
				v.Visible = true
			end
		end
		ScreenGui.Parent.CodeButton.Frame.Codes.CodeButton.Visible = true
	else
		FriendsFrame.Visible = true
		Button.Image = "rbxassetid://8187993223" -- if inventory closed, open it and hide other UIs
		for i, v in pairs(ScreenGui:GetChildren()) do
			if v.Name ~= "XpBarFrame" and v.Name ~= "BuildingTools" then
				v.Visible = false
			end
		end
		ScreenGui.Parent.CodeButton.Frame.Codes.CodeButton.Visible = false
		-- Update UI
		-- destroy stuff in there
		for i, v in pairs(ScrollingFrame:GetChildren()) do
			if v:IsA("Frame") and v.Name ~= "Template" then
				v:Destroy()
			end
		end
		-- clone people
		for i, players in pairs(game.Players:GetChildren()) do
			if players.Name ~= player.Name then
				local TemplateClone = Template:Clone()
				TemplateClone.Name = players.Name
				TemplateClone:WaitForChild("PlayerName").Text = players.Name
				TemplateClone.Visible = true
				TemplateClone.Parent = ScrollingFrame
			end
		end
		
		UpdateCanvasSize(ScrollingFrame, ScrollingFrame:WaitForChild("UIListLayout"))
		
	end
end)
