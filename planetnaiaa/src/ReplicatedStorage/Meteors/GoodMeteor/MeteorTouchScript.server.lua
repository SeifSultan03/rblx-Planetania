

local debounce = false

function onTouch(hit)
	if not hit.Parent:FindFirstChild("Humanoid") then return end
	if debounce then return end
	debounce = true
	
	if hit.Parent:FindFirstChild("Humanoid") then
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		player.leaderstats:SetAttribute("GoldCoins", player.leaderstats:GetAttribute("GoldCoins") + 5)
		script.UpgradinSpaceship:Play()
	end
	
	wait(1)
	script.Parent:Destroy()
end
script.Parent.Touched:connect(onTouch)