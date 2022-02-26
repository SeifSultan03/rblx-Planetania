local CodeFrame = script.Parent.Parent
local Button = CodeFrame.Parent:WaitForChild("Frame"):WaitForChild("Codes"):WaitForChild("CodeButton")
local ScreenGui = script.Parent.Parent.Parent.Parent:WaitForChild("ScreenGui")
script.Parent.MouseButton1Down:Connect(function()
	CodeFrame.Visible = false
	ScreenGui.Enabled = true
	Button.Image = "rbxassetid://8258665174"
end)
