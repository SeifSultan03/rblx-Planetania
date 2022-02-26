local DSS = game:GetService("DataStoreService")
local LevelLeaderboard = DSS:GetOrderedDataStore("LevelLeaderboard")
local surfaceGui = game.Workspace.Leaderboards.Level.Wall.SurfaceGui


local function UpdateLeaderboard()
	
	local success, errormsg = pcall(function()
		local Data = LevelLeaderboard:GetSortedAsync(false, 8)
		local LevelPage = Data:GetCurrentPage()
		print(Data, LevelPage)
		for i, child in pairs(surfaceGui:GetChildren()) do
			if child:IsA("Frame") and child.Name ~= "Info" and child.Name ~= "Template" then
				child:Destroy()
			end
		end
		
		for Rank, data in pairs(LevelPage) do
			local userName = game.Players:GetNameFromUserIdAsync(tonumber(data.key))
			local Level = data.value
			if Level then
				if Rank == 1 then
					local clone = surfaceGui.Template:Clone()
					clone.Visible = true
					clone.Name = "PLAYER"
					clone.Parent = surfaceGui
					clone.Level.Text = tostring(Level)
					clone.Level.TextColor3 = Color3.new(1, 0.835294, 0)
					clone:FindFirstChild("Name").TextColor3 = Color3.new(1, 0.835294, 0)
					clone:FindFirstChild("Name").Text = userName
				elseif Rank == 2 then
					local clone = surfaceGui.Template:Clone()
					clone.Visible = true
					clone.Name = "PLAYER"
					clone.Parent = surfaceGui
					clone.Level.Text = tostring(Level)
					clone.Level.TextColor3 = Color3.new(0.792157, 0.792157, 0.792157)
					clone:FindFirstChild("Name").TextColor3 = Color3.new(0.792157, 0.792157, 0.792157)
					clone:FindFirstChild("Name").Text = userName
				elseif Rank == 3 then
					local clone = surfaceGui.Template:Clone()
					clone.Visible = true
					clone.Name = "PLAYER"
					clone.Parent = surfaceGui
					clone.Level.Text = tostring(Level)
					clone.Level.TextColor3 = Color3.new(1, 0.486275, 0.145098)
					clone:FindFirstChild("Name").TextColor3 = Color3.new(1, 0.486275, 0.145098)
					clone:FindFirstChild("Name").Text = userName
				else
					local clone = surfaceGui.Template:Clone()
					clone.Visible = true
					clone.Name = "PLAYER"
					clone.Parent = surfaceGui
					clone.Level.Text = tostring(Level)
					clone:FindFirstChild("Name").Text = userName
				end
			end
			
		end
	end)
	
	if not success then
		print(errormsg)
	end
	
end

while true do
	
	for _, player in pairs(game.Players:GetPlayers()) do
		LevelLeaderboard:SetAsync(player.UserId, player.leaderstats:GetAttribute("Level"))
	end
	
	UpdateLeaderboard()
	wait(120)
end