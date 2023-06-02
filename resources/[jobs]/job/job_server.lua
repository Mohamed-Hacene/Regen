function nameJob(id)
    return MySQL.Sync.fetchScalar("SELECT name FROM jobs WHERE id = @id", {['@id'] = id})
end

function updatejob(source, id, isConnected)
    local job = id
    local source = source
    local player = getPlayerID(source)
    MySQL.Sync.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = job, ['@identifier'] = player})
    if(isConnected) then
        TriggerClientEvent("recolt:updateJobs", source, job)
        TriggerEvent('es:getPlayerFromId', source, function(user)
                user.setJob(job)
        end)
    end
end

RegisterServerEvent('jobssystem:jobs')
AddEventHandler('jobssystem:jobs', function(id)
        local source = source
        local player = getPlayerID(source) 
        local nameJob = nameJob(id)
        updatejob(source, id, true)
        if nameJob ~= "Policier" then
            TriggerClientEvent("hud:NotifIcon", source, "CHAR_MP_STRIPCLUB_PR", 1, "Mairie", false, "Votre métier est maintenant : ".. nameJob)
        end
end)

RegisterServerEvent('jobssystem:disconnectReset')
AddEventHandler('jobssystem:disconnectReset', function(user, id)
    local source = source
	local player = user.identifier
	local nameJob = nameJob(id)
	updatejob(source, id, false)
end)

RegisterServerEvent('jobssystem:spawnGetJob')
AddEventHandler('jobssystem:spawnGetJob', function()
    local source = source
    local player = getPlayerID(source)
    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @id", {['@id'] = player})
	TriggerClientEvent("recolt:updateJobs", source, result[1].job)
end)

-- get's the player id without having to use bugged essentials
function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end

-- gets the actual player id unique to the player,
-- independent of whether the player changes their screen name
function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end