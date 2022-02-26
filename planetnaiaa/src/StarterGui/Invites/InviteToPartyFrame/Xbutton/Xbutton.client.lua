local InviteFrame = script.Parent.Parent
local ScreenGui = script.Parent.Parent.Parent.Parent:WaitForChild("ScreenGui")

script.Parent.MouseButton1Down:Connect(function()
	ScreenGui.Enabled = true
	InviteFrame.Visible = false
end)
