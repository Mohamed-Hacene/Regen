--[[
##################
#    Oskarr      #
#    MysticRP    #
#   client.lua   #
#      2017      #
##################
--]]
local jobId=-1
local isInServiceTaxi = false -- don't edit
local caution = false -- don't edit
local cautionprice = 0 -- caution price for service vehicle
local taxiplatee = "TAXITAXI" -- Plate for service vehicle
local taximodel = GetHashKey('taxi') -- Model for service car
local taxijob = 5 -- JobID for taxi
local useModelMenu = true -- set to true if you use https://forum.fivem.net/t/release-async-model-menu-v2-6-17-6/19999
local useVdkCall = true -- If you use VDK Call https://forum.fivem.net/t/release-1-0-call-services-system/20384
local openMenuKey = 166 -- (G) Key for OPEN TAXI MENU 
local emplacement = {
{name="Entreprise Taxi", id=56, colour=81, x=895.90020751953, y=-178.72854614258, z=74.700271606445},
}
local JobTaxi = {14,5}
onJob = 0

---- THREADS ----

RegisterNetEvent('recolt:updateJobs')
AddEventHandler('recolt:updateJobs', function(newjob)
    jobId = newjob
    for _,job in pairs(JobTaxi) do
        if jobId == job then
            BoucleJob()
            break
        end
    end
end)

local function TestBonJob()
    for _,job in pairs(JobTaxi) do
        if jobId == job then
            return true
        end
    end
    return false
end


-- Service
function BoucleJob()
    Citizen.CreateThread(function()
        VMenu.AddMenu( 'Taxi', 'Taxi',255,165,1)  
        local x = 893.65747070313
        local y = -162.29484558105
        local z = 76.891159057617
        while TestBonJob() do
            Citizen.Wait(1)
            local playerPos = GetEntityCoords(GetPlayerPed(-1), true)
            x = 893.65747070313
            y = -162.29484558105
            z = 76.891159057617
            if (Vdist(playerPos.x, playerPos.y, playerPos.z, x, y, z) < 100.0) then
                if (Vdist(playerPos.x, playerPos.y, playerPos.z, x, y, z) < 2.0) then
                    if isInServiceTaxi then
                        DrawMarker(25, x, y, z - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 193, 46, 46, 178, false, false, false, false)
                        DisplayHelpText('Appuyez sur ~INPUT_CONTEXT~ pour ~r~stopper~s~ votre service') 
                    else
                        DrawMarker(25, x, y, z - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 46, 193, 46, 178, false, false, false, false)
                        DisplayHelpText('Appuyez sur ~INPUT_CONTEXT~ pour ~g~prendre~s~ votre service')
                    end
                    if (IsControlJustReleased(1, 51)) then 
                         GetService()
                    end
                end
            end
            if isInServiceTaxi then
                x = 897.34881591797
                y = -152.49554443359
                z = 76.55834197998
                if (Vdist(playerPos.x, playerPos.y, playerPos.z, x, y, z) < 100.0) then
                    DrawMarker(36, x, y, z, 0, 0, 0, 50, 50, 50, 2.0001, 2.0001, 2.0001, 255, 165, 0,165, 0, 0, 0,0)
                    if (Vdist(playerPos.x, playerPos.y, playerPos.z, x, y, z) < 4.0) then
                        local ply = GetPlayerPed(-1)
                        if IsPedInAnyVehicle(ply, true) then
                            DisplayHelpText('Appuyez sur ~INPUT_CONTEXT~ pour ~r~ranger~s~ votre ~b~taxi')
                            if (IsControlJustReleased(1, 51)) then 
                                local vehicle = GetVehiclePedIsIn(ply, true)
                                local isVehicleTaxi = IsVehicleModel(vehicle, taximodel)
                                local isTaxiPlate = GetVehicleNumberPlateText(vehicle)
                                if isVehicleTaxi then
                                    DeleteTaxi()
                                    caution = false
                                else
                                    Notify("~r~Ce n'est pas un taxi !")
                                end
                            end
                        else						
                            DisplayHelpText('Appuyez sur ~INPUT_CONTEXT~ pour ~b~sortir~s~ un ~b~taxi')
                            if (IsControlJustReleased(1, 51)) then 
                                Taxi()
                                caution = true
                            end
                        end
                    end
                end
                if IsControlJustPressed(1, openMenuKey) then 
                    if not VMenu.visible then TriggerEvent('VMenu.CloseAll') end
                    VMenu.curItem = 1
                    TaxiMenu() 
                    VMenu.visible = not VMenu.visible
                end
                VMenu.Show()
            end
        end
    end)
