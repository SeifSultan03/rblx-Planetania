local rep = game:GetService("ReplicatedStorage")

rep.Remotes.ChangePlayerClothes.OnServerEvent:Connect(function(player, name)
	local char = player.Character or player.CharacterAdded:Wait()
	local object = rep.Accessories:WaitForChild(tostring(name))
	local CurrentTextures = player.WearInventory.CurrentTextures
	for i, v in pairs(char:GetChildren()) do
		if v:IsA("MeshPart") then
			if string.match(object.Name, v.Name) then -- here, v is the part we find to change its stuff
				if player.WearInventory:FindFirstChild(object.Name) ~= nil then -- if player has the object
					if string.match(object.Name, "Left") then -- if matches with left, find the right version also
						local objName = object.Name
						local splitTable = string.split(objName, "Left")
						local Type = splitTable[1]
						local BodyPart = splitTable[2]
						-- change the texture of the current part
						v.TextureID = object.TextureID
						-- change the texture of the corresponding part
						local OtherObject = rep.Accessories:FindFirstChild(Type.."Right"..BodyPart)
						print(OtherObject)
						local OtherCharPart = char["Right"..BodyPart]
						print(OtherCharPart)
						OtherCharPart.TextureID = OtherObject.TextureID
						
						local InPlayer = CurrentTextures:FindFirstChild(v.Name)
						InPlayer.Value = name

					elseif string.match(object.Name, "Right") then
						local objName = object.Name
						local splitTable = string.split(objName, "Right")
						local Type = splitTable[1]
						local BodyPart = splitTable[2]
						-- change the texture of the current part
						v.TextureID = object.TextureID
						-- change the texture of the corresponding part
						local OtherObject = rep.Accessories:FindFirstChild(Type.."Left"..BodyPart)
						print(OtherObject)
						local OtherCharPart = char["Left"..BodyPart]
						print(OtherCharPart)
						OtherCharPart.TextureID = OtherObject.TextureID
					else
						-- simply adjust that part since it is only 1 part doesnt have left or right
						v.TextureID = object.TextureID
						local InPlayer = CurrentTextures:FindFirstChild(v.Name)
						InPlayer.Value = name
					end
				else
					print("player sending fake item, its not found on server")
				end
			end
		end
	end
end)

