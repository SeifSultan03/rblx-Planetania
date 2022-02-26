local rep = game.ReplicatedStorage
local startTutorial = rep:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("StartTutorial")
local IncreaseStepNum = rep:WaitForChild("Remotes"):WaitForChild("Tutorial"):WaitForChild("IncreaseStepNum")

IncreaseStepNum.OnServerEvent:Connect(function(player)
	player.leaderstats:SetAttribute("TutorialLevel", player.leaderstats:GetAttribute("TutorialLevel") + 1)
	startTutorial:FireClient(player, player.leaderstats:GetAttribute("TutorialLevel"))
end)
