local ScreenGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ScreenGui")
local ConfirmPlayFrame = script.Parent.Parent

script.Parent.MouseButton1Down:Connect(function()
	ScreenGui.Enabled = true
	ConfirmPlayFrame.Visible = false
end)
