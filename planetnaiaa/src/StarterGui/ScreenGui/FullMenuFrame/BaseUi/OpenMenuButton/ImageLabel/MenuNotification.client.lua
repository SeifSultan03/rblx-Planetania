local player = game.Players.LocalPlayer

while wait(2) do
	local yes = false
	for i, v in pairs(script.Parent.Parent.Parent.Parent.Menu.StarPassFrame.NonStarPassScroll:GetChildren()) do
		-- getting the claim buttons for the FreeStarPass GUI
		if v:IsA("ImageLabel") and tonumber(v.Name) ~= nil then
			if player.leaderstats:GetAttribute("Level") >= tonumber(v.Name) - 100 and player:WaitForChild("WearInventory"):GetAttribute("Tier_"..tostring(tonumber(v.Name) - 100)) == false then
				script.Parent.ImageTransparency = 0
				yes = true
			end
		end
	end
	
	if not yes  then
		script.Parent.ImageTransparency = 1
	end
end