local AnimEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("TeleportAnim")

local debounce = false
local SpawnBlock = game.Workspace:WaitForChild("Teleports"):WaitForChild("TeleportToSpawn")
script.Parent.Touched:Connect(function(hit)
	if debounce then return end
	if hit.Parent:FindFirstChild("Humanoid") then
		debounce = true
		local char = hit.Parent
		local player = game.Players:GetPlayerFromCharacter(char)
		if player.leaderstats:getAttribute("TutorialLevel") <= 8 then
			local NotificationsRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("Notifications")
			NotificationsRemote:FireClient(player, "Complete the tutorial to explore the spawn")
			wait(1)
			debounce = false
			return
		end
		AnimEvent:FireClient(player)
		wait(1)
		char:SetPrimaryPartCFrame(SpawnBlock.CFrame)
	end
	wait(1)
	debounce = false
end)