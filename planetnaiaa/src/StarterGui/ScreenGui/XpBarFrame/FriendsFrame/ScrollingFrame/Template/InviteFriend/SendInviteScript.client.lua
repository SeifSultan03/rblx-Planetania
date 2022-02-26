local playerName = script.Parent.Parent.Name
local InviteRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("PlayerInvite")

local Debounce = false
script.Parent.MouseButton1Down:Connect(function()
	if Debounce then return end
	Debounce = true
	InviteRemote:FireServer(playerName)
	game.ReplicatedStorage.Sounds.SentSound:Play()
	wait(10)
	Debounce = false
end)