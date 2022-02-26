local rep = game.ReplicatedStorage
local ChangeCamEvent = rep:WaitForChild("Remotes"):WaitForChild("Camera"):WaitForChild("CameraToHouseUpgrade")

local function CreateTextures(parent, TextureID)
	local Texture = Instance.new("Texture")
	Texture.Parent = parent
	Texture.Texture = TextureID
	Texture.StudsPerTileU = 10
	Texture.StudsPerTileV = 10
	Texture.Transparency = 0.7
	Texture.Face = "Top"
	local Clone1 = Texture:Clone()
	Clone1.Parent = parent
	Clone1.Face = "Bottom"
	local Clone2 = Texture:Clone()
	Clone2.Parent = parent
	Clone2.Face = "Front"
	local Clone3 = Texture:Clone()
	Clone3.Parent = parent
	Clone3.Face = "Back"
	local Clone4 = Texture:Clone()
	Clone4.Parent = parent
	Clone4.Face = "Right"
	local Clone5 = Texture:Clone()
	Clone5.Parent = parent
	Clone5.Face = "Left"
end

game.Players.PlayerAdded:Connect(function(player)
	wait(2)
	player:WaitForChild("leaderstats"):GetAttributeChangedSignal("SpaceshipLevel"):Connect(function()
		
		local PlayerSpaceshipLvl = player.leaderstats:GetAttribute("SpaceshipLevel")
		if game.Workspace:FindFirstChild(player.Name.."f") then
			local playerFolder = game.Workspace:FindFirstChild(player.Name.."f")
			-- COLORS SAVE COLORS SAVE COLORS SAVE NOTE
			
			if playerFolder then
				-- destroy old spaceship but get its colors first
				local BuildableFloorColor
				local BuildableFloorTexture
				local Color1
				local Color1Texture
				local Color2
				local Color2Texture
				local WallColor
				local CurrentPlayerSpaceship
				
				for i, v in pairs(playerFolder:GetChildren()) do
					if string.match(v.Name, "Lvl") then
						CurrentPlayerSpaceship = v
						BuildableFloorColor = v:FindFirstChild("BuildableFloor").BrickColor
						if v:FindFirstChild("BuildableFloor"):FindFirstChildOfClass("Texture") then
							BuildableFloorTexture = v:FindFirstChild("BuildableFloor"):FindFirstChildOfClass("Texture").Texture
						else
							BuildableFloorTexture = ""
						end
						Color1 = v:FindFirstChild("Color1").BrickColor
						if v:FindFirstChild("Color1"):FindFirstChildOfClass("Texture") then
							Color1Texture = v:FindFirstChild("Color1"):FindFirstChildOfClass("Texture").Texture
						else
							Color1Texture = ""
						end
						Color2 = v:FindFirstChild("Color2").BrickColor
						if v:FindFirstChild("Color2"):FindFirstChildOfClass("Texture") then
							Color2Texture = v:FindFirstChild("Color2"):FindFirstChildOfClass("Texture").Texture
						else
							Color2Texture = ""
						end
						WallColor = v:FindFirstChild("Wall").BrickColor
					end
				end
				
				if CurrentPlayerSpaceship and CurrentPlayerSpaceship.Name ~= "Lvl"..tostring(PlayerSpaceshipLvl).."Ship" then
					print("NEW SHIP lesgoo")
					-- its indeed a new ship
					if rep.Domes:FindFirstChild("Lvl"..tostring(PlayerSpaceshipLvl).."Ship") then
						-- and found the one in rep storage
						local newHomeClone = rep.Domes:FindFirstChild("Lvl"..tostring(PlayerSpaceshipLvl).."Ship"):Clone()
						-- set the colors
						for i, child in pairs(newHomeClone:GetChildren()) do
							if child.Name == "BuildableFloor" then
								child.BrickColor = BuildableFloorColor
								CreateTextures(child, BuildableFloorTexture)
							elseif child.Name == "Color1" then
								child.BrickColor = Color1
								CreateTextures(child, Color1Texture)
							elseif child.Name == "Color2" then
								child.BrickColor = Color2
								CreateTextures(child, Color2Texture)
							elseif child.Name == "Wall" then
								child.BrickColor = WallColor
							end
						end
						
						ChangeCamEvent:FireClient(player, CurrentPlayerSpaceship)
						
						wait(2.5)
						
						newHomeClone.Parent = playerFolder
						newHomeClone:SetPrimaryPartCFrame(game.Workspace.Locations:FindFirstChild(player.Name.."Location").CFrame)
						CurrentPlayerSpaceship:Destroy()
					end
				end
			end
		end
	end)
end)