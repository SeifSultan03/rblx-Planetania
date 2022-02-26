local coinAddedEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("GivePlayerCoin")
local coin = script.Parent:WaitForChild("Coin")
local GoldCoin = script.Parent:WaitForChild("GoldCoin")
local XP = script.Parent:WaitForChild("XP")
local EndPart = script.Parent:WaitForChild("SilverCoinBar")
local XPendPart = script.Parent:WaitForChild("ImageLabel")
local player = game.Players.LocalPlayer

local CoinSound = game.ReplicatedStorage:WaitForChild("Sounds"):WaitForChild("Coin")
local showHourlyRewardRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("ShowHourlyReward")

local TweenService = game:GetService("TweenService")
local goals = {}
goals.Position = EndPart.Position

local goalsXP = {}
goalsXP.Position = XPendPart.Position

local function showXP(speed, multi)
	local XPClone = XP:Clone()
	XPClone.Parent = script.Parent
	XPClone.Visible = true
	if multi/25 <= 1 then
		XPClone.Number.Text = "x"..tostring(multi)
	else
		XPClone.Number.Text = "x"..tostring(multi/25)
	end
	TweenService:Create(XPClone, TweenInfo.new(1), goalsXP):Play()
	wait(1)
	XPClone:Destroy()
	return
end

coinAddedEvent.OnClientEvent:Connect(function(speed, multi)
	-- sound
	CoinSound.PlaybackSpeed = speed
	CoinSound:Play()
	spawn(function()
		showXP(speed, multi)
	end)
	
	local coinClone = coin:Clone()
	if speed == 2.25 then
		coinClone.Size = UDim2.new(.35, 0, .35, 0)
	end
		coinClone.Number.Text = "x"..tostring(multi)
		coinClone.Parent = script.Parent
		coinClone.Size = UDim2.new(0.663, 0,0.497, 0)
		coinClone.Visible = true

		TweenService:Create(coinClone, TweenInfo.new(1), goals):Play()
		wait(1)
		coinClone:Destroy()
	
end)


--[[coinAddedEvent.OnClientEvent:Connect(function(speed)
	
	-- sound
	CoinSound.PlaybackSpeed = speed
	CoinSound:Play()
	
	spawn(showXP)
	if speed <= 2 then
	
		local coinClone = coin:Clone()
		-- CORNER 1 {2.868, 0},{-0.279, 0}
		-- CORNER 2 {-0.739, 0},{1.869, 0}
		local xRand = math.random(-739, 2868)
		local yRand = math.random(-279, 1869)
		coinClone.Parent = script.Parent
		coinClone.Position = UDim2.new(xRand/1000, 0, yRand/1000, 0)
		coinClone.Visible = true
		local magnitude = (coinClone.AbsolutePosition - EndPart.AbsolutePosition).magnitude
		local Speed = 500 / magnitude
		
		local tweenInfo = TweenInfo.new(Speed)
		local tween = TweenService:Create(coinClone, tweenInfo, goals)
		tween:Play()
		wait(Speed)
		coinClone:Destroy()
	else
		local coinClone = coin:Clone()
		-- CORNER 1 {2.868, 0},{-0.279, 0}
		-- CORNER 2 {-0.739, 0},{1.869, 0}
		local xRand = math.random(-739, 2868)
		local yRand = math.random(-279, 1869)
		coinClone:WaitForChild("Number").Visible = true
		coinClone.Parent = script.Parent
		coinClone.Size = UDim2.new(0.663, 0,0.497, 0)
		coinClone.Position = UDim2.new(xRand/1000, 0, yRand/1000, 0)
		coinClone.Visible = true
		local magnitude = (coinClone.AbsolutePosition - EndPart.AbsolutePosition).magnitude
		local Speed = magnitude/250

		local tweenInfo = TweenInfo.new(Speed)
		local tween = TweenService:Create(coinClone, tweenInfo, goals)
		tween:Play()
		wait(Speed)
		coinClone:Destroy()
	end
end)]]--

local TimeLabel = game.Workspace:WaitForChild("Map"):WaitForChild("ScriptStuff"):WaitForChild("Chest"):WaitForChild("TimeGui"):WaitForChild("TextLabel")

showHourlyRewardRemote.OnClientEvent:Connect(function()
	for count = 0, 10, 1 do
		local clone = GoldCoin:Clone()
		local rand = math.random(-20, 30)/10
		clone.Position = UDim2.new(rand, 0, 1.727, 0)
		clone.Parent = GoldCoin.Parent
		clone.Visible = true
		clone.Name = "clone"
		local goals = {}
		goals.Position = UDim2.new(rand, 0, -0.7, 0)
		local tween = TweenService:Create(clone, TweenInfo.new(0.7), goals)
		tween:Play()
	end
	
	wait(0.7)
	
	for i, v in pairs(script.Parent:GetChildren()) do
		if v.Name == "clone" then
			v:Destroy()
		end
	end
	
end)

while wait(1) do
	local secs = player.leaderstats:GetAttribute("HourlyChest") + 3600 - os.time()
	if secs < 0 then
		TimeLabel.Text = "Ready"
	else
		if secs % 60 >= 10 then
			TimeLabel.Text = tostring(math.floor(secs/60))..":"..tostring(secs % 60)
		else
			TimeLabel.Text = tostring(math.floor(secs/60))..":0"..tostring(secs % 60)
		end
	end 
end