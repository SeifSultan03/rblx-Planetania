local Text1 = "Welcome to the build shop. Buy furniture for your spaceship and colors and textures! New furniture comes every 2 hours"
local function typeWrite(object, text)
	for i = 1, #text, 1 do
		object.Text = string.sub(text, 1, i)
		wait(0.045)
	end
end

local IncreaseStepNum = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Tutorial"):WaitForChild("IncreaseStepNum")

script.Parent.Changed:Connect(function()
	if script.Parent.Visible then
		typeWrite(script.Parent:WaitForChild("Text"), Text1)
		wait(2)
		script.Parent:Destroy()
	end
end)