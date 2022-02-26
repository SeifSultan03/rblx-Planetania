local TweenService = game:GetService("TweenService")

for i, v in pairs(game.Workspace:WaitForChild("Map"):WaitForChild("Assets"):WaitForChild("Coins"):GetChildren()) do
	spawn(function()
		while wait(1) do
			TweenService:Create(v, TweenInfo.new(1, Enum.EasingStyle.Linear), {["CFrame"] = v.CFrame * CFrame.Angles(0, 0, math.rad(120))}):Play()
		end
	end)
end
