local rep = game:GetService("ReplicatedStorage")
local BuyColorEvent = rep:WaitForChild("Remotes"):WaitForChild("BuyColorsEvent")

BuyColorEvent.OnServerEvent:Connect(function(player, Color)
	print("Fired")
	if typeof(Color) ~= "string" then player:Kick("No malforming Error Code: BCS 8") return end
	
	if not BrickColor.new(Color) then player:Kick("Color Not Found: BCS 10. DM Killerz#6091") return end
	
	local ColorsInventory = player.ColorsInventory
	if player.leaderstats.Coins.Value >= 500 then
		player.leaderstats.Coins.Value -= 500
		local IntValue = Instance.new("IntValue")
		IntValue.Parent = ColorsInventory
		IntValue.Name = Color
	end
end)
