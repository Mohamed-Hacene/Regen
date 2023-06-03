fx_version 'adamant'
game 'gta5'

client_script {
    '@hud-event/hudevent_aff.lua',
    '@appmenu/menu_cl.lua',
    "job_client.lua",
}

server_script {
    "@mysql-async/lib/MySQL.lua",
    "job_server.lua",
}
