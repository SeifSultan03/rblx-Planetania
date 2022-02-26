local AcceptTeleportRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("AcceptTeleport")
local NotificationsRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("Notifications")

AcceptTeleportRemote.OnServerEvent:Connect(function(player, playerToTeleportToName)
	
	local playerFolder = game.Workspace:FindFirstChild(playerToTeleportToName.."f")
	local char = player.Character or player.CharacterAdded:Wait()
	
	if playerFolder then
		local playerSpaceship = nil
		for i, v in pairs(playerFolder:GetChildren()) do
			if string.match(v.Name, "Lvl") then
				playerSpaceship = v
			end
		end
		
		if playerSpaceship then
			char:SetPrimaryPartCFrame(playerSpaceship.PrimaryPart.CFrame + Vector3.new(0, 5, 0))
		end
		-- send notification
		local playerTeleportingTo = game.Players:FindFirstChild(playerToTeleportToName)
		if playerTeleportingTo then
			local msg = player.Name.." is visiting your spaceship"
			NotificationsRemote:FireClient(playerTeleportingTo, msg)
		end
	end
end)