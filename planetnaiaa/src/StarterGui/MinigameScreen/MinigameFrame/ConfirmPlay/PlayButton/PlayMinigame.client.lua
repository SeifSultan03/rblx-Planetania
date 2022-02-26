local player = game.Players.LocalPlayer
local JoinMinigameRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("JoinMinigame")
local ThisFrame = script.Parent.Parent
local ScreenGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ScreenGui")

script.Parent.MouseButton1Down:Connect(function()
	ScreenGui.Enabled = true
	ThisFrame.Visible = false
	JoinMinigameRemote:FireServer()
end)