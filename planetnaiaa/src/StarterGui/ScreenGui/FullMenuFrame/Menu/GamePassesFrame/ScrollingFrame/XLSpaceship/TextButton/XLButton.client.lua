local menu = script.Parent.Parent.Parent.Parent.Parent
local XLFrame = menu.Parent.Parent.Parent:WaitForChild("Gamepasses"):WaitForChild("XLFrame")
local blur = game.Lighting:WaitForChild("Blur")

script.Parent.MouseButton1Down:Connect(function()
	menu.Visible = false
	XLFrame.Visible = true
	blur.Size = 12
end)