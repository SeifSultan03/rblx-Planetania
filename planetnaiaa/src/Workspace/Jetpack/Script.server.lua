script.Parent.Activated:Connect(function()
	script.Parent.Handle.JetpackThrust.MaxForce = Vector3.new(0,math.huge,0)
end)

script.Parent.Deactivated:Connect(function()
	script.Parent.Handle.JetpackThrust.MaxForce = Vector3.new(0,0,0)
end)