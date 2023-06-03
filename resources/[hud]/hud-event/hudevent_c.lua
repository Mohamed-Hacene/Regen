RegisterNetEvent('hud:DisplayHelp')
AddEventHandler('hud:DisplayHelp', function(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end)

RegisterNetEvent('hud:NotifColor')
AddEventHandler('hud:NotifColor', function(txt,color)
    txt=tostring(txt)
    SetNotificationTextEntry('STRING')
    Citizen.InvokeNative(0x92F0DA1E27DB96DC , color)
    AddTextComponentString(txt)
    DrawNotification(false, false)    
end)

RegisterNetEvent('hud:Notif')
AddEventHandler('hud:Notif', function(txt)
    txt=tostring(txt)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(txt)
    DrawNotification(false, true)    
end)

RegisterNetEvent("hud:NotifIcon")
    AddEventHandler("hud:NotifIcon", function(icon, type, sender, title, text)
      Citizen.CreateThread(function()
        Wait(1)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(text)
        SetNotificationMessage(icon, icon, true, type, sender, title, text)
        DrawNotification(false, true)
      end)
    end)

local Notif = {}
RegisterNetEvent("hud:NotifKey")
AddEventHandler("hud:NotifKey", function(icon,text)
    Citizen.CreateThread(function()
        Wait(1)
        SetNotificationTextEntry("STRING")
        local Notification = Citizen.InvokeNative(0xDD6CB2CCE7C2735C,1,icon,text)
        table.insert(Notif,Notification)
    end)
end)

RegisterNetEvent('hud:NotifDel')
AddEventHandler('hud:NotifDel', function()
    for a,v in pairs(Notif) do
        RemoveNotification(v)
    end
    Notif = {}
end)

RegisterNetEvent('hud:Marker')
AddEventHandler('hud:Marker',function(x,y,z,taille,r,g,b,apparence,hauteur,rotation)
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
end)

RegisterNetEvent('CNN:Annonce')
AddEventHandler('CNN:Annonce',function(institut,message)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'news', 0.6)
    local timereset = 10000
    local timer = GetGameTimer()
    while GetGameTimer() - timer < timereset do
        Wait(0)
        Title(institut)
        Title2("breaking news")
        Content(message)
        DrawRect(0.5,0.225,1.0,0.15, 0, 0, 0, 150)                   
    end
end)

function Title(titre)
	SetTextFont(1)
	SetTextProportional(0)
	SetTextScale(1.0, 1.0)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(titre)
	DrawText(0.5, 0.12)
end

function Title2(titre)
	SetTextFont(7)
	SetTextProportional(0)
	SetTextScale(0.6, 0.6)
	SetTextColour(10, 235, 10, 255)
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(titre)
	DrawText(0.5, 0.17)
end

function Content(titre)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(0.6, 0.6)
	SetTextColour(255, 255, 255, 200)
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(titre)
	DrawText(0.5, 0.22)
end

--------------- BUTTON indication ---------------

local Ibuttons = nil
RegisterNetEvent('hud:SetButton')
AddEventHandler('hud:SetButton', function(buttons, layout) --Layout: 0 - Horizontal, 1 - vertical
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
end)

RegisterNetEvent('hud:RenderButton')
AddEventHandler('hud:RenderButton',function()
	if HasScaleformMovieLoaded(Ibuttons) then
		DrawScaleformMovie(Ibuttons, 0.5, 0.5, 1.0, 1.0, 255, 255, 255, 255)
	end
end)