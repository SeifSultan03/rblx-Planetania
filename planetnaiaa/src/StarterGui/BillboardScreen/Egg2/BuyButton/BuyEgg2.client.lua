local Egg2 = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Pets"):WaitForChild("Egg2")
local player = game.Players.LocalPlayer
local ScreenGui = player.PlayerGui:WaitForChild("ScreenGui")
local CodesGui = player.PlayerGui:WaitForChild("CodeButton")
local ConfirmEgg2 = player.PlayerGui:WaitForChild("ConfirmationsGui"):WaitForChild("ConfirmEgg2")

local Deb = false
script.Parent.MouseButton1Down:Connect(function()
	if Deb then return end
	Deb	= true
	
	CodesGui.Enabled = false
	ScreenGui.Enabled = false
	ConfirmEgg2.Visible = true
	
	wait(1)
	Deb = false
end)
