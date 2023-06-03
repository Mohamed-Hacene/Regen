function DisplayHelp(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function Marker(x,y,z,taille,r,g,b,apparence,hauteur,rotation)
    if hauteur == nil then
        hauteur = taille
    end
    if rotation == nil then
        rotation = 0
    end
    if apparence == nil then
        DrawMarker(27, x, y, z + 0.05, 0, 0, 0, 0, 0, rotation, taille, taille, hauteur, r, g,b, 150, 0, 0, 0,0)    
    else
        DrawMarker(apparence,  x, y, z + 0.1, 0, 0, 0, 0, 0,  rotation, taille, taille, hauteur, r, g,b, 150, 0, 0, 0,0)
    end
end

--------------- BUTTON indication ---------------

local Ibuttons = nil
function SetButton(buttons, layout) --Layout: 0 - Horizontal, 1 - vertical
	if not HasScaleformMovieLoaded(Ibuttons) then
		Ibuttons = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
		while not HasScaleformMovieLoaded(Ibuttons) do
	       Citizen.Wait(0)
	   end
	end
	local sf = Ibuttons
	local w,h = GetScreenResolution()
	PushScaleformMovieFunction(sf,"INSTRUCTIONAL_BUTTONS")
	PopScaleformMovieFunction()
	PushScaleformMovieFunction(sf,"SET_DISPLAY_CONFIG")
	PushScaleformMovieFunctionParameterInt(w)
	PushScaleformMovieFunctionParameterInt(h)
	PushScaleformMovieFunctionParameterFloat(0.02)
	PushScaleformMovieFunctionParameterFloat(0.98)
	PushScaleformMovieFunctionParameterFloat(0.02)
	PushScaleformMovieFunctionParameterFloat(0.98)
	PushScaleformMovieFunctionParameterBool(true)
	PushScaleformMovieFunctionParameterBool(false)
	PushScaleformMovieFunctionParameterBool(false)
	PushScaleformMovieFunctionParameterInt(w)
	PushScaleformMovieFunctionParameterInt(h)
	PopScaleformMovieFunction()
	PushScaleformMovieFunction(sf,"SET_MAX_WIDTH")
	PushScaleformMovieFunctionParameterInt(1)
	PopScaleformMovieFunction()
		
	for i,btn in pairs(buttons) do
		PushScaleformMovieFunction(sf,"SET_DATA_SLOT")
		PushScaleformMovieFunctionParameterInt(i-1)
		PushScaleformMovieFunctionParameterString(btn[1])
		PushScaleformMovieFunctionParameterString(btn[2])
		PopScaleformMovieFunction()
	end
	if layout ~= 1 then
		PushScaleformMovieFunction(sf,"SET_PADDING")
		PushScaleformMovieFunctionParameterInt(10)
		PopScaleformMovieFunction()
	end
	PushScaleformMovieFunction(sf,"DRAW_INSTRUCTIONAL_BUTTONS")
	PushScaleformMovieFunctionParameterInt(layout)
	PopScaleformMovieFunction()
end

function RenderButton()
	if HasScaleformMovieLoaded(Ibuttons) then
		DrawScaleformMovie(Ibuttons, 0.5, 0.5, 1.0, 1.0, 255, 255, 255, 255)
	end
end