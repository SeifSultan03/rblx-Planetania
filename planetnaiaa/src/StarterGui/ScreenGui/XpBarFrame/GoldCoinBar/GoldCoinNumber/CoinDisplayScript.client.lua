local player = game.Players.LocalPlayer

player.leaderstats:GetAttributeChangedSignal("GoldCoins"):Connect(function()
	script.Parent.Text = tostring(math.floor(player.leaderstats:GetAttribute("GoldCoins") * 10)/10)
end)

wait(1)

script.Parent.Text = tostring(math.floor(player.leaderstats:GetAttribute("GoldCoins") * 10)/10)