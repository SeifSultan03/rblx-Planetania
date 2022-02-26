local rep = game:GetService("ReplicatedStorage")

rep.Remotes.ChangePlayerExtras.OnServerEvent:Connect(function(player, name)
	local char = player.Character or player.CharacterAdded:Wait()
	local object = rep.Extras:WaitForChild(tostring(name))
	local objInPlayerInv = player.WearInventory.ExtrasInventory:FindFirstChild(name)
	
	-- detect if player already has the item, take it off and put it back if so
	if objInPlayerInv then
		if string.match(name, "Type") then -- if named correctly
			local splitTable = string.split(name, "Type")
			local Type = splitTable[2]
			print(Type)
			-- if theres somethin they already wearin of the same type
			for i, ItemToMove in pairs(player.WearInventory.CurrentlyWearing:GetChildren()) do
				if string.match(ItemToMove.Name, Type) then
	
					ItemToMove.Parent = player.WearInventory.ExtrasInventory
					char:FindFirstChild(ItemToMove.Name):Destroy() -- destroy from inside char
					ItemToMove:Destroy()
					if ItemToMove.Name == object.Name then return end
				end
			end
			local ObjClone = object:Clone()
			ObjClone.Parent = char
			local ObjClone2 = object:Clone()
			ObjClone2.Parent = player.WearInventory.CurrentlyWearing
			
		end
	end
end)

