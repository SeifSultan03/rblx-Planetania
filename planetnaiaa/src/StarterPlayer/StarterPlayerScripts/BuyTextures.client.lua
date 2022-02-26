local plr = script.Parent.Parent
local rep = game.ReplicatedStorage
local BuyTexturesEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("BuyTexturesEvent")
local ScreenGui = plr.PlayerGui:WaitForChild("BillboardScreen")
for i, v in pairs(game.Workspace:WaitForChild("Textures"):GetChildren()) do
	local BillboardGui = v:WaitForChild("BillboardGui")
	local buyButton = BillboardGui:WaitForChild("Frame"):WaitForChild("BuyButton")
	BillboardGui.Parent = ScreenGui
	BillboardGui.Adornee = v
	buyButton.MouseButton1Down:Connect(function()

		local Price = buyButton.Parent.Price.Text
		local TextureID = v:FindFirstChildOfClass("Texture").Texture
		local TextureInventory = plr:WaitForChild("TexturesInventory")
		
		print("trying to buy", TextureID)
		if plr.leaderstats.Coins.Value < 500 then
			buyButton.Text = "Not enough coins"
			buyButton.BackgroundColor3 = Color3.new(1, 0, 0)
			-- play not enough coins sound
			rep.Sounds.NotEnoughCoins:Play()
			wait(1)
			buyButton.Text = "Buy"
			buyButton.BackgroundColor3 = Color3.new(0, 1, 0)
			return
		end
		
		if TextureInventory:FindFirstChild(TextureID) then
			buyButton.Text = "Already Owned"
			wait(1)
			buyButton.Text = "Buy"
			return
		end
		
		rep.Sounds.UpgradinSpaceship:Play()
		
		BuyTexturesEvent:FireServer(TextureID)
	end)
end