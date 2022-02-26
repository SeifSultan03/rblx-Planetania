local Time = script.Parent:WaitForChild("Time")
local ShowJoinUIRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("ShowJoinUI")
local JoinMinigameRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("JoinMinigame")
local ShowNotEnoughPlayersRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("ShowNotEnoughPlayers")
local WinnerRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("Winner")
local LoserRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("Loser")
local OutOfBoundsRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("OutOfBounds")

local Teleports = game.Workspace:WaitForChild("Teleports")
local TouchMeteorBindable = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("TouchMeteorBindable")

local Meteors = game.ReplicatedStorage:WaitForChild("Meteors")
local Meteor = Meteors:WaitForChild("Meteor") 
local Warning = Meteors:WaitForChild("Warning")
local GoodMeteor = Meteors:WaitForChild("GoodMeteor")
local GoodWarning = Meteors:WaitForChild("GoodWarning")
	
local RoundDuration = 60

local playersInRound = {}
-- true = Joinable
local GameState = false

local GameBasePlate = game.Workspace:WaitForChild("Map"):WaitForChild("MinigameArea"):WaitForChild("Circle")
local Corner1 = GameBasePlate.Position - Vector3.new(183/2, 0, 183/2)
local Corner2 = GameBasePlate.Position + Vector3.new(183/2, 0, 183/2)

