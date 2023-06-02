---------------------------------- VAR ----------------------------------

local changeYourJob = {
  {name="Pole Emploi", colour=15, id=351, x=-116.790, y=-604.925, z=36.280},
}

local jobs = {
  {name="Chomeur", id=1},
  {name="Agriculteur", id=7},
  {name="Camionneur", id=3},
  {name="Mineur", id=4},
  {name="Raffineur", id=10},
}

---------------------------------- FUNCTIONS ----------------------------------

function IsNearJobs()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(changeYourJob) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 10) then
      return true
    end
  end
end

function menuJobs()
   VMenu.curItem = 1
   VMenu.ResetMenu() 
   VMenu.EditHeader('Métier disponibles')
  for _, item in pairs(jobs) do
    local nameJob = item.name
    local idJob = item.id
        VMenu.AddFunc(nameJob,"changeJob",idJob,'Choisir')
  end
end

function changeJob(id)
  TriggerServerEvent("jobssystem:jobs", id)
end

---------------------------------- CITIZEN ----------------------------------

Citizen.CreateThread(function()
    for _, item in pairs(changeYourJob) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipAsShortRange(item.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end
end)

Citizen.CreateThread(function()
    VMenu.AddMenu(6, 'Métier disponibles', 'poleemploi',255,255,255)
    
    local BoucleLent = 5000
    local BoucleCourt = 5
    local TempsBoucle = BoucleCourt
    while true do
        Citizen.Wait(TempsBoucle)   
        if (IsNearJobs() == true) then
            TempsBoucle = BoucleCourt
            DisplayHelp('Appuyer sur ~INPUT_CONTEXT~ pour accéder aux métiers')
            if (IsControlJustPressed(1,51) and IsNearJobs() == true) then
                    if not VMenu.visible then TriggerEvent('VMenu.CloseAll') end
                VMenu.curItem = 1
              menuJobs()
              VMenu.visible = not VMenu.visible
            end
            VMenu.Show()
        else
            VMenu.visible = false
            TempsBoucle = BoucleLent
        end
    end
end)

AddEventHandler("playerSpawned", function()
    TriggerServerEvent("jobssystem:spawnGetJob")
end)