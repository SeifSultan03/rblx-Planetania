local Part = script.Parent
function onClicked()
script.Parent.BrickColor = BrickColor.Yellow()
script.Parent.Material = Enum.Material.Neon
script.Parent.Transparency = 0.55
wait(15.7)
script.Parent.BrickColor = BrickColor.Black()
script.Parent.Material = Enum.Material.Plastic
script.Parent.Transparency = 0.5
end

script.Parent.ClickDetector.MouseClick:connect(onClicked)