local changeColorRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("PlayerSpaceship"):WaitForChild("ChangeColor")

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

changeColorRemote.OnServerEvent:Connect(function(player, partName, colorName, isTexture)
	
	local ColorInventory = player:WaitForChild("ColorsInventory")
	local TexturesInventory = player:WaitForChild("TexturesInventory")
	
	print("partName", partName, ". colorName", colorName, ". isTexture", isTexture)
	
	local playerFolder = game.Workspace:FindFirstChild(player.Name.."f")
	local playerSpaceship
	for i, v in pairs(playerFolder:GetChildren()) do
		if string.match(v.Name, "Lvl") then
			playerSpaceship = v
		end
	end
	
	if isTexture then
		if TexturesInventory:FindFirstChild(colorName) then
			for i, v in pairs(playerSpaceship:GetChildren()) do
				if v.Name == partName then
					-- if theres textures destroy them
					for i, childInV in pairs(v:GetChildren()) do
						if childInV:IsA("Texture") then
							childInV:Destroy()
						end
					end
					-- create textures
					CreateTextures(v, colorName)
				end
			end
		end
	else
		if ColorInventory:FindFirstChild(colorName) then
			for i, v in pairs(playerSpaceship:GetChildren()) do
				if v.Name == partName then
					v.BrickColor = BrickColor.new(colorName)
				end
			end
		end
	end
	
end)