fx_version 'cerulean'
game 'gta5'

author '[LIFESERVICES/LIFE SCRIPTS]//code by Alpha#7721 and Preacher#6392'
description 'Banking Script for ESX'
version '1.0'

client_scripts {
  '@NativeUI/NativeUI.lua',
  'config.lua',
  'client/client.lua',
	'client/interactclient.lua',
}

server_scripts {
  'config.lua',
  'server/server.lua',
  'server/webhookserver.lua',
}

ui_page('client/html/index.html')

files({
    'client/html/index.html',
    'client/html/sounds/**.ogg',
})
