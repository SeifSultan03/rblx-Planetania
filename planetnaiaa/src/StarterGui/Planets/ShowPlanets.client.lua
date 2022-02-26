local openPlanetsUI = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("ShowPlanetsUI")
local player = game.Players.LocalPlayer
local ScreenGui = player.PlayerGui:WaitForChild("ScreenGui")
local CodeGui = player.PlayerGui:WaitForChild("CodeButton")

openPlanetsUI.OnClientEvent:Connect(function()
	script.Parent.Enabled = true
	ScreenGui.Enabled = false
	CodeGui.Enabled = false
end)
