local tempargent = 0
-- HELPER FUNCTIONS
function bankBalance(player)
  return MySQL.Sync.fetchScalar("SELECT bank FROM users WHERE identifier = @name", {['@name'] = player})
end

function moneyBalance(player)
  return MySQL.Sync.fetchScalar("SELECT money FROM users WHERE identifier = @name", {['@name'] = player})
end

function deposit(player, amount)
  local bank = bankBalance(player)
  local money = moneyBalance(player)
    local bank_balance = bank + amount
    local money_balance = money - amount
    tempargent = bank_balance
    MySQL.Sync.execute("UPDATE users SET `bank`= @bank, `money` = @money WHERE identifier = @identifier", {['@bank'] = bank_balance, ['@money'] = money_balance, ['@identifier'] = player})
end

function withdraw(player, amount)
  local bank = bankBalance(player)
  local money = moneyBalance(player)
    local bank_balance = bank - amount
    local money_balance = money + amount
    tempargent = bank_balance
    MySQL.Sync.execute("UPDATE users SET `bank`= @bank, `money` = @money WHERE identifier = @identifier", {['@bank'] = bank_balance, ['@money'] = money_balance, ['@identifier'] = player})
end

-- Check Bank Balance
TriggerEvent('es:addCommand', 'checkbalance', function(source, args, user)
    local source = source
    local player = getPlayerID(source)
    local bank = bankBalance(player)
    TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Your current account balance: ~g~$".. bank)
    TriggerClientEvent("banking:updateBalance", source, bank)
    CancelEvent()
end)

-- Bank Deposit
TriggerEvent('es:addCommand', 'deposit', function(source, args, user)
  local source = source
  local amount = ""
  local player = user.getIdentifier()
  for i=1,#args do
    amount = args[i]
  end
  TriggerClientEvent('bank:deposit', source, amount)
end)

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
    local source = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.getIdentifier()
    local money = moneyBalance(player)
    if(tonumber(amount) <= tonumber(money)) then
        tempargent = 0
        deposit(player, amount)
        user.removeMoney((amount))
        user.addBank((amount))
        local new_balance = tempargent
        TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Deposited: ~g~$".. amount .." ~n~~s~New Balance: ~g~$" .. new_balance)
        TriggerClientEvent("banking:updateBalance", source, new_balance)
        TriggerClientEvent("banking:addBalance", source, amount)
        CancelEvent()
    else
        TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Not enough cash!^0")
        CancelEvent()
      end
  end)
end)

-- Bank Withdraw
TriggerEvent('es:addCommand', 'withdraw', function(source, args, user)
  local source = source
  local amount = ""
  local player = user.getIdentifier()
  for i=1,#args do
    amount = args[i]
  end
  TriggerClientEvent('bank:withdraw', source, amount)
end)

RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
    local source = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
      local player = user.getIdentifier()
      local bank = bankBalance(player)
      if(tonumber(amount) <= tonumber(bank)) then
        tempargent = 0
        withdraw(player, amount)
        user.addMoney((amount))
        user.removeBank((amount))
        local new_balance = tempargent
        TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Withdrew: ~g~$".. amount .." ~n~~s~New Balance: ~g~$" .. new_balance)
        TriggerClientEvent("banking:updateBalance", source, new_balance)
        TriggerClientEvent("banking:removeBalance", source, amount)
        CancelEvent()
      else
        TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Not enough money in account!^0")
        CancelEvent()
      end
  end)
end)

RegisterServerEvent('bank:withdrawAmende')
AddEventHandler('bank:withdrawAmende', function(amount)
    local source = source
        tempargent = 0
        local player = getPlayerID(source)
        local bank = bankBalance(player)
		withdraw(player, amount)
		local new_balance = tempargent
		TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Nouveau solde: ~g~$" .. new_balance)
		TriggerClientEvent("banking:updateBalance", source, new_balance)
		TriggerClientEvent("banking:removeBalance", source, amount)
		CancelEvent()
end)

-- Give Cash
--[[TriggerEvent('es:addCommand', 'givecash', function(source, args, user)
    local source = source
      local fromPlayer
      local toPlayer
      local amount
      if (args[2] ~= nil and tonumber(args[3]) > 0) then
        fromPlayer = tonumber(source)
        toPlayer = tonumber(args[2])
        amount = tonumber(args[3])
        TriggerClientEvent('bank:givecash', source, toPlayer, amount)
        else
        TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Use format /givecash [id] [amount]^0")
        return false
      end
end)]]

RegisterServerEvent('bank:givecash')
AddEventHandler('bank:givecash', function(toPlayer, amount)
    local source = source
    local name1 = ""
    local name2 = ""
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.money) >= tonumber(amount)) then
            name1 = user.prenom.." "..user.nom
			user.removeMoney(amount)
			TriggerEvent('es:getPlayerFromId', toPlayer, function(recipient)
				recipient.addMoney(amount)
                name2 = recipient.prenom.." "..recipient.nom
				TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Cash donnée : ~r~-$".. amount .." ~n~~s~Liquide: ~g~$" .. user.money)
				TriggerClientEvent("es_freeroam:notify", toPlayer, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Cash reçu : ~g~$".. amount .." ~n~~s~Liquide: ~g~$" .. recipient.money)
                local msg = "[GiveCash]"..name1.." a donnée $"..tostring(amount).." à "..name2
                print(msg)
			end)
		else
			if (tonumber(user.money) < tonumber(amount)) then
        TriggerClientEvent('hud:NotifColor', source, "Vous n'avez pas assez d'argent!",6)
        CancelEvent()
			end
		end
	end)
end)

AddEventHandler('es:playerLoaded', function(source)
        local player = getPlayerID(source)
        local bank = bankBalance(player)
        TriggerClientEvent("banking:updateBalance", source, bank)
end)

RegisterServerEvent('bank:paywithbank')
AddEventHandler('bank:paywithbank', function(amount)
	player = getPlayerID(source)
    local source = source
    amount = tonumber(amount)
    --print("banking")
    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @name", {['@name'] = player})
    argent = result[1].bank
    new_balance = argent-amount
    MySQL.Sync.execute("UPDATE users SET `bank`=@value WHERE identifier = @identifier", {['@value'] = new_balance, ['@identifier'] = player})
    TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Nouveau solde: ~g~$" .. new_balance)
    TriggerClientEvent("banking:updateBalance", source, new_balance)
    TriggerClientEvent("banking:removeBalance", source, amount)
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