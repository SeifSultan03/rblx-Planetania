local AnimEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("TeleportAnim")

local debounce = false
local SpaceshipBlock = game.Workspace:WaitForChild("Teleports"):WaitForChild("TeleportToSpaceships")
script.Parent.Touched:Connect(function(hit)
	if debounce then return end
	if hit.Parent:FindFirstChild("Humanoid") then
		debounce = true
		local char = hit.Parent
		AnimEvent:FireClient(game.Players:GetPlayerFromCharacter(char))
		wait(1)
		char:SetPrimaryPartCFrame(SpaceshipBlock.CFrame)
	end
	wait(1)
	debounce = false
end)