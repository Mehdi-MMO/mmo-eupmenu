fx_version 'adamant'
game 'gta5'
lua54 'yes'

title 'MMO EUP Menu'
author 'Mehdi MMO - Sweet Vibes#7561'
description 'A menu using RageUI & Ace perms for EUP'
version '1.0.0'

client_scripts {
  '@NativeUI/NativeUI.lua',
  'client.lua',
}

server_scripts {
  'server.lua',
  'versionchecker.lua',
}

dependencies {
  'NativeUI',
}

shared_scripts{
  'config.lua',
}