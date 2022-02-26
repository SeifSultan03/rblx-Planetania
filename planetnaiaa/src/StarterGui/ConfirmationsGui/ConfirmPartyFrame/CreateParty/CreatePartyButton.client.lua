local player = game.Players.LocalPlayer
local PartyRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Communications"):WaitForChild("PartyInvite")
local ThisFrame = script.Parent.Parent
local VIPFrameForParty = ThisFrame.Parent.Parent:WaitForChild("Gamepasses"):WaitForChild("VIPFrameBuyParty")

local debounce = false
script.Parent.MouseButton1Down:Connect(function()
	if debounce then 
		script.Parent.Text = "Please wait 2 minutes before you can send a new party request"
		script.Parent.BackgroundColor3 = Color3.new(1, 0, 0)
		wait(1.35)
		script.Parent.Text = "Create Party"
		script.Parent.BackgroundColor3 = Color3.new(0.266667, 1, 0)
		return 
	end
	
	if player.leaderstats:GetAttribute("OwnsVIP") == true then
		debounce = true
		PartyRemote:FireServer()
		game.ReplicatedStorage.Sounds.SentSound:Play()
		script.Parent.Text = "Sent!"
		wait(1)
		script.Parent.Text = "Create Party"
	else
		-- suggest buying VIP
		script.Parent.Text = "You need VIP to create party"
		script.Parent.BackgroundColor3 = Color3.new(1, 0, 0)
		wait(1.35)
		script.Parent.Text = "Create Party"
		script.Parent.BackgroundColor3 = Color3.new(0.266667, 1, 0)
		ThisFrame.Visible = false
		VIPFrameForParty.Visible = true
	end
	wait(120)
	debounce = false
end)