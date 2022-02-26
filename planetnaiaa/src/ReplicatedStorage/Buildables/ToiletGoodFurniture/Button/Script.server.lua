--Script created by smeets0000
--You can change the SoundID  in the Sound Properties
local sound = script.Parent.Sound

function playsound()
	sound:play()
end

script.Parent.ClickDetector.MouseClick:connect(playsound)

