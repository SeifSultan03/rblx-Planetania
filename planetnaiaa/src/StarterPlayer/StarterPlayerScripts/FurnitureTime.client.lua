local TimeLabel = game.Workspace:WaitForChild("Map"):WaitForChild("ScriptStuff"):WaitForChild("FurnitureComing"):WaitForChild("Rear door"):WaitForChild("TimeGui"):WaitForChild("TextLabel")
local player = game.Players.LocalPlayer

while wait(1) do
	local secs = player.leaderstats:GetAttribute("FurnitureUpdate") + 7200 - os.time()
	if secs < 0 then
		TimeLabel.Text = "Rejoin game to update furniture"
	else
		if (secs % 3600)/60 >= 10 then
			if (secs % 3600) % 60 >= 10 then
				TimeLabel.Text = "New furniture coming in "..tostring(math.floor(secs/3600))..":"..tostring(math.floor((secs % 3600)/60))..":"..tostring((secs % 3600) % 60)
			else
				TimeLabel.Text = "New furniture coming in "..tostring(math.floor(secs/3600))..":"..tostring(math.floor((secs % 3600)/60))..":0"..tostring((secs % 3600) % 60)
			end
		else
			if (secs % 3600) % 60 >= 10 then
				TimeLabel.Text = "New furniture coming in "..tostring(math.floor(secs/3600))..":0"..tostring(math.floor((secs % 3600)/60))..":"..tostring((secs % 3600) % 60)
			else
				TimeLabel.Text = "New furniture coming in "..tostring(math.floor(secs/3600))..":0"..tostring(math.floor((secs % 3600)/60))..":0"..tostring((secs % 3600) % 60)
			end
		end
	end 
end