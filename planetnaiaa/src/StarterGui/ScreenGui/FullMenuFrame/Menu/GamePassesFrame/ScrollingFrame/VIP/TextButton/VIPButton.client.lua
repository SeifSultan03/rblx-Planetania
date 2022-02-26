local menu = script.Parent.Parent.Parent.Parent.Parent
local StarpassFrame = menu.Parent.Parent.Parent:WaitForChild("Gamepasses"):WaitForChild("VIPFrame")
local blur = game.Lighting:WaitForChild("Blur")

script.Parent.MouseButton1Down:Connect(function()
	menu.Visible = false
	StarpassFrame.Visible = true
	blur.Size = 12
end)