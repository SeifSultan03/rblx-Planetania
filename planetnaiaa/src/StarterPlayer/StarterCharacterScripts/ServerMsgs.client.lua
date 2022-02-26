local MessageEvent = game:WaitForChild("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ServerTextEvent")

MessageEvent.OnClientEvent:Connect(function(msg)
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = msg;
		Font = Enum.Font.GothamBold;
		Color = Color3.new(1, 0, 0);
		FontSize = Enum.FontSize.Size60
	})
end)