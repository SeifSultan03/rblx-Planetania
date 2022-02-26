local NotificationsRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("Notifications")
local Template = script.Parent:WaitForChild("Template")
local NotificationSound = game.ReplicatedStorage:WaitForChild("Sounds"):WaitForChild("notification")

NotificationsRemote.OnClientEvent:Connect(function(msg)
	local TemplateClone = Template:Clone()
	TemplateClone.Parent = script.Parent
	TemplateClone.Text = msg
	TemplateClone.Visible = true
	NotificationSound:Play()
	wait(3)
	for count = 0, 1, 0.1 do
		TemplateClone.Transparency = count
		wait(0.2)
	end
	TemplateClone:Destroy()
end)
