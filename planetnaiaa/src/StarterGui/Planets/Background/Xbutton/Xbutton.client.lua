local player = game.Players.LocalPlayer
local ScreenGui = player.PlayerGui:WaitForChild("ScreenGui")
local CodeGui = player.PlayerGui:WaitForChild("CodeButton")

script.Parent.MouseButton1Down:Connect(function()
	script.Parent.Parent.Parent.Enabled = false
	ScreenGui.Enabled = true
	CodeGui.Enabled = true
end)
