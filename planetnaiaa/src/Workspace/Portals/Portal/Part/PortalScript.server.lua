local AnimEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("TeleportAnim")
local NotificationsRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("Notifications")

local debounce = false
script.Parent.Touched:Connect(function(hit)
	if debounce then return end
	if hit.Parent:FindFirstChild("Humanoid") then
		debounce = true
		local char = hit.Parent
		local PlayerSetTo = string.gsub(script.Parent.Parent.Name, "Portal", "")
		
		local realPlayerSetTo = game.Players:FindFirstChild(PlayerSetTo)
		if realPlayerSetTo and char.Name ~= PlayerSetTo then
			local msg = char.Name.." is visiting your spaceship"
			NotificationsRemote:FireClient(realPlayerSetTo, msg)
		end
		if game.Workspace.Locations:FindFirstChild(PlayerSetTo.."Location") then
			AnimEvent:FireClient(game.Players:GetPlayerFromCharacter(char))
			wait(1)
			local Location = game.Workspace.Locations:FindFirstChild(PlayerSetTo.."Location")
			char:SetPrimaryPartCFrame(Location.CFrame + Vector3.new(0, 5, 0))
		end
	end
	wait(1)
	debounce = false
end)