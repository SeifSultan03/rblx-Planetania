local openPlanetsUI = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("ShowPlanetsUI")
script.Parent.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		local char = hit.Parent
		local plr = game.Players:GetPlayerFromCharacter(char)
		openPlanetsUI:FireClient(plr)
		char:MoveTo(script.Parent.Position + Vector3.new(0, 3, -15))
	end
end)