end



---- FONCTIONS ----

function Notify(text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

---------------------------

function Taxi()
	Citizen.Wait(0)
	local ped = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = taximodel

	RequestModel(vehicle)

	while not HasModelLoaded(vehicle) do
		Wait(1)
	end
	--local plate = math.random(300, 900)
	local spawned_car = CreateVehicle(vehicle, 897.34881591797, -152.49554443359, 76.55834197998, 326.194213, true, false)
	SetVehicleOnGroundProperly(spawned_car)
	--SetVehicleColours(spawned_car, 12, 131)
	--SetVehicleExtraColours(spawned_car, 12, 12)
	SetPedIntoVehicle(ped, spawned_car, - 1)
    local id = NetworkGetNetworkIdFromEntity(spawned_car)
    SetNetworkIdCanMigrate(id, true)
    SetNetworkIdExistsOnAllMachines(id,true)
    --SetEntityAsMissionEntity(spawned_car,true,true)
    SetVehicleHasBeenOwnedByPlayer(spawned_car,true)
end

function DeleteTaxi()
    local ply = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(ply, false)
    Citizen.Wait(1)
    ClearPedTasksImmediately(ply)
    SetEntityVisible(playerVeh, false, 0)
    SetEntityCoords(playerVeh, 999999.0, 999999.0, 999999.0, false, false, false, true)
    FreezeEntityPosition(playerVeh, true)
    SetEntityAsMissionEntity(playerVeh, 1, 1)
    DeleteVehicle(playerVeh)
end


-------
---------


function TaxiMenu() -- TAXI MENU
    VMenu.ResetMenu()
    VMenu.EditHeader('Taxi')
	VMenu.AddFunc("Facture", "facture", nil,"Émettre une facture") 
    if jobId == 14 then
	   VMenu.AddFunc("Recruter un chauffeur", "recruter", nil) 
	   VMenu.AddFunc("Licencier un chauffeur", "licencier", nil) 
    end
    if onJob == 0 then
	   VMenu.AddFunc("Rechercher des clients", "rechercher", nil) 
    else
	   VMenu.AddFunc("Arrêter la recherche", "stoprecherche", nil) 
    end
	VMenu.AddFunc("GPS", "GPSMenu", nil) 
end

function recruter()
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8S", "", "", "", "", "", 20)
    while (UpdateOnscreenKeyboard() == 0) do
	    DisableAllControlActions(0);
		Wait(0);
	end
	if (GetOnscreenKeyboardResult()) then
	    local res = tonumber(GetOnscreenKeyboardResult())
		TriggerServerEvent('commande_metier:recruter',res,5)
    end
end

function licencier()
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8S", "", "", "", "", "", 20)
    while (UpdateOnscreenKeyboard() == 0) do
	    DisableAllControlActions(0);
		Wait(0);
	end
	if (GetOnscreenKeyboardResult()) then
	    local res = tonumber(GetOnscreenKeyboardResult())
		TriggerServerEvent('commande_metier:licencier',res)
    end
end

function GPSMenu() -- FACTURE MENU
    VMenu.ResetMenu()
    VMenu.EditHeader('GPS')
	VMenu.AddFunc("Comissariat", "goC", nil)
	VMenu.AddFunc("Pôle Emploi", "goPO", nil)
    VMenu.AddFunc("Préfecture", "goPF", nil)
    VMenu.AddFunc("Concessionaire", "goCC", nil)		
	VMenu.AddFunc("Fleeca Banque", "goFB", nil)	
	VMenu.AddFunc("Retour", "TaxiMenu", nil)
end

function facture()
    VMenu.visible = false
    TriggerEvent('facture:Open') 
end

function rechercher()
    VMenu.visible = false
    StartJob(1)
end

function stoprecherche()
    VMenu.visible = false
    StopJob(1)
end
--------------- GPS COORDS
function goC(x, y, z)
x = 425.130
y = -979.558
z = 30.711
BLIPP = AddBlipForCoord(x, y, z)
SetBlipSprite(BLIPP, 2)
SetNewWaypoint(x, y)
end
function goPO(x, y, z)
x = -234.164
y = -979.708
z = 29.2826
BLIPP = AddBlipForCoord(x, y, z)
SetBlipSprite(BLIPP, 2)
SetNewWaypoint(x, y)
end
function goCC(x, y, z)
x = -47.4288
y = -1112.52
z = 26.436
BLIPP = AddBlipForCoord(x, y, z)
SetBlipSprite(BLIPP, 2)
SetNewWaypoint(x, y)
end
function goPF(x, y, z)
x = 162.186
y = -441.774
z = 40.9113
BLIPP = AddBlipForCoord(x, y, z)
SetBlipSprite(BLIPP, 2)
SetNewWaypoint(x, y)
end
function goFB(x, y, z)
x = 152.32469177246
y = -1030.0135498047
z = 29.185220718384
BLIPP = AddBlipForCoord(x, y, z)
SetBlipSprite(BLIPP, 2)
SetNewWaypoint(x, y)
end
--------------------------

RegisterNetEvent('taxi:cl_setJobId')
AddEventHandler('taxi:cl_setJobId',
	function(p_jobId)
		jobId = p_jobId
		GetService()
	end
)


function GetService()
if jobId ~= taxijob and jobId ~= 14 then
 Notify("~y~Tu n'est pas chauffeur de taxi !") 
		return
end
	if isInServiceTaxi then
		Notify("Vous avez ~r~fini~s~ votre service") 
		if (useModelMenu == true) then
		TriggerServerEvent("mm:spawn2") 
		end
		TriggerServerEvent('taxi:sv_setService', 0) 
		if (useVdkCall == true) then
		TriggerServerEvent("player:serviceOff", "taxi") 
		end
	else 
		Notify("~g~Vous êtes en service !") 
		TriggerServerEvent('taxi:sv_setService', 1) 
		if (useVdkCall == true) then
		TriggerServerEvent("player:serviceOn", "taxi") 
		end
	end
	
	isInServiceTaxi = not isInServiceTaxi
-- Here for any clothes with SetPedComponentVariation ... 
end



-- Copy/paste from fs_freeroam (by FiveM-Script : https://forum.fivem.net/t/alpha-fs-freeroam-0-1-4-fivem-scripts/14097)
RegisterNetEvent("taxi:notify")
AddEventHandler("taxi:notify", function(icon, type, sender, title, text)
    Citizen.CreateThread(function()
		Wait(1)
		SetNotificationTextEntry("STRING");
		AddTextComponentString(text);
		SetNotificationMessage(icon, icon, true, type, sender, title, text);
		DrawNotification(false, true);
    end)
end)

-- Show blip
Citizen.CreateThread(function()
    for _, item in pairs(emplacement) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipColour(item.blip, item.colour)
      SetBlipAsShortRange(item.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end
end)


------------------ DONT EDIT
function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)

	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end

	return closestPlayer, closestDistance
end

function GetPlayers()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

-----------------------
----- AUTO MISSION ----
-----------------------


onJob = 0
local player = PlayerId()

-- Configure the coordinates where the taxi cabs should be placed.
local cabs = {
   { hash=0xC703DB5F, x=918.592, y=-166.732, z=74.250, a=100.938 },
   { hash=0xC703DB5F, x=917.207, y=-171.100, z=74.489, a=85.422 },
  }

	-- Configure the coordinates where the taxi cabs should be placed.
local peds = {
  {type=4, hash=0xe52e126c, x=894.422, y=-182.196, z=74.700, a=269.449},
  {type=4, hash=0xe52e126c, x=895.422, y=-180.234, z=74.700, a=260.402},
  {type=4, hash=0xe52e126c, x=900.742, y=-174.138, z=73.936, a=265.213},
  }


jobs = {peds = {}, flag = {}, blip = {}, cars = {}, coords = {cx={}, cy={}, cz={}}}

function StartJob(_job)
	if _job == 1 then -- taxi
		onJob = _job
		showLoadingPromt("Chargement mission taxi", 2000, 3)
		jobs.coords.cx[1],jobs.coords.cy[1],jobs.coords.cz[1] = 293.476,-590.163,42.7371
		jobs.coords.cx[2],jobs.coords.cy[2],jobs.coords.cz[2] = 253.404,-375.86,44.0819
		jobs.coords.cx[3],jobs.coords.cy[3],jobs.coords.cz[3] = 120.808,-300.416,45.1399
		jobs.coords.cx[4],jobs.coords.cy[4],jobs.coords.cz[4] = -38.4132,-381.576,38.3456
		jobs.coords.cx[5],jobs.coords.cy[5],jobs.coords.cz[5] = -107.442,-614.377,35.6703
		jobs.coords.cx[6],jobs.coords.cy[6],jobs.coords.cz[6] = -252.292,-856.474,30.5626
		jobs.coords.cx[7],jobs.coords.cy[7],jobs.coords.cz[7] = -236.138,-988.382,28.7749
		jobs.coords.cx[8],jobs.coords.cy[8],jobs.coords.cz[8] = -276.989,-1061.18,25.6853
		jobs.coords.cx[9],jobs.coords.cy[9],jobs.coords.cz[9] = -576.451,-998.989,21.785
		jobs.coords.cx[10],jobs.coords.cy[10],jobs.coords.cz[10] = -602.798,-952.63,21.6353
		jobs.coords.cx[11],jobs.coords.cy[11],jobs.coords.cz[11] = -790.653,-961.855,14.8932
		jobs.coords.cx[12],jobs.coords.cy[12],jobs.coords.cz[12] = -912.588,-864.756,15.0057
		jobs.coords.cx[13],jobs.coords.cy[13],jobs.coords.cz[13] = -1069.77,-792.513,18.8075
		jobs.coords.cx[14],jobs.coords.cy[14],jobs.coords.cz[14] = -1306.94,-854.085,15.0959
		jobs.coords.cx[15],jobs.coords.cy[15],jobs.coords.cz[15] = -1468.51,-681.363,26.178
		jobs.coords.cx[16],jobs.coords.cy[16],jobs.coords.cz[16] = -1380.89,-452.7,34.0843
		jobs.coords.cx[17],jobs.coords.cy[17],jobs.coords.cz[17] = -1326.35,-394.81,36.0632
		jobs.coords.cx[18],jobs.coords.cy[18],jobs.coords.cz[18] = -1383.68,-269.985,42.4878
		jobs.coords.cx[19],jobs.coords.cy[19],jobs.coords.cz[19] = -1679.61,-457.339,39.4048
		jobs.coords.cx[20],jobs.coords.cy[20],jobs.coords.cz[20] = -1812.45,-416.917,43.6734
		jobs.coords.cx[21],jobs.coords.cy[21],jobs.coords.cz[21] = -2043.64,-268.291,22.9927
		jobs.coords.cx[22],jobs.coords.cy[22],jobs.coords.cz[22] = -2186.45,-421.595,12.6776
		jobs.coords.cx[23],jobs.coords.cy[23],jobs.coords.cz[23] = -1862.08,-586.528,11.1747
		jobs.coords.cx[24],jobs.coords.cy[24],jobs.coords.cz[24] = -1859.5,-617.563,10.8788
		jobs.coords.cx[25],jobs.coords.cy[25],jobs.coords.cz[25] = -1634.95,-988.302,12.6241
		jobs.coords.cx[26],jobs.coords.cy[26],jobs.coords.cz[26] = -1283.99,-1154.16,5.30998
		jobs.coords.cx[27],jobs.coords.cy[27],jobs.coords.cz[27] = -1126.47,-1338.08,4.63434
		jobs.coords.cx[28],jobs.coords.cy[28],jobs.coords.cz[28] = -867.907,-1159.67,5.00795
		jobs.coords.cx[29],jobs.coords.cy[29],jobs.coords.cz[29] = -847.55,-1141.38,6.27591
		jobs.coords.cx[30],jobs.coords.cy[30],jobs.coords.cz[30] = -722.625,-1144.6,10.2176
		jobs.coords.cx[31],jobs.coords.cy[31],jobs.coords.cz[31] = -575.503,-318.446,34.5273
		jobs.coords.cx[32],jobs.coords.cy[32],jobs.coords.cz[32] = -592.309,-224.853,36.1209
		jobs.coords.cx[33],jobs.coords.cy[33],jobs.coords.cz[33] = -559.594,-162.873,37.7547
		jobs.coords.cx[34],jobs.coords.cy[34],jobs.coords.cz[34] = -534.992,-65.6695,40.634
		jobs.coords.cx[35],jobs.coords.cy[35],jobs.coords.cz[35] = -758.234,-36.6906,37.2911
		jobs.coords.cx[36],jobs.coords.cy[36],jobs.coords.cz[36] = -1375.88,20.9516,53.2255
		jobs.coords.cx[37],jobs.coords.cy[37],jobs.coords.cz[37] = -1320.25,-128.018,48.097
		jobs.coords.cx[38],jobs.coords.cy[38],jobs.coords.cz[38] = -1285.71,294.287,64.4619
		jobs.coords.cx[39],jobs.coords.cy[39],jobs.coords.cz[39] = -1245.67,386.533,75.0908
		jobs.coords.cx[40],jobs.coords.cy[40],jobs.coords.cz[40] = -760.355,285.015,85.0667
		jobs.coords.cx[41],jobs.coords.cy[41],jobs.coords.cz[41] = -626.786,254.146,81.0964
		jobs.coords.cx[42],jobs.coords.cy[42],jobs.coords.cz[42] = -563.609,267.962,82.5116
		jobs.coords.cx[43],jobs.coords.cy[43],jobs.coords.cz[43] = -486.806,271.977,82.8187
		jobs.coords.cx[44],jobs.coords.cy[44],jobs.coords.cz[44] = 88.295,250.867,108.188
		jobs.coords.cx[45],jobs.coords.cy[45],jobs.coords.cz[45] = 234.087,344.678,105.018
		jobs.coords.cx[46],jobs.coords.cy[46],jobs.coords.cz[46] = 434.963,96.707,99.1713
		jobs.coords.cx[47],jobs.coords.cy[47],jobs.coords.cz[47] = 482.617,-142.533,58.1936
		jobs.coords.cx[48],jobs.coords.cy[48],jobs.coords.cz[48] = 762.651,-786.55,25.8915
		jobs.coords.cx[49],jobs.coords.cy[49],jobs.coords.cz[49] = 809.06,-1290.8,25.7946
		jobs.coords.cx[50],jobs.coords.cy[50],jobs.coords.cz[50] = 490.819,-1751.37,28.0987
		jobs.coords.cx[51],jobs.coords.cy[51],jobs.coords.cz[51] = 432.351,-1856.11,27.0352
		jobs.coords.cx[52],jobs.coords.cy[52],jobs.coords.cz[52] = 164.348,-1734.54,28.8982
		jobs.coords.cx[53],jobs.coords.cy[53],jobs.coords.cz[53] = -57.6909,-1501.4,31.1084
		jobs.coords.cx[54],jobs.coords.cy[54],jobs.coords.cz[54] = 52.2241,-1566.65,29.006
		jobs.coords.cx[55],jobs.coords.cy[55],jobs.coords.cz[55] = 310.222,-1376.76,31.4442
		jobs.coords.cx[56],jobs.coords.cy[56],jobs.coords.cz[56] = 181.967,-1332.79,28.8773
		jobs.coords.cx[57],jobs.coords.cy[57],jobs.coords.cz[57] = -74.6091,-1100.64,25.738
		jobs.coords.cx[58],jobs.coords.cy[58],jobs.coords.cz[58] = -887.045,-2187.46,8.13248
		jobs.coords.cx[59],jobs.coords.cy[59],jobs.coords.cz[59] = -749.584,-2296.59,12.4627
		jobs.coords.cx[60],jobs.coords.cy[60],jobs.coords.cz[60] = -1064.83,-2560.66,19.6811
		jobs.coords.cx[61],jobs.coords.cy[61],jobs.coords.cz[61] = -1033.44,-2730.24,19.6868
		jobs.coords.cx[62],jobs.coords.cy[62],jobs.coords.cz[62] = -1018.67,-2732,13.2687
		jobs.coords.cx[63],jobs.coords.cy[63],jobs.coords.cz[63] = 797.354,-174.423,72.708
		jobs.coords.cx[64],jobs.coords.cy[64],jobs.coords.cz[64] = 508.156, -117.908, 60.780
		jobs.coords.cx[65],jobs.coords.cy[65],jobs.coords.cz[65] = 159.458, -27.555, 67.380
		jobs.coords.cx[66],jobs.coords.cy[66],jobs.coords.cz[66] = -36.382, -106.912, 56.982
		jobs.coords.cx[67],jobs.coords.cy[67],jobs.coords.cz[67] = -355.801, -270.404, 33.011
        jobs.coords.cx[68],jobs.coords.cy[68],jobs.coords.cz[68] = -831.196, -76.871, 37.323
        jobs.coords.cx[69],jobs.coords.cy[69],jobs.coords.cz[69] = -1038.707, -214.593, 37,437
		jobs.coords.cx[70],jobs.coords.cy[70],jobs.coords.cz[70] = 1918.448, 3691.410, 32.261
		jobs.coords.cx[71],jobs.coords.cy[71],jobs.coords.cz[71] = 1820.217, 3697.115, 33.493
		jobs.coords.cx[72],jobs.coords.cy[72],jobs.coords.cz[72] = 1619.323, 3827.162, 34.482
		jobs.coords.cx[73],jobs.coords.cy[73],jobs.coords.cz[73] = 1418.628, 3602.243, 34.511
        jobs.coords.cx[74],jobs.coords.cy[74],jobs.coords.cz[74] = 1944.858, 3856.252, 31.741
        jobs.coords.cx[75],jobs.coords.cy[75],jobs.coords.cz[75] = 2285.278, 3839.444, 34.023
        jobs.coords.cx[76],jobs.coords.cy[76],jobs.coords.cz[76] = 2760.945, 3387.813, 55.659
        jobs.coords.cx[77],jobs.coords.cy[77],jobs.coords.cz[77] = 1952.819, 2627.731, 45.368
        jobs.coords.cx[78],jobs.coords.cy[78],jobs.coords.cz[78] = 1051.414, 474.833, 93.653
        jobs.coords.cx[79],jobs.coords.cy[79],jobs.coords.cz[79] = 866.393, 17.635, 78.654
        jobs.coords.cx[80],jobs.coords.cy[80],jobs.coords.cz[80] = 318.985, 167.410, 103.335
        jobs.coords.cx[81],jobs.coords.cy[81],jobs.coords.cz[81] = 88.836, 254.054, 108.236
        jobs.coords.cx[82],jobs.coords.cy[82],jobs.coords.cz[82] = -44.852, 70.414, 72.437
        jobs.coords.cx[83],jobs.coords.cy[83],jobs.coords.cz[83] = -115.496, 84.333, 70.792
        jobs.coords.cx[84],jobs.coords.cy[84],jobs.coords.cz[84] = -384.806, 226.868, 83.548
        jobs.coords.cx[85],jobs.coords.cy[85],jobs.coords.cz[85] = -578.669, 139.085, 61.337
        jobs.coords.cx[86],jobs.coords.cy[86],jobs.coords.cz[86] = -651.334, -584.879, 34.116
        jobs.coords.cx[87],jobs.coords.cy[87],jobs.coords.cz[87] = -571.847, -1195.648, 17.869
        jobs.coords.cx[88],jobs.coords.cy[88],jobs.coords.cz[88] = -1513.271, -670.039, 28.362
        jobs.coords.cx[89],jobs.coords.cy[89],jobs.coords.cz[89] = -1297.484, -654.913, 26.123
        jobs.coords.cx[90],jobs.coords.cy[90],jobs.coords.cz[90] = -1645.546, 144.571, 61.664
        jobs.coords.cx[91],jobs.coords.cy[91],jobs.coords.cz[91] = -1160.618, 744.418, 154.571
        jobs.coords.cx[92],jobs.coords.cy[92],jobs.coords.cz[92] = -798.090, 831.699, 204.351

		jobs.cars[1] = GetVehiclePedIsUsing(GetPlayerPed(-1))
		jobs.flag[1] = 0
		jobs.flag[2] = 59+GetRandomIntInRange(1, 61)
		Wait(2000)
		DrawMissionText("Roulez pour trouver des ~h~~y~clients~w~.", 10000)
        BoucleMissionInf()
    end
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function DrawMissionText(m_text, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function showLoadingPromt(showText, showTime, showType)
	Citizen.CreateThread(function()
		Citizen.Wait(0)
		N_0xaba17d7ce615adbf("STRING") -- set type
		AddTextComponentString(showText) -- sets the text
		N_0xbd12f8228410d9b4(showType) -- show promt (types = 3)
		Citizen.Wait(showTime) -- show time
		N_0x10d373323e5b9c0d() -- remove promt
	end)
end

function StopJob(jobid)
	if jobid == 1 then
		if DoesEntityExist(jobs.peds[1]) then
			local pedb = GetBlipFromEntity(jobs.peds[1])
			if pedb ~= nil and DoesBlipExist(pedb) then
				SetBlipSprite(pedb, 2)
				SetBlipDisplay(pedb, 3)
			end
			ClearPedTasksImmediately(jobs.peds[1])
			if DoesEntityExist(jobs.cars[1]) and IsVehicleDriveable(jobs.cars[1], 0) then
				if IsPedSittingInVehicle(jobs.peds[1], jobs.cars[1]) then
					TaskLeaveVehicle(jobs.peds[1], jobs.cars[1], 0)
				end
			end
			Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(jobs.peds[1]))
		end
		if jobs.blip[1] ~= nil and DoesBlipExist(jobs.blip[1]) then
			Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(jobs.blip[1]))
			jobs.blip[1] = nil
		end
		onJob = 0
		jobs.cars[1] = nil
		jobs.peds[1] = nil
		jobs.flag[1] = nil
		jobs.flag[2] = nil
	end
end

function BoucleMissionInf()
    Citizen.CreateThread(function()
        while onJob == 1 do
            Wait(0)
            if DoesEntityExist(jobs.cars[1]) and IsVehicleDriveable(jobs.cars[1], 0) then
                if IsPedSittingInVehicle(GetPlayerPed(-1), jobs.cars[1]) then
                    if DoesEntityExist(jobs.peds[1]) then
                        if IsPedFatallyInjured(jobs.peds[1]) then
                            Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(jobs.peds[1]))
                            local pedb = GetBlipFromEntity(jobs.peds[1])
                            if pedb ~= nil and DoesBlipExist(pedb) then
                                SetBlipSprite(pedb, 2)
                                SetBlipDisplay(pedb, 3)
                            end
                            jobs.peds[1] = nil
                            jobs.flag[1] = 0
                            jobs.flag[2] = 59+GetRandomIntInRange(1, 90)
                            if jobs.blip[1] ~= nil and DoesBlipExist(jobs.blip[1]) then
                                Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(jobs.blip[1]))
                                jobs.blip[1] = nil
                            end
                            DrawMissionText("Le client est ~r~mort~w~. Trouvez s'en un autre.", 5000)
                        else
                            if jobs.flag[1] == 1 and jobs.flag[2] > 0 then
                                Wait(1000)
                                jobs.flag[2] = jobs.flag[2]-1
                                if jobs.flag[2] == 0 then
                                    local pedb = GetBlipFromEntity(jobs.peds[1])
                                    if pedb ~= nil and DoesBlipExist(pedb) then
                                        SetBlipSprite(pedb, 2)
                                        SetBlipDisplay(pedb, 3)
                                    end
                                    ClearPedTasksImmediately(jobs.peds[1])
                                    Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(jobs.peds[1]))
                                    jobs.peds[1] = nil
                                    DrawMissionText("Le client est ~r~fatigué d'attendre~w~. Trouvez en un autre.", 5000)
                                    jobs.flag[1] = 0
                                    jobs.flag[2] = 59+GetRandomIntInRange(1, 61)
                                else
                                    if IsPedSittingInVehicle(GetPlayerPed(-1), jobs.cars[1]) then
                                        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(jobs.peds[1]), true) < 8.0001 then
                                            local offs = GetOffsetFromEntityInWorldCoords(GetVehiclePedIsUsing(GetPlayerPed(-1)), 1.5, 0.0, 0.0)
                                            local offs2 = GetOffsetFromEntityInWorldCoords(GetVehiclePedIsUsing(GetPlayerPed(-1)), -1.5, 0.0, 0.0)
                                            if GetDistanceBetweenCoords(offs['x'], offs['y'], offs['z'], GetEntityCoords(jobs.peds[1]), true) < GetDistanceBetweenCoords(offs2['x'], offs2['y'], offs2['z'], GetEntityCoords(jobs.peds[1]), true) then
                                                TaskEnterVehicle(jobs.peds[1], jobs.cars[1], -1, 2, 2.0001, 1)
                                            else
                                                TaskEnterVehicle(jobs.peds[1], jobs.cars[1], -1, 1, 2.0001, 1)
                                            end
                                            jobs.flag[1] = 2
                                            jobs.flag[2] = 30
                                        end
                                    end
                                end
                            end
                            if jobs.flag[1] == 2 and jobs.flag[2] > 0 then
                                Wait(1000)
                                jobs.flag[2] = jobs.flag[2]-1
                                if jobs.flag[2] == 0 then
                                    local pedb = GetBlipFromEntity(jobs.peds[1])
                                    if pedb ~= nil and DoesBlipExist(pedb) then
                                        SetBlipSprite(pedb, 2)
                                        SetBlipDisplay(pedb, 3)
                                    end
                                    ClearPedTasksImmediately(jobs.peds[1])
                                    Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(jobs.peds[1]))
                                    jobs.peds[1] = nil
                                    DrawMissionText("~r~Le client n'est pas avec vous~w~. Trouvez en un autre.", 5000)
                                    jobs.flag[1] = 0
                                    jobs.flag[2] = 59+GetRandomIntInRange(1, 61)
                                else
                                    if IsPedSittingInVehicle(jobs.peds[1], jobs.cars[1]) then
                                        local pedb = GetBlipFromEntity(jobs.peds[1])
                                        if pedb ~= nil and DoesBlipExist(pedb) then
                                            SetBlipSprite(pedb, 2)
                                            SetBlipDisplay(pedb, 3)
                                        end
                                        jobs.flag[1] = 3
                                        jobs.flag[2] = GetRandomIntInRange(1, 62)
                                        local street = table.pack(GetStreetNameAtCoord(jobs.coords.cx[jobs.flag[2]],jobs.coords.cy[jobs.flag[2]],jobs.coords.cz[jobs.flag[2]]))
                                        if street[2] ~= 0 and street[2] ~= nil then
                                            local streetname = string.format("~w~Enmenez moi à ~y~ %s~w~, près de~y~ %s", GetStreetNameFromHashKey(street[1]),GetStreetNameFromHashKey(street[2]))
                                            DrawMissionText(streetname, 5000)
                                        else
                                            local streetname = string.format("~w~Enmenez moi à ~y~ %s", GetStreetNameFromHashKey(street[1]))
                                            DrawMissionText(streetname, 5000)
                                        end
                                        jobs.blip[1] = AddBlipForCoord(jobs.coords.cx[jobs.flag[2]],jobs.coords.cy[jobs.flag[2]],jobs.coords.cz[jobs.flag[2]])
                                        AddTextComponentString(GetStreetNameFromHashKey(street[1]))
                                        N_0x80ead8e2e1d5d52e(jobs.blip[1])
                                        SetBlipRoute(jobs.blip[1], 1)
                                    end
                                end
                            end
                            if jobs.flag[1] == 3 then
                                if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), jobs.coords.cx[jobs.flag[2]],jobs.coords.cy[jobs.flag[2]],jobs.coords.cz[jobs.flag[2]], true) > 4.0001 then
                                    DrawMarker(1, jobs.coords.cx[jobs.flag[2]],jobs.coords.cy[jobs.flag[2]],jobs.coords.cz[jobs.flag[2]]-1.0001, 0, 0, 0, 0, 0, 0, 4.0, 4.0, 2.0, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
                                else
                                    if jobs.blip[1] ~= nil and DoesBlipExist(jobs.blip[1]) then
                                        Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(jobs.blip[1]))
                                        jobs.blip[1] = nil
                                    end
                                    ClearPedTasksImmediately(jobs.peds[1])
                                    TaskLeaveVehicle(jobs.peds[1], jobs.cars[1], 0)
                                    Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(jobs.peds[1]))
                                    jobs.peds[1] = nil
                                    Wait(6000)

                                    local total = math.random(985, 1992);
                                    TriggerEvent('Entreprise:AddVente', tonumber(total))
                                    DrawMissionText("~g~Course terminée!", 5000)
                                    -- pay money on something
                                    Wait(8000)
                                    DrawMissionText("Roulez pour trouver un nouveau ~h~~y~client~w~.", 10000)
                                    jobs.flag[1] = 0
                                    jobs.flag[2] = 59+GetRandomIntInRange(1, 90)
                                end
                            end
                        end
                    else

                        if jobs.flag[1] > 0 then
                            jobs.flag[1] = 0
                            jobs.flag[2] = 59+GetRandomIntInRange(1, 61)
                            DrawMissionText("Roulez pour trouver un nouveau ~h~~y~client~w~.", 10000)
                            if jobs.blip[1] ~= nil and DoesBlipExist(jobs.blip[1]) then
                                Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(jobs.blip[1]))
                                jobs.blip[1] = nil
                            end
                        end
                        if jobs.flag[1] == 0 and jobs.flag[2] > 0 then
                            Wait(1000)
                            jobs.flag[2] = jobs.flag[2]-1
                            if jobs.flag[2] == 0 then
                                local pos = GetEntityCoords(GetPlayerPed(-1))
                                local rped = GetRandomPedAtCoord(pos['x'], pos['y'], pos['z'], 35.001, 35.001, 35.001, 6, _r)
                                if DoesEntityExist(rped) then
                                    jobs.peds[1] = rped
                                    jobs.flag[1] = 1
                                    jobs.flag[2] = 19+GetRandomIntInRange(1, 21)
                                    ClearPedTasksImmediately(jobs.peds[1])
                                    SetBlockingOfNonTemporaryEvents(jobs.peds[1], 1)
                                    TaskStandStill(jobs.peds[1], 1000*jobs.flag[2])
                                    DrawMissionText("Le ~g~client~w~ vous attend. Rapprochez vous", 5000)
                                    local lblip = AddBlipForEntity(jobs.peds[1])
                                    SetBlipAsFriendly(lblip, 1)
                                    SetBlipColour(lblip, 2)
                                    SetBlipCategory(lblip, 3)
                                else
                                    jobs.flag[1] = 0
                                    jobs.flag[2] = 59+GetRandomIntInRange(1, 90)
                                    DrawMissionText("Roulez pour trouver un nouveau ~h~~y~client~w~.", 10000)
                                end
                            end
                        end
                    end
                else
                    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(jobs.cars[1]), true) > 30.0001 then
                        StopJob(1)
                    else
                        DrawMissionText("Retourner dans votre taxi pour ~y~continuer~w~.", 1)
                    end
                end
            else
                StopJob(1)
                DrawMissionText("Votre taxi est ~h~~r~detruit~w~.", 5000)
            end
        end
    end)
end
