local chatService = require(game.ServerScriptService:WaitForChild("ChatServiceRunner"):WaitForChild("ChatService"))

print("chat")

local tags = {
	["VIP"] = {TagText = "VIP", TagColor = Color3.fromRGB(255, 183, 0)}, 
}


chatService.SpeakerAdded:Connect(function(playerName)
	local speaker = chatService:GetSpeaker(playerName)
	local player = game.Players[playerName]
	print("hi 2")
	wait(10)
	if player.leaderstats:GetAttribute("OwnsVIP") then
		print("given tag")
		speaker:SetExtraData("Tags",{tags["VIP"]})
	end
end)

