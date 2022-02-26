local LowerNumber = script.Parent:WaitForChild("MinLabel")
local MaxNumber = script.Parent:WaitForChild("MaxLabel")
local plus100Button = script.Parent:WaitForChild("Plus100")
local plus1000Button = script.Parent:WaitForChild("Plus1000")
local UpgradeNow = script.Parent:WaitForChild("UpgradeNow")
local ProgressBar = script.Parent:WaitForChild("ProgressBar")
local ProgressFull = 0.913
local UiOpen = script.Parent.Parent:WaitForChild("BaseUi"):WaitForChild("ImageButton")
	
local LowerVPF = script.Parent:WaitForChild("LowerLevel")
VPF1cam = Instance.new("Camera")
LowerVPF.CurrentCamera = VPF1cam
VPF1cam.Parent = LowerVPF

local UpperVPF = script.Parent:WaitForChild("UpperLevel")
VPF2cam = Instance.new("Camera")
UpperVPF.CurrentCamera = VPF2cam
VPF2cam.Parent = UpperVPF

local player = game.Players.LocalPlayer
local rep = game.ReplicatedStorage
local SpaceshipProgressEvent = rep:WaitForChild("Remotes"):WaitForChild("SpaceshipProgress")

local MarketPlaceService = game:GetService("MarketplaceService")
local TweenService = game:GetService("TweenService")
local Info = TweenInfo.new(1)

local coinInfo = TweenInfo.new(1)
local coin100Goal = {} -- PUT GOAL PUT GOAL
coin100Goal.Position = UDim2.new(-1.542, 0,-1.67, 0)

local coin1000Goal = {} -- PUT GOAL PUT GOAL
coin1000Goal.Position = UDim2.new(-1.542, 0,-3.246, 0)


local ScreenGui = script.Parent.Parent.Parent
local function MoreCoins()
	
		ScreenGui.FullMenuFrame.Visible = true
	
		local goalsColor = {}
		goalsColor.BackgroundColor3 = Color3.new(1, 0.796078, 0.054902)
		local goalsColorBackToBlack = {}
		goalsColorBackToBlack.BackgroundColor3 = Color3.new(0.105882, 0.164706, 0.207843)
		local colorInfo = TweenInfo.new(0.5)
		local goalsColorText = {}
		goalsColorText.TextColor3 = Color3.new(0.105882, 0.164706, 0.207843)
		local goalsColorBackToBlackText = {}
		goalsColorBackToBlackText.TextColor3 = Color3.new(1, 0.796078, 0.054902)

		local Button = ScreenGui.FullMenuFrame.BaseUi.OpenMenuButton

		Button.Image = "rbxassetid://7808164343"
		-- open the menu UI, hide other UIs
		Button.Parent.Parent.Menu.Visible = true
		ScreenGui.XpBarFrame.Visible = false
		ScreenGui.BuildAndInv.Visible = false
		ScreenGui.CosmeticsFrame.Visible = false
		ScreenGui.ExtrasFrame.Visible = false
		ScreenGui.HouseUpgrades.Visible = false

		local PlayerGui = ScreenGui.Parent
		PlayerGui.CodeButton.Enabled = false

		local Button = ScreenGui.FullMenuFrame.Menu.CasesButton
		local TweenColorText = TweenService:Create(Button.TextLabel, colorInfo, goalsColorText)
		local TweenColor = TweenService:Create(Button, colorInfo, goalsColor)

		for i, v in pairs (Button.Parent:GetChildren()) do
			if v:IsA("TextButton") and v.Name ~= Button.Name then
				local TweenColorBack = TweenService:Create(v, colorInfo, goalsColorBackToBlack)
				TweenColorBack:Play()
				local TweenColorBack = TweenService:Create(v.TextLabel, colorInfo, goalsColorBackToBlackText)
				TweenColorBack:Play()
			end
		end

		-- close all BUT NOT Currency frame
		for i, v in pairs(Button.Parent:GetChildren()) do
			if v:IsA("Frame") and v.Name ~= "QuestsFrame" then
				v.Visible = false
				if v.Name == "CurrencyFrame" then -- copy paste and change to desired
					v.Visible = true
				end
			end
		end
		-- CaseIcon = black
		Button.Parent.CasesButton.CasesIcon.Image = "rbxassetid://7940807750"
		-- premium icon = orange
		Button.Parent.PremiumButton.PremiumIcon.Image = "rbxassetid://7819752377" 
		-- battle pass icon = orange
		Button.Parent.BattlePassButton.BattlePassIcon.Image = "rbxassetid://7819176942"
		-- Daily = orange
		Button.Parent.DailyShopButton.ShopIcon.Image = "rbxassetid://7819158941"
		TweenColor:Play()
		TweenColorText:Play()

	
end

