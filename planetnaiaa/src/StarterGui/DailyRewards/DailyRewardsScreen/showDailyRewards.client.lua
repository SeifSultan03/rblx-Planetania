local rep = game:GetService("ReplicatedStorage")
local showDailyReward = rep:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("ShowDailyReward")
local player = game.Players.LocalPlayer

local ScreenGui = script.Parent.Parent.Parent:WaitForChild("ScreenGui")
local DailyRewardFrame = script.Parent
local sound = rep:WaitForChild("Sounds"):WaitForChild("SentSound")

local GridFrame = script.Parent:WaitForChild("GridFrame")
local ClaimDailyRewardRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ClaimDailyReward")

local stillMore = true
showDailyReward.OnClientEvent:Connect(function()
	print("showing Rewards Soon")
	wait(30)
	ScreenGui.Enabled = false
	DailyRewardFrame.Visible = true
	sound:Play()
	-- show claim buttons
	local streak = player.leaderstats:GetAttribute("LoginStreak")
	local claimable = streak % 5
	
	if claimable == 0 and streak ~= 0 then claimable = 5 end
	
	local Inventory = player.Inventory
	
	for count = 1, claimable do
		if Inventory:GetAttribute("DailyReward"..tostring(count)) == false then
			local Frame = GridFrame:FindFirstChild(tostring(count))
			Frame.Claim.Visible = true
			Frame.Claim.MouseButton1Down:Connect(function()
				game.ReplicatedStorage.Sounds.UpgradinSpaceship:Play()
				Frame.Claim.Visible = false
				ClaimDailyRewardRemote:FireServer(Frame.Name)
				-- for loop to check if theres any others left
				stillMore = false
				for i, v in pairs(GridFrame:GetChildren()) do
					if v:IsA("Frame") then
						if v.Claim.Visible == true then
							stillMore = true
						end
					end
				end
				
				if not stillMore then
					ScreenGui.Enabled = true
					script.Parent.Parent:Destroy()
				end
				
			end)
		end
	end
	
end)
