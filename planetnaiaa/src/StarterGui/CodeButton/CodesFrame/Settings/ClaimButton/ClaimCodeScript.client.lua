local player = game.Players.LocalPlayer

script.Parent.MouseButton1Down:Connect(function()
	if script.Parent.Text == "On" then
		script.Parent.Text = "Off"
		script.Parent.BackgroundColor3 = Color3.new(1, 0, 0.0156863)
		player.PlayerGui.MinigameScreen.MinigameFrame.Visible = false
		player.PlayerGui.MinigameScreen.Enabled = false
	else
		script.Parent.Text = "On"
		script.Parent.BackgroundColor3 = Color3.new(0.384314, 1, 0)
		player.PlayerGui.MinigameScreen.MinigameFrame.Visible = true
		player.PlayerGui.MinigameScreen.Enabled = true
	end
end)