local function UpdateCompleteUI()
	local playerHouseLevel = player.leaderstats:GetAttribute("SpaceshipLevel")
	local playerProgress = player.leaderstats:GetAttribute("SpaceshipProgress")
	local playerCurrentHouse = rep:WaitForChild("Domes"):FindFirstChild("Lvl"..tostring(playerHouseLevel).."Ship")
	local playerNextHouse = rep:WaitForChild("Domes"):FindFirstChild("Lvl"..tostring(playerHouseLevel + 1).."Ship")
	
	-- vpf stuff
	-- delete parts already there
	for i, part in pairs(LowerVPF:GetChildren()) do
		if not part:IsA("Camera") then
			print(part)
			part:Destroy()
		end
	end
	for i, part in pairs(playerCurrentHouse:GetChildren()) do
		local partClone = part:Clone()
		partClone.Parent = LowerVPF
	end
	
	local maxLength = math.max(playerCurrentHouse:GetExtentsSize().Z, playerCurrentHouse:GetExtentsSize().Y)/2
	local CenterCF = playerCurrentHouse:GetBoundingBox()
	VPF1cam.CFrame = CFrame.new(CenterCF.p + Vector3.new( maxLength/math.tan(math.rad(35)) + playerCurrentHouse:GetExtentsSize().Z/2, 0, 0), CenterCF.p)
	
	-- vpf stuff
	-- delete parts in there
	for i, part in pairs(UpperVPF:GetChildren()) do
		if not part:IsA("Camera") then
			print(part)
			part:Destroy()
		end
	end
	if playerNextHouse then
		for i, part in pairs(playerNextHouse:GetChildren()) do
			local partClone = part:Clone()
			partClone.Parent = UpperVPF
		end
		local maxLength = math.max(playerNextHouse:GetExtentsSize().Z, playerNextHouse:GetExtentsSize().Y)/2
		local CenterCF = playerNextHouse:GetBoundingBox()
		VPF2cam.CFrame = CFrame.new(CenterCF.p + Vector3.new( maxLength/math.tan(math.rad(35)) + playerNextHouse:GetExtentsSize().Z/2 , 0, 0), CenterCF.p)
	end

	
	
	local upperPrice
	local PercentCompleted
	if playerNextHouse then
		upperPrice = playerNextHouse:GetAttribute("Price")
		PercentCompleted = playerProgress / upperPrice
	else
		upperPrice = 87654321
		PercentCompleted = 1
	end
	print(upperPrice)
	LowerNumber.Text = tostring(playerProgress)
	if upperPrice == 87654321 then
		MaxNumber.Text = "Wait For Updates!"
	else
		MaxNumber.Text = tostring(upperPrice)
	end
	-- tween bar
	local Goals = {}
	Goals.Size = UDim2.new(PercentCompleted * ProgressFull, 0, 0.109, 0)
	
	local tween = TweenService:Create(ProgressBar, Info, Goals)
	tween:Play()
end

UiOpen.MouseButton1Down:Connect(function()
	UpdateCompleteUI()
end)

local UpgradeNowID = 1226086881
UpgradeNow.MouseButton1Down:Connect(function()
	local playerSpaceshipLevel = player.leaderstats:GetAttribute("SpaceshipLevel")
	if rep.Domes:FindFirstChild("Lvl"..tostring(playerSpaceshipLevel + 1).."Ship") then
		MarketPlaceService:PromptProductPurchase(player, UpgradeNowID)
		wait(5)
		UpdateCompleteUI()
	else
		UpgradeNow.Text = "You are already max level!"
		wait(1)
		UpgradeNow.Text = "Upgrade Now"
	end
end)

local Debounce = false
plus100Button.MouseButton1Down:Connect(function()
	if Debounce then return end
	Debounce = true
	if player.leaderstats.Coins.Value >= 100 then
		local playerSpaceshipLevel = player.leaderstats:GetAttribute("SpaceshipLevel")
		if rep.Domes:FindFirstChild("Lvl"..tostring(playerSpaceshipLevel + 1).."Ship") then
			rep.Sounds.UpgradinSpaceship:Play()
			SpaceshipProgressEvent:FireServer(100)
			-- coin animation
			local coinClone = plus100Button.Icon:Clone()
			coinClone.Parent = plus100Button
			local Coin100MoveTween = TweenService:Create(coinClone, coinInfo, coin100Goal)
			Coin100MoveTween:Play()
			
			wait(0.2)
			UpdateCompleteUI()
			wait(0.8)
			coinClone:Destroy()
			Debounce = false
			return
		else
			plus100Button.Text = "Already Max Level"
			wait(0.5)
			plus100Button.Text = "100"
			wait(0.5)
			Debounce = false
			return
		end
	else
		plus100Button.Text = "Not enough coins"
		wait(0.5)
		MoreCoins()
		plus100Button.Text = "100"
		wait(0.5)
		Debounce = false
		return
	end
end)

local Debounce1 = false
plus1000Button.MouseButton1Down:Connect(function()
	if Debounce1 then return end
	Debounce1 = true
	if player.leaderstats.Coins.Value >= 1000 then
		local playerSpaceshipLevel = player.leaderstats:GetAttribute("SpaceshipLevel")
		if rep.Domes:FindFirstChild("Lvl"..tostring(playerSpaceshipLevel + 1).."Ship") then
			rep.Sounds.UpgradinSpaceship:Play()
			SpaceshipProgressEvent:FireServer(1000)
			
			local coinClone = plus1000Button.Icon:Clone()
			coinClone.Parent = plus1000Button
			local Coin1000MoveTween = TweenService:Create(coinClone, coinInfo, coin1000Goal)
			Coin1000MoveTween:Play()
			
			wait(0.2)
			UpdateCompleteUI()
			wait(0.8)
			coinClone:Destroy()
			Debounce1 = false
			return
		else
			plus1000Button.Text = "Already Max Level"
			wait(0.5)
			plus1000Button.Text = "1000"
			wait(0.5)
			Debounce1 = false
			return
		end
	else
		plus1000Button.Text = "Not enough coins"
		wait(0.5)
		MoreCoins()
		plus1000Button.Text = "1000"
		wait(0.5)
		Debounce1 = false
		return
	end
end)