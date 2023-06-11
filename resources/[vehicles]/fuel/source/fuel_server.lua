ESX = nil

if Config.UseESX then
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	RegisterServerEvent('fuel:pay')
	AddEventHandler('fuel:pay', function(price)
		local xPlayer = ESX.GetPlayerFromId(source)
		local amount = math.ceil(price)

		if price > 0 then
			xPlayer.removeBank(amount-1)
		end
	end)

	RegisterServerEvent("fuel:checkBalance")
	AddEventHandler("fuel:checkBalance", function()
		local source = source
		player = GetPlayerIdentifier(source)
		bank = MySQL.Sync.fetchScalar("SELECT bank FROM users WHERE identifier = @name", {['@name'] = player})
		TriggerClientEvent('fuel:setBankBalance', source, bank)
	end)
end
