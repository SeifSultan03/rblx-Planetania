local rep = game:GetService("ReplicatedStorage")
local BuyTextureEvent = rep:WaitForChild("Remotes"):WaitForChild("BuyTexturesEvent")

BuyTextureEvent.OnServerEvent:Connect(function(player, TextureID)
	print("Fired")
	if typeof(TextureID) ~= "string" then player:Kick("No malforming Error Code: BTS 8") return end
	
	local found = false
	for i, v in pairs(game.Workspace:WaitForChild("Textures"):GetChildren()) do
		for i, v in pairs(v:GetChildren()) do
			if v:IsA("Texture") then
				if v.Texture == TextureID then
					found = true
					break
				end
			end
		end
	end
	if not found then player:Kick("Texture Not Found: BTS 19. DM Killerz#6091") return end
	
	local TexturesInventory = player.TexturesInventory
	if player.leaderstats.Coins.Value >= 500 then
		player.leaderstats.Coins.Value -= 500
		local IntValue = Instance.new("IntValue")
		IntValue.Parent = TexturesInventory
		IntValue.Name = TextureID
	end
end)
