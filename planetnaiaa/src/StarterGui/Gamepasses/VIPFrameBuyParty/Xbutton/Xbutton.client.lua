local VIPFrame = script.Parent.Parent
local PartyFrame = VIPFrame.Parent.Parent:WaitForChild("ConfirmationsGui"):WaitForChild("ConfirmPartyFrame")

script.Parent.MouseButton1Down:Connect(function()
	PartyFrame.Visible = true
	VIPFrame.Visible = false
end)
