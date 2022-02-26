
script.Parent.MouseButton1Down:Connect(function()
	-- play sound
	local ClaimSound = game.ReplicatedStorage:WaitForChild("Sounds"):WaitForChild("ClaimButton")
	ClaimSound:Play()
end)