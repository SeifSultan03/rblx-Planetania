local menu = script.Parent.Parent.Parent.Parent.Parent
local GlassFrame = menu.Parent.Parent.Parent:WaitForChild("Gamepasses"):WaitForChild("GlassBundle")
local blur = game.Lighting:WaitForChild("Blur")

script.Parent.MouseButton1Down:Connect(function()
	menu.Visible = false
	GlassFrame.Visible = true
	blur.Size = 12
end)