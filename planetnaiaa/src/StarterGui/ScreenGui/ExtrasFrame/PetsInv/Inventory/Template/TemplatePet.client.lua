local Button = script.Parent
local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Size = Button.Size + UDim2.new(0, 5, 0, 5)
local goalsSmaller = {}
goalsSmaller.Size = Button.Size
local tweenInfo = TweenInfo.new(0.2)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)


Button.MouseEnter:Connect(function()
	TweenBigger:Play()
end)

Button.MouseLeave:Connect(function()
	TweenSmaller:Play()
end)

local Display = script.Parent.Parent.Parent:WaitForChild("Display")
local VPF = Display.Current.ViewportFrame

Button.MouseButton1Down:Connect(function()
	Display.Visible = true
	
		-- set stats
	local petInRep = game.ReplicatedStorage.Pets:FindFirstChild(script.Parent.Name, true)
	
	if petInRep then
		for i, v in pairs(VPF:GetChildren()) do
			v:Destroy()
		end
		local PetClone = petInRep:Clone()
		PetClone.Parent = VPF
		
		local VPFCam = Instance.new("Camera")
		VPFCam.Parent = VPF
		VPF.CurrentCamera = VPFCam
		local mainPart = PetClone:WaitForChild("m")
		VPFCam.CFrame = CFrame.new(mainPart.Position - Vector3.new(3 + (mainPart.Size.Y/2)/math.tan(math.rad(35)), 0, 0), mainPart.Position)
		VPF.Parent:WaitForChild("Multiplier").Text = "x"..petInRep:GetAttribute("Multi")
	else
		warn("pet not found in rep")
		
	end
end)