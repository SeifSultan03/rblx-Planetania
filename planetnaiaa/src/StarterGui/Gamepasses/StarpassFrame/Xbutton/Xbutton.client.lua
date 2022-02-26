local StarpassFrame = script.Parent.Parent
local Menu = script.Parent.Parent.Parent.Parent:WaitForChild("ScreenGui"):WaitForChild("FullMenuFrame"):WaitForChild("Menu")
local blur = game.Lighting:WaitForChild("Blur")

script.Parent.MouseButton1Down:Connect(function()
	Menu.Visible = true
	StarpassFrame.Visible = false
	blur.Size = 0
end)
