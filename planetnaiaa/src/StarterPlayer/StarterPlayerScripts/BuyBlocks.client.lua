local plr = script.Parent.Parent
local rep = game.ReplicatedStorage
local BuyBlockEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("BuyBlocksEvent")
local ScreenGui = plr.PlayerGui:WaitForChild("BillboardScreen")
for i, v in pairs(game.Workspace:WaitForChild("Assets"):WaitForChild("Blocks"):GetChildren()) do
	local BillboardGui = v:WaitForChild("BillboardGui")
	local UICorner = BillboardGui:WaitForChild("Frame"):WaitForChild("UICorner")
	UICorner.Name = v.Name
	BillboardGui.Parent = ScreenGui
	BillboardGui.Adornee = v
	local buyButton = BillboardGui:WaitForChild("Frame"):WaitForChild("BuyButton")
	buyButton.MouseButton1Down:Connect(function()
		print("trying to buy", buyButton.Parent:FindFirstChildOfClass("UICorner"))
		
		local Price = buyButton.Parent.Price.Text
		
		if Price == "25" then
			if plr.leaderstats.Coins.Value < 25 then
				buyButton.Text = "Not enough coins"
				buyButton.BackgroundColor3 = Color3.new(1, 0, 0)
				-- play not enough coins sound
				rep.Sounds.NotEnoughCoins:Play()
				wait(1)
				buyButton.Text = "Buy"
				buyButton.BackgroundColor3 = Color3.new(0, 1, 0)
				return
			end
		else
			-- price is 5
			if plr.leaderstats:GetAttribute("GoldCoins") < 5 then
				buyButton.Text = "Not enough coins"
				buyButton.BackgroundColor3 = Color3.new(1, 0, 0)
				wait(1)
				buyButton.Text = "Buy"
				buyButton.BackgroundColor3 = Color3.new(0, 1, 0)
				-- play not enough coins sound
				rep.Sounds.NotEnoughCoins:Play()
				return
			end
		end
		
		local Item = buyButton.Parent:FindFirstChildOfClass("UICorner")
		local ItemName = buyButton.Parent:FindFirstChildOfClass("UICorner").Name
		rep.Sounds.UpgradinSpaceship:Play()
		if Item then
			print(Item)
			BuyBlockEvent:FireServer(ItemName)
		end
	end)
end