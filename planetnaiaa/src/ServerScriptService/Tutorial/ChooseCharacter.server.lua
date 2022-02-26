local rep = game.ReplicatedStorage

local ChooseCharRemote = rep:WaitForChild("Remotes"):WaitForChild("Tutorial"):WaitForChild("ChooseCharacter")

ChooseCharRemote.OnServerEvent:Connect(function(player, boyOrGirl)
	
	local char = player.Character or player.CharacterAdded:Wait()
	local playerWearInventory = player.WearInventory
	
	local boyHair = rep:WaitForChild("Extras"):WaitForChild("BasicBoyHairTypeHat")
	local girlHair = rep:WaitForChild("Extras"):WaitForChild("BasicGirlHairTypeHat")
	
	if player.leaderstats:GetAttribute("TutorialLevel") > 2 then
		player:Kick() return
	end
	if playerWearInventory:FindFirstChild("BasicBoyHairTypeHat") then
		player:Kick() return
	end
	if boyOrGirl == "Boy" then
		local Clone1 = boyHair:Clone()
		Clone1.Parent = char
		local Clone2 = boyHair:Clone()
		Clone2.Parent = playerWearInventory.CurrentlyWearing
		local Clone3 = girlHair:Clone()
		Clone3.Parent = playerWearInventory.ExtrasInventory
		-- inventory
		local Clone4 = boyHair:Clone()
		Clone4.Parent = playerWearInventory.ExtrasInventory
	elseif boyOrGirl == "Girl" then
		local Clone1 = girlHair:Clone()
		Clone1.Parent = char
		local Clone2 = girlHair:Clone()
		Clone2.Parent = playerWearInventory.CurrentlyWearing
		local Clone3 = boyHair:Clone()
		Clone3.Parent = playerWearInventory.ExtrasInventory
		-- inventory
		local Clone4 = girlHair:Clone()
		Clone4.Parent = playerWearInventory.ExtrasInventory
	else
		player:Kick("NO MALFORMING. Error code: TutCC 17. Report to Killerz#6091")
	end
	
end)