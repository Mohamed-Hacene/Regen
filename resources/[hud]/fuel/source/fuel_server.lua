ESX = nil

if Config.UseESX then
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	RegisterServerEvent('fuel:pay')
	AddEventHandler('fuel:pay', function(price)
		print("hello")
		local xPlayer = ESX.GetPlayerFromId(source)
		local amount = math.ceil(price)

		if price > 0 then
			xPlayer.removeBank(amount)
		end
	end)
end
