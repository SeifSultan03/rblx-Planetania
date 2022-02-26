local ScreenGui = script.Parent.Parent.Parent.Parent:WaitForChild("ScreenGui")
local CodesGui = script.Parent.Parent.Parent.Parent:WaitForChild("CodeButton")
local PartyFrame = script.Parent.Parent

script.Parent.MouseButton1Down:Connect(function()
	ScreenGui.Enabled = true
	CodesGui.Enabled = true
	PartyFrame.Visible = false
end)
