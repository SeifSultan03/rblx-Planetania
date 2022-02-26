local Camera = game.Workspace.CurrentCamera
local player = game.Players.LocalPlayer
local AccessoriesEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Camera"):WaitForChild("AccessoriesBuy")
local camFolder = game.Workspace:WaitForChild("Cameras")

local openGiftRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("BuyAccessoryGift")
local TweenService = game:GetService("TweenService")
local Info = TweenInfo.new(0.3)

local ScreenGui = player.PlayerGui:WaitForChild("ScreenGui")
local MoveCameraGui = player.PlayerGui:WaitForChild("MoveCameraAccessories")
local BuyButton = MoveCameraGui:WaitForChild("BuyButton")
local CodesGui = player.PlayerGui:WaitForChild("CodeButton")
local MinigamesGui = player.PlayerGui:WaitForChild("MinigameScreen")
local LeftButton = MoveCameraGui:WaitForChild("LeftButton")
local RightButton = MoveCameraGui:WaitForChild("RightButton")

local ExitButton = MoveCameraGui:WaitForChild("ExitButton")

local debounce = false

local CurrentCam

AccessoriesEvent.OnClientEvent:Connect(function()
	CurrentCam = 100
	ScreenGui.Enabled = false
	CodesGui.Enabled = false
	MinigamesGui.Enabled = false
	MoveCameraGui.Enabled = true
	Camera.CameraType = Enum.CameraType.Scriptable
	Camera.CFrame = game.Workspace:WaitForChild("Cameras"):WaitForChild("100").CFrame
end)

LeftButton.MouseButton1Down:Connect(function()
	if CurrentCam > 100 then
		CurrentCam -= 1
		local goals = {}
		goals.CFrame = camFolder:FindFirstChild(tostring(CurrentCam)).CFrame
		local tween = TweenService:Create(Camera, Info, goals)
		tween:Play()
		
		for i, v in pairs(MoveCameraGui:GetChildren()) do
			if v:IsA("Frame") then
				v.Visible = false
			end
		end
		
		MoveCameraGui:FindFirstChild(tostring(CurrentCam)).Visible = true
		
	end
end)

RightButton.MouseButton1Down:Connect(function()
	if CurrentCam < 102 then
		CurrentCam += 1
		local goals = {}
		goals.CFrame = camFolder:FindFirstChild(tostring(CurrentCam)).CFrame

		local tween = TweenService:Create(Camera, Info, goals)
		tween:Play()
		
		for i, v in pairs(MoveCameraGui:GetChildren()) do
			if v:IsA("Frame") then
				v.Visible = false
			end
		end

		MoveCameraGui:FindFirstChild(tostring(CurrentCam)).Visible = true
	end
end)

ExitButton.MouseButton1Down:Connect(function()
	Camera.CameraType = Enum.CameraType.Custom
	ScreenGui.Enabled = true
	CodesGui.Enabled = true
	MinigamesGui.Enabled = true
	MoveCameraGui.Enabled = false
end)

local gifts = game.Workspace:WaitForChild("Assets"):WaitForChild("Gifts")
local RarityLabel = MoveCameraGui:WaitForChild("RarityLabel")
local Colors = {
	["Common"] = Color3.new(0.215686, 1, 0),
	["Rare"] = Color3.new(0, 0.701961, 1),
	["Epic"] = Color3.new(0.835294, 0, 1),
	["Legendary"] = Color3.new(1, 0.784314, 0),
	["Mythical"] = Color3.new(1, 0, 0.0156863),
}

