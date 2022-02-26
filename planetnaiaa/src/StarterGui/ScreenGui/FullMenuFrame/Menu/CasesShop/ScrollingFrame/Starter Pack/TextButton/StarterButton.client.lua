local menu = script.Parent.Parent.Parent.Parent.Parent
local StarterFrame = menu.Parent.Parent.Parent:WaitForChild("Gamepasses"):WaitForChild("StarterFrame")
local blur = game.Lighting:WaitForChild("Blur")

script.Parent.MouseButton1Down:Connect(function()
	menu.Visible = false
	StarterFrame.Visible = true
	blur.Size = 12
end)