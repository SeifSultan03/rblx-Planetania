local player = game.Players.LocalPlayer
local coins = player:WaitForChild("leaderstats"):WaitForChild("Coins")

coins.Changed:Connect(function()
	script.Parent.Text = tostring(math.floor(player.leaderstats.Coins.Value * 10)/10)
end)

wait(1)

script.Parent.Text = tostring(math.floor(player.leaderstats.Coins.Value * 10)/10)