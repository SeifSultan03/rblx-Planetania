local DSS = game:GetService("DataStoreService")
local RobuxLeaderboard = DSS:GetOrderedDataStore("RobuxLeaderboard")
local surfaceGui = game.Workspace.Leaderboards.Robux.Wall.SurfaceGui.ScrollingFrame


local function UpdateLeaderboard()
	
	local success, errormsg = pcall(function()
		local Data = RobuxLeaderboard:GetSortedAsync(false, 30)
		local LevelPage = Data:GetCurrentPage()
		print(Data, LevelPage)
		for i, child in pairs(surfaceGui:GetChildren()) do
			if child:IsA("Frame") and child.Name ~= "Info" and child.Name ~= "Template" then
				child:Destroy()
			end
		end
		
		for Rank, data in pairs(LevelPage) do
			local userName = game.Players:GetNameFromUserIdAsync(tonumber(data.key))
			local Robux = data.value
			if Robux then
				if Rank == 1 then
					local clone = surfaceGui.Template:Clone()
					clone.Visible = true
					clone.Name = "PLAYER"
					clone.Parent = surfaceGui
					clone.Robux.Text = tostring(Robux)
					clone.Robux.TextColor3 = Color3.new(1, 0.835294, 0)
					
					local thumbType = Enum.ThumbnailType.HeadShot
					local thumbSize = Enum.ThumbnailSize.Size60x60
					local content, isReady = game:GetService("Players"):GetUserThumbnailAsync(tonumber(data.key), thumbType, thumbSize)
					
					clone.ImageLabel.Image = content
					clone:FindFirstChild("Name").TextColor3 = Color3.new(1, 0.835294, 0)
					clone:FindFirstChild("Name").Text = tostring(Rank).."."..userName
				elseif Rank == 2 then
					local clone = surfaceGui.Template:Clone()
					clone.Visible = true
					clone.Name = "PLAYER"
					clone.Parent = surfaceGui
					clone.Robux.Text = tostring(Robux)
					clone.Robux.TextColor3 = Color3.new(0.792157, 0.792157, 0.792157)
					
					local thumbType = Enum.ThumbnailType.HeadShot
					local thumbSize = Enum.ThumbnailSize.Size60x60
					local content, isReady = game:GetService("Players"):GetUserThumbnailAsync(tonumber(data.key), thumbType, thumbSize)

					clone.ImageLabel.Image = content
					clone:FindFirstChild("Name").TextColor3 = Color3.new(0.792157, 0.792157, 0.792157)
					clone:FindFirstChild("Name").Text = tostring(Rank).."."..userName
				elseif Rank == 3 then
					local clone = surfaceGui.Template:Clone()
					clone.Visible = true
					clone.Name = "PLAYER"
					clone.Parent = surfaceGui
					clone.Robux.Text = tostring(Robux)
					clone.Robux.TextColor3 = Color3.new(1, 0.486275, 0.145098)
					
					local thumbType = Enum.ThumbnailType.HeadShot
					local thumbSize = Enum.ThumbnailSize.Size60x60
					local content, isReady = game:GetService("Players"):GetUserThumbnailAsync(tonumber(data.key), thumbType, thumbSize)

					clone.ImageLabel.Image = content
					clone:FindFirstChild("Name").TextColor3 = Color3.new(1, 0.486275, 0.145098)
					clone:FindFirstChild("Name").Text = tostring(Rank).."."..userName
				else
					local clone = surfaceGui.Template:Clone()
					clone.Visible = true
					clone.Name = "PLAYER"
					clone.Parent = surfaceGui
					clone.Robux.Text = tostring(Robux)
					
					local thumbType = Enum.ThumbnailType.HeadShot
					local thumbSize = Enum.ThumbnailSize.Size60x60
					local content, isReady = game:GetService("Players"):GetUserThumbnailAsync(tonumber(data.key), thumbType, thumbSize)

					clone.ImageLabel.Image = content
					clone:FindFirstChild("Name").Text = tostring(Rank).."."..userName
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
		RobuxLeaderboard:SetAsync(player.UserId, player.leaderstats:GetAttribute("RobuxDonated"))
	end
	
	UpdateLeaderboard()
	wait(60)
end