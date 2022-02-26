
local ScreenGui = script.Parent.Parent.Parent.Parent.Parent
local PartyFrame = ScreenGui.Parent:WaitForChild("ConfirmationsGui"):WaitForChild("ConfirmPartyFrame")
script.Parent.MouseButton1Down:Connect(function()
	-- make party thing visible
	ScreenGui.Enabled = false
	PartyFrame.Visible = true
end)