local function startGame()
	RoundDuration = 60
	Time.Value = 120
	
	print("minigame starteddd")
	GameState = false
	
	while Time.Value > 0 do
		task.wait(1)
		Time.Value -= 1
	end
	
	Time.Value = 0
	GameState = true
	playersInRound = {}
	ShowJoinUIRemote:FireAllClients()
	
	wait(10)
	
	GameState = false
	if #playersInRound < 1 then
		startGame()
		return
	end
	
	Time.Value = 181
	
	while #playersInRound > 0 and RoundDuration > 40 do
		wait(0.15)
		
		RoundDuration -= 0.15
		
		for i, v in pairs(playersInRound) do
			local player = game.Players:FindFirstChild(v)

			if player then
				local char = player.Character or player.CharacterAdded:Wait()
				local Pos = Vector3.new(char.PrimaryPart.Position.X, Corner1.Y, char.PrimaryPart.Position.Z)
				if Pos.X <= Corner2.X and Pos.X >= Corner1.X and Pos.Y >= 8 and Pos.Z <= Corner2.Z and Pos.Z >= Corner1.Z then

				else
					OutOfBoundsRemote:FireClient(player)
					if playersInRound[i] == player.Name then
						table.remove(playersInRound, i)
					end
				end
			else
				table.remove(playersInRound, i)
			end
		end
		
		local rand = math.random(1, 100)
		local RandPos = Vector3.new(math.random(Corner1.X, Corner2.X), Corner1.Y, math.random(Corner1.Z, Corner2.Z))
		local Rand = math.random(25, 50)
		local RandSizeMeteor = Vector3.new(Rand, Rand, Rand)
		local RandSizeWarning = Vector3.new(1.1, Rand, Rand)

		if rand >= 95 then
			-- good meteor
			local BadMeteorClone = GoodMeteor:Clone()
			local WarningClone = GoodWarning:Clone()

			BadMeteorClone.Anchored = false
			BadMeteorClone.Position = RandPos + Vector3.new(0, 1000, 0)
			BadMeteorClone.Size = RandSizeMeteor
			BadMeteorClone.Mesh.Scale = RandSizeMeteor / 2

			WarningClone.Position = RandPos
			WarningClone.Size = RandSizeWarning

			BadMeteorClone.Parent = game.Workspace
			WarningClone.Parent = game.Workspace
			WarningClone.WarningScript.Disabled = false
		else
			-- bad meteor
			local BadMeteorClone = Meteor:Clone()
			local WarningClone = Warning:Clone()

			BadMeteorClone.Anchored = false
			BadMeteorClone.Position = RandPos + Vector3.new(0, 1000, 0)
			BadMeteorClone.Size = RandSizeMeteor
			BadMeteorClone.Mesh.Scale = RandSizeMeteor / 2

			WarningClone.Position = RandPos
			WarningClone.Size = RandSizeWarning

			BadMeteorClone.Parent = game.Workspace
			WarningClone.Parent = game.Workspace
			WarningClone.WarningScript.Disabled = false
		end
	end
	
	while #playersInRound > 0 and RoundDuration > 20 do
		local randomWait = 1
		
		wait(randomWait)

		RoundDuration-= randomWait
		
		for i, v in pairs(playersInRound) do
			local player = game.Players:FindFirstChild(v)

			if player then
				local char = player.Character or player.CharacterAdded:Wait()
				local Pos = Vector3.new(char.PrimaryPart.Position.X, Corner1.Y, char.PrimaryPart.Position.Z)
				if Pos.X <= Corner2.X and Pos.X >= Corner1.X and Pos.Y >= 8 and Pos.Z <= Corner2.Z and Pos.Z >= Corner1.Z then
					local rand = math.random(1, 100)
					local Rand = math.random(25, 50)
					local RandSizeMeteor = Vector3.new(Rand, Rand, Rand)
					local RandSizeWarning = Vector3.new(1.1, Rand, Rand)

					if rand >= 95 then
						-- good meteor
		
						local BadMeteorClone = GoodMeteor:Clone()
						local WarningClone = GoodWarning:Clone()

						BadMeteorClone.Anchored = false
						BadMeteorClone.Position = Pos + Vector3.new(0, 1000, 0)
						BadMeteorClone.Size = RandSizeMeteor
						BadMeteorClone.Mesh.Scale = RandSizeMeteor / 2

						WarningClone.Position = Pos
						WarningClone.Size = RandSizeWarning

						BadMeteorClone.Parent = game.Workspace
						WarningClone.Parent = game.Workspace
						WarningClone.WarningScript.Disabled = false
					else
						-- bad meteor
						local BadMeteorClone = Meteor:Clone()
						local WarningClone = Warning:Clone()

						BadMeteorClone.Anchored = false
						BadMeteorClone.Position = Pos + Vector3.new(0, 1000, 0)
						BadMeteorClone.Size = RandSizeMeteor
						BadMeteorClone.Mesh.Scale = RandSizeMeteor / 2

						WarningClone.Position = Pos
						WarningClone.Size = RandSizeWarning

						BadMeteorClone.Parent = game.Workspace
						WarningClone.Parent = game.Workspace
						WarningClone.WarningScript.Disabled = false
					end
				else
					OutOfBoundsRemote:FireClient(player)
					if playersInRound[i] == player.Name then
						table.remove(playersInRound, i)
					end
				end
			else
				table.remove(playersInRound, i)
			end
		end
		
	end
	
	while #playersInRound > 0 and RoundDuration > 0 do
		if #playersInRound > 1 then
			wait(0.15)
			
			RoundDuration -= 0.15
		else
			wait(0.13)

			RoundDuration -= 0.13
		end
		
		for i, v in pairs(playersInRound) do
			local player = game.Players:FindFirstChild(v)

			if player then
				local char = player.Character or player.CharacterAdded:Wait()
				local Pos = Vector3.new(char.PrimaryPart.Position.X, Corner1.Y, char.PrimaryPart.Position.Z)
				if Pos.X <= Corner2.X and Pos.X >= Corner1.X and Pos.Y >= 8 and Pos.Z <= Corner2.Z and Pos.Z >= Corner1.Z then
					
				else
					OutOfBoundsRemote:FireClient(player)
					if playersInRound[i] == player.Name then
						table.remove(playersInRound, i)
					end
				end
			else
				table.remove(playersInRound, i)
			end
		end

		local rand = math.random(1, 100)
		local RandPos = Vector3.new(math.random(Corner1.X, Corner2.X), Corner1.Y, math.random(Corner1.Z, Corner2.Z))
		local Rand = math.random(25, 50)
		local RandSizeMeteor = Vector3.new(Rand, Rand, Rand)
		local RandSizeWarning = Vector3.new(1.1, Rand, Rand)


		if rand >= 95 then
			-- good meteor

			local BadMeteorClone = GoodMeteor:Clone()
			local WarningClone = GoodWarning:Clone()

			BadMeteorClone.Anchored = false
			BadMeteorClone.Position = RandPos + Vector3.new(0, 1000, 0)
			BadMeteorClone.Size = RandSizeMeteor
			BadMeteorClone.Mesh.Scale = RandSizeMeteor / 2

			WarningClone.Position = RandPos
			WarningClone.Size = RandSizeWarning

			BadMeteorClone.Parent = game.Workspace
			WarningClone.Parent = game.Workspace
			WarningClone.WarningScript.Disabled = false
		else
			-- bad meteor
			local BadMeteorClone = Meteor:Clone()
			local WarningClone = Warning:Clone()

			BadMeteorClone.Anchored = false
			BadMeteorClone.Position = RandPos + Vector3.new(0, 1000, 0)
			BadMeteorClone.Size = RandSizeMeteor
			BadMeteorClone.Mesh.Scale = RandSizeMeteor / 2

			WarningClone.Position = RandPos
			WarningClone.Size = RandSizeWarning

			BadMeteorClone.Parent = game.Workspace
			WarningClone.Parent = game.Workspace
			WarningClone.WarningScript.Disabled = false
		end
	end
	
	for i, v in pairs(playersInRound) do
		local player = game.Players:FindFirstChild(v)
		if player then
			player.leaderstats.Coins.Value += 300
			local char = player.Character or player.CharacterAdded:Wait()
			char:SetPrimaryPartCFrame(Teleports.TeleportToSpawn.CFrame)
			
			WinnerRemote:FireClient(player, #playersInRound)
		end
	end
	
	startGame()
end

JoinMinigameRemote.OnServerEvent:Connect(function(player)
	if not GameState then return end
	local Found = false
	for i, v in pairs(playersInRound) do
		if v == player.Name then
			Found = true
		end
	end
	
	if not Found then
		table.insert(playersInRound, player.Name)
		local char = player.Character or player.CharacterAdded:Wait()
		char:SetPrimaryPartCFrame(Teleports.TeleportToMinigame.CFrame)
		
	end
	
end)

TouchMeteorBindable.Event:Connect(function(player)
	
	local char = player.Character or player.CharacterAdded:Wait()
	char:SetPrimaryPartCFrame(Teleports.TeleportToSpawn.CFrame)
	for i, v in pairs(playersInRound) do
		if v == player.Name then
			table.remove(playersInRound, i)
			player.leaderstats.Coins.Value += 50
		end
	end
	
	LoserRemote:FireClient(player)
end)

wait(5)


startGame()