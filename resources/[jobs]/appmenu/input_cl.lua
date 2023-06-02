-------------------------------------------------------------------------------------
------------------------------ INPUT HTML -------------------------------------------
-------------------------------------------------------------------------------------
local RetourInput = nil
local BoucleInput = false

AddEventHandler('DisplayInputHTML', function(label,Typeval,MaxLength,Retour)
    if not BoucleInput then
        RetourInput = nil
        BoucleInput = true
        SetNuiFocus(true,true)
        SendNUIMessage({
            setAffichage = true,
            label = label,
            typeval = Typeval,
            MaxLength = MaxLength,

        })
        while BoucleInput do
            Wait(0)
        end
        if RetourInput == "" then
            Retour(0)
        else
            if Typeval == "number" then
                Retour(tonumber(RetourInput))
            else
                Retour(RetourInput)
            end
        end
    else
        CancelEvent()
    end
end)

RegisterNUICallback('closeInput', function(data, cb)
    SendNUIMessage({
        setAffichage = false,
    })
    cb('ok')
    SetNuiFocus(false,false)
    RetourInput = data.valeur
    BoucleInput = false
end)