local CameraEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Camera"):WaitForChild("ColorsShop")

script.Parent.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		local char = hit.Parent
		local plr = game.Players:GetPlayerFromCharacter(char)
		CameraEvent:FireClient(plr)
		char:MoveTo(script.Parent.Position + Vector3.new(0, 3, -15))
	end
end)