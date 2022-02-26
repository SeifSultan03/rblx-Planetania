for i, v in pairs(script.Parent.Parent.Coins:GetChildren()) do
	for i, v in pairs(v:GetChildren()) do
		v:Destroy()
	end
	local clone = script.Parent.GiveCoin:Clone()
	clone.Parent = v 
end