local Info = TweenInfo.new(1)
BuyButton.MouseButton1Down:Connect(function()
	local Item, RealItem, refund = openGiftRemote:InvokeServer(CurrentCam)
	
	print(CurrentCam)
	
	local realRarity
	if RealItem then
		realRarity = RealItem:GetAttribute("Rarity")
	end
	
	if refund then
		if CurrentCam == 100 then
			local clone = Item:Clone()
			clone.Parent = game.Workspace
			clone.Handle.Position = gifts.SmallGift.Down.Position + Vector3.new(0, 2, 0)
			clone.Handle.BillboardGui:Destroy()
			
			local explosion = Instance.new("Explosion")
			explosion.Position = gifts.SmallGift.Down.Position + Vector3.new(0, 1, 0)
			explosion.Parent = game.Workspace
			explosion.Visible = true
			explosion.DestroyJointRadiusPercent = 0
			explosion.BlastRadius = 10
			
			for i, v in pairs(gifts.SmallGift:GetChildren()) do
				v.Position -= Vector3.new(0, 20, 0)
			end

			-- make gui invisible
			for i, v in pairs(MoveCameraGui:GetChildren()) do
				v.Visible = false
			end
			RarityLabel.Visible = true
			RarityLabel.Text = realRarity
			RarityLabel.TextColor3 = Colors[realRarity]
			wait(1)
			clone:Destroy()
			RarityLabel.Text = "Already Owned +"..tostring(refund).." Buckies"
			game.ReplicatedStorage.Sounds.UpgradinSpaceship:Play()
			for i, v in pairs(gifts.SmallGift:GetChildren()) do
				v.Position += Vector3.new(0, 20, 0)
			end
			-- make gui visible
			wait(1)
			for i, v in pairs(MoveCameraGui:GetChildren()) do
				v.Visible = true
			end
			MoveCameraGui["101"].Visible = false
			MoveCameraGui["102"].Visible = false
			RarityLabel.Visible = false
		elseif CurrentCam == 101 then
			local clone = Item:Clone()
			clone.Parent = game.Workspace
			clone.Handle.Position = gifts.MediumGift.Down.Position + Vector3.new(0, 2, 0)
			clone.Handle.BillboardGui:Destroy()
			
			local explosion = Instance.new("Explosion")
			explosion.Position = gifts.MediumGift.Down.Position + Vector3.new(0, 1, 0)
			explosion.Parent = game.Workspace
			explosion.Visible = true
			explosion.DestroyJointRadiusPercent = 0
			explosion.BlastRadius = 10
			
			for i, v in pairs(gifts.MediumGift:GetChildren()) do
				v.Position -= Vector3.new(0, 20, 0)
			end

			-- make gui invisible
			for i, v in pairs(MoveCameraGui:GetChildren()) do
				v.Visible = false
			end
			RarityLabel.Visible = true
			RarityLabel.Text = realRarity
			RarityLabel.TextColor3 = Colors[realRarity]
			wait(1)
			clone:Destroy()
			RarityLabel.Text = "Already Owned +"..tostring(refund).." Buckies"
			game.ReplicatedStorage.Sounds.UpgradinSpaceship:Play()
			for i, v in pairs(gifts.MediumGift:GetChildren()) do
				v.Position += Vector3.new(0, 20, 0)
			end
			-- make gui visible
			wait(1)
			for i, v in pairs(MoveCameraGui:GetChildren()) do
				v.Visible = true
			end
			MoveCameraGui["100"].Visible = false
			MoveCameraGui["102"].Visible = false
			RarityLabel.Visible = false
		elseif CurrentCam == 102 then
			local clone = Item:Clone()
			clone.Parent = game.Workspace
			clone.Handle.Position = gifts.LargeGift.Down.Position + Vector3.new(0, 2, 0)
			clone.Handle.BillboardGui:Destroy()
			
			local explosion = Instance.new("Explosion")
			explosion.Position = gifts.LargeGift.Down.Position + Vector3.new(0, 1, 0)
			explosion.Parent = game.Workspace
			explosion.Visible = true
			explosion.DestroyJointRadiusPercent = 0
			explosion.BlastRadius = 10
			
			for i, v in pairs(gifts.LargeGift:GetChildren()) do
				v.Position -= Vector3.new(0, 25, 0)
			end

			-- make gui invisible
			for i, v in pairs(MoveCameraGui:GetChildren()) do
				v.Visible = false
			end
			RarityLabel.Visible = true
			RarityLabel.Text = realRarity
			RarityLabel.TextColor3 = Colors[realRarity]
			wait(1)
			clone:Destroy()
			RarityLabel.Text = "Already Owned +"..tostring(refund).." Buckies"
			game.ReplicatedStorage.Sounds.UpgradinSpaceship:Play()
			for i, v in pairs(gifts.LargeGift:GetChildren()) do
				v.Position += Vector3.new(0, 25, 0)
			end
			-- make gui visible
			wait(1)
			for i, v in pairs(MoveCameraGui:GetChildren()) do
				v.Visible = true
			end
			MoveCameraGui["100"].Visible = false
			MoveCameraGui["101"].Visible = false
			RarityLabel.Visible = false
		
		end
	elseif Item and CurrentCam == 100 then
		local clone = Item:Clone()
		clone.Parent = game.Workspace
		clone.Handle.Position = gifts.SmallGift.Down.Position + Vector3.new(0, 2, 0)
		clone.Handle.BillboardGui:Destroy()
		local explosion = Instance.new("Explosion")
		explosion.Position = gifts.SmallGift.Down.Position + Vector3.new(0, 1, 0)
		explosion.Parent = game.Workspace
		explosion.Visible = true
		explosion.DestroyJointRadiusPercent = 0
		explosion.BlastRadius = 10
		for i, v in pairs(gifts.SmallGift:GetChildren()) do
			v.Position -= Vector3.new(0, 20, 0)
		end

		-- make gui invisible
		for i, v in pairs(MoveCameraGui:GetChildren()) do
			v.Visible = false
		end
		RarityLabel.Visible = true
		RarityLabel.Text = realRarity
		RarityLabel.TextColor3 = Colors[realRarity]
		wait(2)
		clone:Destroy()
		for i, v in pairs(gifts.SmallGift:GetChildren()) do
			v.Position += Vector3.new(0, 20, 0)
		end
		-- make gui invisible
		for i, v in pairs(MoveCameraGui:GetChildren()) do
			v.Visible = true
		end
		MoveCameraGui["101"].Visible = false
		MoveCameraGui["102"].Visible = false
		RarityLabel.Visible = false

	elseif Item and CurrentCam == 101 then
		local clone = Item:Clone()
		clone.Parent = game.Workspace
		clone.Handle.Position = gifts.MediumGift.Down.Position + Vector3.new(0, 2, 0)
		clone.Handle.BillboardGui:Destroy()
		local explosion = Instance.new("Explosion")
		explosion.Position = gifts.MediumGift.Down.Position + Vector3.new(0, 1, 0)
		explosion.Parent = game.Workspace
		explosion.Visible = true
		explosion.DestroyJointRadiusPercent = 0
		explosion.BlastRadius = 10
		for i, v in pairs(gifts.MediumGift:GetChildren()) do
			v.Position -= Vector3.new(0, 20, 0)
		end

		-- make gui invisible
		for i, v in pairs(MoveCameraGui:GetChildren()) do
			v.Visible = false
		end
		RarityLabel.Visible = true
		RarityLabel.Text = realRarity
		RarityLabel.TextColor3 = Colors[realRarity]
		wait(2)
		clone:Destroy()
		for i, v in pairs(gifts.MediumGift:GetChildren()) do
			v.Position += Vector3.new(0, 20, 0)
		end
		-- make gui invisible
		for i, v in pairs(MoveCameraGui:GetChildren()) do
			v.Visible = true
		end
		MoveCameraGui["100"].Visible = false
		MoveCameraGui["102"].Visible = false
		RarityLabel.Visible = false
	elseif Item and CurrentCam == 102 then
		local clone = Item:Clone()
		clone.Parent = game.Workspace
		clone.Handle.Position = gifts.LargeGift.Down.Position + Vector3.new(0, 2, 0)
		clone.Handle.BillboardGui:Destroy()
		local explosion = Instance.new("Explosion")
		explosion.Position = gifts.LargeGift.Down.Position + Vector3.new(0, 1, 0)
		explosion.Parent = game.Workspace
		explosion.Visible = true
		explosion.DestroyJointRadiusPercent = 0
		explosion.BlastRadius = 10
		for i, v in pairs(gifts.LargeGift:GetChildren()) do
			v.Position -= Vector3.new(0, 20, 0)
		end

		-- make gui invisible
		for i, v in pairs(MoveCameraGui:GetChildren()) do
			v.Visible = false
		end
		RarityLabel.Visible = true
		RarityLabel.Text = realRarity
		RarityLabel.TextColor3 = Colors[realRarity]
		wait(2)
		clone:Destroy()
		for i, v in pairs(gifts.LargeGift:GetChildren()) do
			v.Position += Vector3.new(0, 20, 0)
		end
		-- make gui invisible
		for i, v in pairs(MoveCameraGui:GetChildren()) do
			v.Visible = true
		end
		MoveCameraGui["100"].Visible = false
		MoveCameraGui["101"].Visible = false
		RarityLabel.Visible = false
	else
		BuyButton.Text = "Not Enough Coins"
		BuyButton.BackgroundColor3 = Color3.new(1, 0, 0.0156863)
		wait(1)
		BuyButton.Text = "Buy"
		game.ReplicatedStorage.Sounds.NotEnoughCoins:Play()
		BuyButton.BackgroundColor3 = Color3.new(0.133333, 1, 0)
	end
end)