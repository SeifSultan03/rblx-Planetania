local plr = game.Players.LocalPlayer
local beam = script:WaitForChild("Beam"):Clone()
local BuildShopPart = game.Workspace:WaitForChild("Map"):WaitForChild("ScriptStuff"):WaitForChild("BuildShop"):WaitForChild("Meshes/IceysAssetPack_Cylinder.019 (1)")

local function pathToPart(beam, a0, part) --Function to make making paths easier
	local a1 = part:FindFirstChildOfClass("Attachment")--Find the attachment in the part
	if a1 then
		beam.Attachment0 = a0
		beam.Attachment1 = a1
	else
		warn("No attachment was inserted into "..part:GetFullName())
	end
end

plr.CharacterAdded:Connect(function(char)--Every time player respawns, connect beam again
	wait(5)
	local root = char:WaitForChild("HumanoidRootPart")
	local a0 = root:FindFirstChildOfClass("Attachment")
	char:WaitForChild("Humanoid").WalkSpeed = 24
	
	local part
	for i, v in pairs(game.Workspace:WaitForChild(plr.Name.."f"):GetChildren()) do
		if string.match(v.Name, "Lvl") then
			part = v:FindFirstChild("Part")
		end
	end
	
	if plr.leaderstats:GetAttribute("TutorialLevel") > 8 then
		beam:Destroy()
		script:Destroy()
		return
	end
	
	repeat
		wait()
	until plr.leaderstats:GetAttribute("TutorialLevel") > 8
	
	part.Touched:Connect(function()
		pathToPart(beam, a0, BuildShopPart)
		BuildShopPart.Touched:Connect(function()
			beam:Destroy()
			script:Destroy()
		end)
	end)
	
	pathToPart(beam, a0, part)
	beam.Parent = char
end)