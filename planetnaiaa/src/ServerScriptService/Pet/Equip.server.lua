local EquipRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Pets"):WaitForChild("Equip")

function givePet (player, pet)
	if player then
		local character = player.Character or player.CharacterAdded:Wait()

		local humRootPart = character.HumanoidRootPart
		local clone = pet:Clone() -- whole pet
		local MainPart = clone:FindFirstChild("m") -- main part
		clone.Parent = character

		local bodyPos = Instance.new("BodyPosition")
		bodyPos.Parent = MainPart
		bodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

		local bodyGyro = Instance.new("BodyGyro")
		bodyGyro.Parent = MainPart
		bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)

		task.spawn(function()
			while MainPart.Parent do
				wait()
				bodyPos.Position = humRootPart.Position + Vector3.new(2, 2, 3)--these are the numbers to edit if you want to change the position the block goes to
				bodyGyro.CFrame = humRootPart.CFrame * CFrame.Angles(0, math.rad(-90), 0)
			end
			print("the spawn got done")
		end)
	end
end

EquipRemote.OnServerEvent:Connect(function(player, petName)
	
	if petName then
		if player.Pets:FindFirstChild(petName, true) then
			local petInRep = game.ReplicatedStorage.Pets:FindFirstChild(petName, true)
			if petInRep then
				-- delete from current pet
				for i, v in pairs(player.CurrentPet:GetChildren()) do
					v:Destroy()
				end
				
				local petClone = petInRep:Clone()
				petClone.Parent = player.CurrentPet
				
				local char = player.character or player.CharacterAdded:Wait()
				for i, v in pairs(char:GetChildren()) do
					if string.match(v.Name, "Pet") then
						v:Destroy()
					end
				end
				
				givePet(player, petInRep)
			end
		end
	end
	
end)
