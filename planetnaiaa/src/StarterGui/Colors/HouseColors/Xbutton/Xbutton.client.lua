local HouseColorsFrame = script.Parent.Parent
local Camera = game.Workspace.CurrentCamera

local CosmeticsFrame = HouseColorsFrame.Parent.Parent:WaitForChild("ScreenGui"):WaitForChild("CosmeticsFrame")
local Button = CosmeticsFrame:WaitForChild("BaseUi"):WaitForChild("ImageButton")

script.Parent.MouseButton1Down:Connect(function()
	HouseColorsFrame.Visible = false
	Camera.CameraType = Enum.CameraType.Custom
	
	Button.Image = "rbxassetid://8241421746"
	CosmeticsFrame.Parent.FullMenuFrame.Visible = true -- menu visible
	CosmeticsFrame.Parent.XpBarFrame.Visible = true -- xpbar vis
	CosmeticsFrame.Parent.BuildAndInv.Visible = true -- buildbutton vis
	CosmeticsFrame.Parent.ExtrasFrame.Visible = true
	CosmeticsFrame.Parent.HouseUpgrades.Visible = true
	CosmeticsFrame.Parent.Parent.CodeButton.Enabled = true
end)
