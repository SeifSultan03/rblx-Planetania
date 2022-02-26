Brick = script.Parent
Sound = Brick.Sound

function onClicked()
Sound:Play()
end

script.Parent.ClickDetector.MouseClick:connect(onClicked)
