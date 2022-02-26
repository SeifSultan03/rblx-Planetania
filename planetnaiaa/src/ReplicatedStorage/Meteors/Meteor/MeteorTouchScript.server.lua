local TouchMeteorBindable = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("TouchMeteorBindable")

local debounce = false

function onTouch(hit)
	if not hit.Parent:FindFirstChild("Humanoid") then return end
	if debounce then return end
	debounce = true
	local p = Instance.new("Explosion")
	p.Parent = game.Workspace
	p.Position = script.Parent.Position
	p.BlastRadius = 1000
	p.DestroyJointRadiusPercent = 0
	
	if hit.Parent:FindFirstChild("Humanoid") then
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		TouchMeteorBindable:Fire(player)
	end
	
	wait(1)
	script.Parent:Destroy()
end
script.Parent.Touched:connect(onTouch)