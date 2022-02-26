local part = script.Parent --i put the name to part so you can quickly test it 

function givePet (player)
	if player then
		local character = player.Character or player.CharacterAdded:Wait()
		
		local humRootPart = character.HumanoidRootPart
		local clone = part.Parent:Clone() -- whole pet
		local newPet = script.Parent -- main part
			clone.Parent = character

			local bodyPos = Instance.new("BodyPosition", newPet)
			bodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

			local bodyGyro = Instance.new("BodyGyro", newPet)
			bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)

		while wait() do
			
				bodyPos.Position = humRootPart.Position + Vector3.new(2, 2, 3)--these are the numbers to edit if you want to change the position the block goes to
				bodyGyro.CFrame = humRootPart.CFrame * CFrame.Angles(0, math.rad(-90), 0)
			end
		
	end
end

game.Players.PlayerAdded:Connect(function(player)
	local char = player.Character or player.CharacterAdded:Wait()
	givePet(player)
end)