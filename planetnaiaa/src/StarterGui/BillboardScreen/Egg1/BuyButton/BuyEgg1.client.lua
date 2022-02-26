local Egg1 = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Pets"):WaitForChild("Egg1")
local player = game.Players.LocalPlayer
local ScreenGui = player.PlayerGui:WaitForChild("ScreenGui")
local CodesGui = player.PlayerGui:WaitForChild("CodeButton")
local ConfirmEgg1 = player.PlayerGui:WaitForChild("ConfirmationsGui"):WaitForChild("ConfirmEgg1")

local Deb = false
script.Parent.MouseButton1Down:Connect(function()
	if Deb then return end
	Deb	= true
	
	CodesGui.Enabled = false
	ScreenGui.Enabled = false
	ConfirmEgg1.Visible = true
	
	wait(1)
	Deb = false
end)
