RegisterServerEvent('printtable')
AddEventHandler('printtable', function(t_items)
    rPrint(t_items,nil,"Test")
end)

function rPrint(s, l, i) -- recursive Print (structure, limit, indent)
	l = (l) or 100; i = i or "";	-- default item limit, indent string
	--if (l<1) then print "ERROR: Item limit reached."; return l-1 end;
	local ts = type(s);
	if (ts ~= "table") then print (i,s); return l-1 end
	print (i,ts);           -- print "table"
	for k,v in pairs(s) do  -- print "[KEY] VALUE"
		l = rPrint(v, l, i.."\t["..tostring(k).."]");
		if (l < 0) then break end
	end
    print("")
	return l
end	

RegisterServerEvent('print')
AddEventHandler('print', function(text)
    local msg = tostring(text)
    print(msg)
end)

RegisterServerEvent('hud:CNN')
AddEventHandler('hud:CNN', function(institut,msg)
    TriggerClientEvent('CNN:Annonce', -1 ,institut, msg)
    TriggerEvent('log:print',"[LifeInvader] "..msg)
end)
AddEventHandler('rconCommand', function(commandName, args)
    if commandName == "CNN" then
        local msg = table.concat(args, ' ')
        TriggerClientEvent('CNN:Annonce', -1 ,"CNN", msg)
    TriggerEvent('log:print',"[CNN] "..msg)

        CancelEvent()
    end
end)