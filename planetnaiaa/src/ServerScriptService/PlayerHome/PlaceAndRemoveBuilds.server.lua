local rep = game.ReplicatedStorage
local placeEvent = rep:WaitForChild("Remotes"):WaitForChild("PlaceItemEvent")
local removeEvent = rep:WaitForChild("Remotes"):WaitForChild("RemoveBuildEvent")

placeEvent.OnServerEvent:Connect(function(player, target, objectClone, name)
	print("Fired")
	print(target)
	print(objectClone)
	if player and target and objectClone and name then
		print(1)
		if target.Parent.Parent then
			print(2)
			if target.Parent.Parent.Name == player.Name.."f" then
				print(3)
				if target.Parent.Parent:IsA("Folder") then
					print(4)
					if objectClone.Y >= 0 then
						print(7)
						local position = Vector3.new(objectClone.X, objectClone.Y, objectClone.Z)
						local playerPos = game.Workspace.Locations:FindFirstChild(player.Name.."Location").Position
						if (position - playerPos).Magnitude <= 1000 then
							print("position is in bounds")
							if rep.Buildables:FindFirstChild(name) then
								print(8)
								if player.Inventory:FindFirstChild(name) then
									print(9)
									-- player has it and is found in buildables
									local PlaceClone = rep.Buildables:FindFirstChild(name):Clone()
									PlaceClone.Parent = game.Workspace:FindFirstChild(player.Name.."f")
									PlaceClone:SetPrimaryPartCFrame(objectClone)
									local Count = player.Inventory:FindFirstChild(name):GetAttribute("Count")
									if Count == 1 then
										-- remove from inventory
										player.Inventory:FindFirstChild(name):Destroy()
									else
										-- attribute -= 1
										player.Inventory:FindFirstChild(name):SetAttribute("Count", Count - 1)
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)

removeEvent.OnServerEvent:Connect(function(player, model)
	
	print("Remove fired")
	print(model)
	if not model then return end
	
	if model.Parent == game.Workspace:FindFirstChild(player.Name.."f") then
		if rep.Buildables:FindFirstChild(model.Name) then
			-- everythings gucci so add it back to player inv and delete it from builds
			-- check if player already has item
			if player.Inventory:FindFirstChild(model.Name) then
				local currentCount = player.Inventory:FindFirstChild(model.Name):GetAttribute("Count")
				player.Inventory:FindFirstChild(model.Name):SetAttribute("Count", currentCount + 1)
				model:Destroy()
			else
				local buildableClone = rep.Buildables:FindFirstChild(model.Name):Clone()
				buildableClone.Parent = player.Inventory
				model:Destroy()
			end
		end
	end
end)