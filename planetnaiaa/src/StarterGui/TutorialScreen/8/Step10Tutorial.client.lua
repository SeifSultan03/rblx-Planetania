local Text1 = "Use the build button to build in your spaceship!"
local function typeWrite(object, text)
	for i = 1, #text, 1 do
		object.Text = string.sub(text, 1, i)
		wait(0.045)
	end
end

local IncreaseStepNum = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Tutorial"):WaitForChild("IncreaseStepNum")

local ScreenGui = script.Parent.Parent.Parent:WaitForChild("ScreenGui")
local Arrow = script.Parent:WaitForChild("Arrow")

script.Parent.Changed:Connect(function()
	if script.Parent.Visible then
		typeWrite(script.Parent:WaitForChild("Text"), Text1)
		wait(1)
		local UpgradesButton = ScreenGui.BuildAndInv.BaseUi.ImageButton

		Arrow.Visible = true
		local done = false
		local typeWritten = 0
		UpgradesButton.MouseButton1Down:Connect(function()
			if Arrow.Visible then
				IncreaseStepNum:FireServer()
			end
		end)
	end
end)