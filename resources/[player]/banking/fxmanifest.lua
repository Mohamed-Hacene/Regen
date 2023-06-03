fx_version 'adamant'
game 'gta5'

ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/pricedown.ttf',
	'html/bank-icon.png',
	'html/logo.png',
	'html/cursor.png',
	'html/styles.css',
	'html/scripts.js',
	'html/debounce.min.js'
}

server_script "@mysql-async/lib/MySQL.lua"
client_script "banking_client.lua"
server_script "banking_server.lua"
