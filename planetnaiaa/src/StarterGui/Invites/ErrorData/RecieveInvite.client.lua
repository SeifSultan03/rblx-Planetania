local ErrorRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ErrorLoad")
ErrorRemote.OnClientEvent:Connect(function()	
	script.Parent.Visible = true
end)