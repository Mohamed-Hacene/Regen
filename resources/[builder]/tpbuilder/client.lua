local ESX = nil
local infoMarker = {}
local allMarkersInServer = {}
local vehEnter = false
local options = {"Oui", "Non"}
local ItemSelected = 1
infoMarker.vehEnter = vehEnter
local rightLabels = {"--", "--", "--", "--", "--"}

Citizen.CreateThread(function()
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	while ESX == nil do Citizen.Wait(100) end
end)

local function rMarkerBuilderKeyboard(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end

local function menuMarkerBuilder()
    local menuP = RageUI.CreateMenu("OG teleport", Config.subTitle)
    local menuS = RageUI.CreateSubMenu(menuP, "Gestion des tp", Config.subTitle)
    RageUI.Visible(menuP, not RageUI.Visible(menuP))

    while menuP do
        Citizen.Wait(0)

        RageUI.IsVisible(menuP, true, true, true, function()

            RageUI.Separator("~b~Créer un tp")

            RageUI.ButtonWithStyle("Nom du tp:", "Appuyez sur ~y~[E]~s~ ", {RightLabel = rightLabels[1]}, true, function(_, _, s)
                if s then
                    local result = rMarkerBuilderKeyboard("Entrez le nom du tp", "", 50)
                    if result ~= nil then
                        infoMarker.name = result
                        ESX.ShowNotification("Vous avez choisi le nom du tp.")
                        rightLabels[1] = result
                    else
                        ESX.ShowNotification("Vous avez mis un texte invalide !")
                    end
                end
            end)

            RageUI.ButtonWithStyle("Coordonnées du premier tp:", nil, {RightLabel = rightLabels[2]}, true, function(_, _, s)
                if s then
                    infoMarker.coordsenter = GetEntityCoords(GetPlayerPed(-1))
                    ESX.ShowNotification("Vous avez choisi les coordonnées du point d'entrée.")
                    rightLabels[2] = "~g~OK"
                end
            end)

            RageUI.ButtonWithStyle("Texte du premier tp:", "Appuyez sur ~y~[E]~s~ ", {RightLabel = rightLabels[3]}, true, function(_, _, s)
                if s then
                    local result = rMarkerBuilderKeyboard("Entrez le texte du tp", "", 50)
                    if result ~= nil then
                        infoMarker.textenter = result
                        ESX.ShowNotification("Vous avez choisi le texte du point d'entrée.")
                        rightLabels[3] = result
                    else
                        ESX.ShowNotification("Vous avez mis un texte invalide !")
                    end
                end
            end)

            RageUI.ButtonWithStyle("Coordonnées du second tp:", nil, {RightLabel = rightLabels[4]}, true, function(_, _, s)
                if s then
                    infoMarker.coordsexit = GetEntityCoords(GetPlayerPed(-1))
                    ESX.ShowNotification("Vous avez choisi les coordonnées du point de sortie.")
                    rightLabels[4] = "~g~OK"
                end
            end)

            RageUI.ButtonWithStyle("Texte du second tp:", "Appuyez sur ~y~[E]~s~ ", {RightLabel = rightLabels[5]}, true, function(_, _, s)
                if s then
                    local result = rMarkerBuilderKeyboard("Entrez le texte du tp", "", 50)
                    if result ~= nil then
                        infoMarker.textexit = result
                        ESX.ShowNotification("Vous avez choisi le texte du point de sortie.")
                        rightLabels[5] = result
                    else
                        ESX.ShowNotification("Vous avez mis un texte invalide !")
                    end
                end
            end)


            RageUI.Checkbox("Autoriser/Refuser l'accès au véhicule",nil, vehEnter,{},function(Hovered,Ative,Selected,Checked)
                if Selected then
                    vehEnter = Checked
                    if Checked then
                        infoMarker.vehEnter = true
                        ESX.ShowNotification("Vous avez autorisé l'accès au véhicule.")
                    else
                        infoMarker.vehEnter = false
                        ESX.ShowNotification("Vous avez refusé l'accès au véhicule.")
                    end
                end
            end)
            
            RageUI.ButtonWithStyle("~g~Créer la tp", nil, {RightLabel = "→→→"}, true, function(_, _, s)
                if s then
                    if infoMarker.coordsenter == nil then
                        ESX.ShowNotification("Vous avez laissé le nom vide.")
                    elseif infoMarker.textenter == nil then
                        ESX.ShowNotification("Vous avez laissé les coordonnées vides.")
                    elseif infoMarker.coordsexit == nil then
                        ESX.ShowNotification("Vous avez laissé le type de blips vide.")
                    elseif infoMarker.textexit == nil then
                        ESX.ShowNotification("Vous avez laissé la couleur de blips vide.")
                    else
                        TriggerServerEvent("rMarkerBuilder:createMarker", infoMarker)
                        refreshTable()
                    end
                end
            end)

            RageUI.ButtonWithStyle("~o~Effacer", nil, {RightLabel = "→→→"}, true, function(_, _, s)
                if s then
                    refreshTable()
                end
            end)

            RageUI.ButtonWithStyle("~r~Quitter", nil, {RightLabel = "→→→"}, true, function(_, _, s)
                if s then
                    RageUI.CloseAll()
                    refreshTable()
                end
            end)


            RageUI.Line()

            RageUI.ButtonWithStyle("~b~Gestion des tp", nil, {}, true, function(_, _, s)
                if s then
                    getAllMarkers()
                end
            end, menuS)

        end)

        RageUI.IsVisible(menuS, true, true, true, function()

            RageUI.Separator("~b~Gestion des tp")

            for k,v in pairs(allMarkersInServer) do
                RageUI.ButtonWithStyle("tp : "..v.name, "Texte tp 1 : "..v.textenter.."\nTexte tp 2 : "..v.textexit, {}, true, function(_, _, s)
                    if s then
                        TriggerServerEvent("rMarkerBuilder:deleteMarker", v.id)
                        getAllMarkers()
                    end
                end)
            end

        end)

        if not RageUI.Visible(menuP) and not RageUI.Visible(menuS) then
            menuP = RMenu:DeleteType("menuP", true)
        end
    end
end

RegisterCommand("tpbuilder", function()
    ESX.TriggerServerCallback('rMarkerBuilder:getPlayerGroup', function(result)
        if result == "admin" or result == "superadmin" then
            menuMarkerBuilder()
        else
            ESX.ShowNotification("Vous n'avez pas les droits pour utiliser cette commande.")
        end
    end)
end)

function getAllMarkers()
    ESX.TriggerServerCallback('rMarkerBuilder:getAllMarkers', function(result)
        allMarkersInServer = result
    end)
end


---- Entrée/Sortie


Citizen.CreateThread(function()
    ESX.TriggerServerCallback('rMarkerBuilder:getAllMarkers', function(result)
            while true do
                local Timer = 500
                for k,v in pairs(result) do
                local plyPos = GetEntityCoords(PlayerPedId())
                local pos = vector3(json.decode(v.coordsenter).x, json.decode(v.coordsenter).y, json.decode(v.coordsenter).z)
                local exit = vector3(json.decode(v.coordsexit).x, json.decode(v.coordsexit).y, json.decode(v.coordsexit).z)
                local dist = #(plyPos-pos)
                if dist <= 3.0 then
                    Timer = 0
                    DrawMarker(25, pos - vector3(0, 0, 0.98), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 46, 193, 134, 178, false, false, false, false)
                end
                if dist <= 1.0 then
                    Timer = 0
                        RageUI.Text({ message = "Appuyez sur ~y~[E]~s~ "..v.textenter, time_display = 1 })
                    if IsControlJustPressed(1,51) then
                        if v.vehEnter == true then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                teleportPedAndVeh(exit - vector3(0, 0, 0.98), GetVehiclePedIsIn(PlayerPedId(), false))
                            else
                                teleportPed(exit - vector3(0, 0, 0.98))
                            end
                        else
                            teleportPed(exit - vector3(0, 0, 0.98))
                        end
                    end
                end
            end
            Citizen.Wait(Timer)
        end
    end)
end)


Citizen.CreateThread(function()
    ESX.TriggerServerCallback('rMarkerBuilder:getAllMarkers', function(result2)
            while true do
                local Timer = 500
                for k2,v2 in pairs(result2) do
                local plyPos = GetEntityCoords(PlayerPedId())
                local pos2 = vector3(json.decode(v2.coordsexit).x, json.decode(v2.coordsexit).y, json.decode(v2.coordsexit).z)
                local enter = vector3(json.decode(v2.coordsenter).x, json.decode(v2.coordsenter).y, json.decode(v2.coordsenter).z)
                local dist = #(plyPos-pos2)
                if dist <= 3.0 then
                    Timer = 0
                    DrawMarker(25, pos2 - vector3(0, 0, 0.98), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 46, 193, 134, 178, false, false, false, false)
                end
                if dist <= 1.0 then
                    Timer = 0
                        RageUI.Text({ message = "Appuyez sur ~y~[E]~s~ "..v2.textexit, time_display = 1 })
                    if IsControlJustPressed(1,51) then
                        if v2.vehEnter == true then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                teleportPedAndVeh(enter - vector3(0, 0, 0.98), GetVehiclePedIsIn(PlayerPedId(), false))
                            else
                                teleportPed(enter - vector3(0, 0, 0.98))
                            end
                        else
                            teleportPed(enter - vector3(0, 0, 0.98))
                        end
                    end
                end
            end
            Citizen.Wait(Timer)
        end
    end)
end)


function teleportPed(coords)
    local playerPed = PlayerPedId()
	SetEntityCoords(playerPed, coords.x, coords.y, coords.z)
end

function teleportPedAndVeh(coords, veh)
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, coords.x, coords.y, coords.z)
    SetEntityCoords(veh, coords.x, coords.y, coords.z)
    SetPedIntoVehicle(PlayerPedId(), veh, -1)
end

function refreshTable()
    infoMarker = {}
    vehEnter = false
    rightLabels = {"--", "--", "--", "--", "--"}
end