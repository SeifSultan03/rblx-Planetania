local FriendsFrame = script.Parent.Parent
local ScreenGui = FriendsFrame.Parent.Parent
local Button = FriendsFrame.Parent:WaitForChild("AddFriendButton")
script.Parent.MouseButton1Down:Connect(function()
	for i, v in pairs(ScreenGui:GetChildren()) do
		if v.Name ~= "XpBarFrame" and v.Name ~= "BuildingTools" then
			v.Visible = true
		end
	end
	ScreenGui.Parent.CodeButton.Frame.Codes.CodeButton.Visible = true
	
	FriendsFrame.Visible = false
	Button.Image = "rbxassetid://8187995877"
end)