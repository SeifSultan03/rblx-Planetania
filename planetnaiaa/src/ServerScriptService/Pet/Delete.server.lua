local DeleteRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Pets"):WaitForChild("Delete")



DeleteRemote.OnServerEvent:Connect(function(player, petName)
	if petName then
		if player.Pets:FindFirstChild(petName) then
			local petInRep = game.ReplicatedStorage.Pets:FindFirstChild(petName, true)
			if petInRep then
				
				if player.CurrentPet:FindFirstChild(petName) then
					player.Pets:FindFirstChild(petName):Destroy()
					player.CurrentPet:FindFirstChild(petName):Destroy()
					local char = player.Character or player.CharacterAdded:Wait()
					for i, v in pairs(char:GetChildren()) do
						if string.match(v.Name, "Pet") then
							v:Destroy()
						end
					end
				else
					player.Pets:FindFirstChild(petName):Destroy()
				end
			end
		end
	end

end)
