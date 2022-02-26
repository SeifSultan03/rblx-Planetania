local setUpFurniture = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("SetUpFurniture")
local FurnitureLocations = game.Workspace:WaitForChild("FurnitureLocations")
local player = game.Players.LocalPlayer
local furnitureFolder = game.ReplicatedStorage:WaitForChild("Furniture")
local BuyFurnitureEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("BuyFurnitureEvent")

setUpFurniture.OnClientEvent:Connect(function()
	for i, furnitureName in pairs(player.FurnitureData:GetChildren()) do
		local furnitureInRep = furnitureFolder:FindFirstChild(furnitureName.Name)
		local clone = furnitureInRep:Clone()
		clone.Parent = game.Workspace
		local emptyPart = FurnitureLocations:FindFirstChild("Part")
		clone:SetPrimaryPartCFrame(emptyPart.CFrame)
		emptyPart:Destroy()
		local BillBoard = clone:WaitForChild("BillboardGui")
		BillBoard.Parent = player.PlayerGui:WaitForChild("BillboardScreen")
		BillBoard.Adornee = clone
		local buyButton = BillBoard:WaitForChild("Frame"):WaitForChild("BuyButton")
		
		buyButton.MouseButton1Down:Connect(function()
			local returnVal = BuyFurnitureEvent:InvokeServer(clone.Name)
			if returnVal then
				buyButton.Text = "Bought"
				game.ReplicatedStorage.Sounds.UpgradinSpaceship:Play()
				wait(1)
				buyButton.Text = "Buy"
			else
				buyButton.Text = "Not Enough Coins"
				buyButton.BackgroundColor3 = Color3.new(1, 0, 0.0156863)
				game.ReplicatedStorage.Sounds.NotEnoughCoins:Play()
				wait(1)
				buyButton.Text = "Buy"
				buyButton.BackgroundColor3 = Color3.new(0.298039, 1, 0)
			end
		end)
		
	end
end)