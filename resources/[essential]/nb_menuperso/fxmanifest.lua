fx_version 'adamant'
game 'gta5'

shared_script 'config.lua'

---------------------------------------------------------------------------------------------------------------------------------------------------------
-- nb_menuperso
---------------------------------------------------------------------------------------------------------------------------------------------------------

client_scripts{ 
	'keycontrol.lua',
	'client.lua',
	'handsup.lua',
	'pointing.lua',
	'crouch.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server.lua'
}