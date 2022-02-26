local Button = script.Parent
local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Size = Button.Size + UDim2.new(0, 5, 0, 5)
local goalsSmaller = {}
goalsSmaller.Size = Button.Size
local tweenInfo = TweenInfo.new(0.2)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)

local CosmeticsFrame = Button.Parent.Parent
local ColorsFrame = CosmeticsFrame.Parent.Parent:WaitForChild("Colors"):WaitForChild("HouseColors")

local Camera = game.Workspace.CurrentCamera
local player = game.Players.LocalPlayer
Button.MouseEnter:Connect(function()
	TweenBigger:Play()
end)

Button.MouseLeave:Connect(function()
	TweenSmaller:Play()
end)

local PlayerGui = CosmeticsFrame.Parent.Parent

Button.MouseButton1Down:Connect(function()
	if ColorsFrame.Visible == true then -- if inventory open, close it
		Button.Image = "rbxassetid://8241421746"
		ColorsFrame.Visible = false
		CosmeticsFrame.Parent.FullMenuFrame.Visible = true -- menu visible
		CosmeticsFrame.Parent.XpBarFrame.Visible = true -- xpbar vis
		CosmeticsFrame.Parent.BuildAndInv.Visible = true -- buildbutton vis
		CosmeticsFrame.Parent.ExtrasFrame.Visible = true
		CosmeticsFrame.Parent.HouseUpgrades.Visible = true
		PlayerGui.CodeButton.Enabled = true
		
		PlayerGui.CodeButton.Enabled = true
		
		Camera.CameraType = Enum.CameraType.Custom
	return end
	Button.Image = "rbxassetid://8241416549" -- if inventory closed, open it and hide other UIs
	CosmeticsFrame.Parent.FullMenuFrame.Visible = false -- hide
	CosmeticsFrame.Parent.XpBarFrame.Visible = false -- hide outer UI
	CosmeticsFrame.Parent.BuildAndInv.Visible = false
	CosmeticsFrame.Parent.ExtrasFrame.Visible = false
	CosmeticsFrame.Parent.HouseUpgrades.Visible = false
	
	local PlayerGui = CosmeticsFrame.Parent.Parent
	PlayerGui.CodeButton.Enabled = false
	
	ColorsFrame.Visible = true
	
	local PlayerFolder = game.Workspace:FindFirstChild(player.Name.."f")
	
	local PlayerSpaceship
	for i, v in pairs(PlayerFolder:GetChildren()) do
		if string.match(v.Name, "Lvl") then
			PlayerSpaceship = v
		end
	end
	Camera.CameraType = Enum.CameraType.Scriptable
	Camera.CFrame = CFrame.new(PlayerSpaceship.PrimaryPart.Position + Vector3.new(0, 20, 30), PlayerSpaceship.PrimaryPart.Position + Vector3.new(0, 10, 0))
end)
