local ScreenGui = script.Parent.Parent.Parent.Parent:WaitForChild("ScreenGui")
local PartyFrame = script.Parent.Parent

script.Parent.MouseButton1Down:Connect(function()
	ScreenGui.Enabled = true
	PartyFrame.Visible = false
end)
