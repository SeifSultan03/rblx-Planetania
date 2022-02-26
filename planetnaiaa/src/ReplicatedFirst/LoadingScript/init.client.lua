game.ReplicatedFirst:RemoveDefaultLoadingScreen()

local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
playerGui:SetTopbarTransparency(0)

local loadingScreen = script.LoadingScreen:Clone()
loadingScreen.Parent = playerGui

local loadingBar = loadingScreen:WaitForChild("Image"):WaitForChild("Bar"):WaitForChild("LoadBar")
local playButton = loadingScreen.Image.TextButton
local randText = loadingScreen.Image.RandText
local currentTime = os.time()

local texts = {"Upgrade your spaceship for more space!", "Invite friends for more fun!", "Unlock new planets for new minigames!", "Visit the Buildables shop for more colors in your spaceship", "Furniture in the build shop changes every 2 hours", "Buy VIP to create parties in your spaceship!"}
repeat 
	wait(0.1)
until game:IsLoaded()

local thread = coroutine.create(function()
	while true do
		print("got random text")
		if not loadingScreen then coroutine.yield() end
		print("returned end")
		local rand = math.random(1, #texts)

		randText.Text = texts[rand]
		wait(5)
	end
end)
coroutine.resume(thread)

while os.time() - currentTime < 15 do
	wait(0.1)
	local incSize = 0
	if loadingBar.Size.X.Scale <= 0.8 then
		incSize = 0.01
	elseif loadingBar.Size.X.Scale <= 0.99 then
		incSize = 0.004
	end
	loadingBar.Size += UDim2.new(incSize, 0, 0, 0)
end

loadingBar.Size = UDim2.new(1, 0, 1, 0)

playButton.Visible = true

script:Destroy()