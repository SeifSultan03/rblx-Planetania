local CodesRemoteFunction = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CodesRemote")
local CodesModule = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Codes"))

function CodesRemoteFunction.OnServerInvoke(player, code)
	
	
	local hasCode = player.ColorsInventory:GetAttribute(code)
	
	
	if hasCode then return nil end
	
	local success, errormsg = pcall(function()
		-- check if the code works
		CodesModule[code](player)
		player.ColorsInventory:SetAttribute(code, true)
	end)
	
	if success then
		return CodesModule[code.."t"]
	else
		warn(errormsg)
		return false
	end
end