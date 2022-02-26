local BuildAnimEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("TeleportBuildAnim")
local CamParts = game.Workspace:WaitForChild("TeleportAnimParts"):WaitForChild("BuildShop")

local debounce = false
script.Parent.Touched:Connect(function(hit)
	if debounce then return end
	if hit.Parent:FindFirstChild("Humanoid") then
		local char = hit.Parent
		BuildAnimEvent:FireClient(game.Players:GetPlayerFromCharacter(char))
		char:SetPrimaryPartCFrame(CamParts.TeleportPart.CFrame)
		wait(6)
		game.Players:GetPlayerFromCharacter(char).leaderstats:SetAttribute("WentToBuildShop", true)
	end
end)