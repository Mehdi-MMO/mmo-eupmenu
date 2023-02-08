--[[
	this is more like a clothing preset menu lol
]]


Config = {}

Config.Departments = {
	{
		name = "Los Santos Police Department", 
		ranks = {
			--[[
				it doesnt matter if you removed or add any rank or cloth component, you can remove em all lol
			]]

		    ["Officer"] = {
		        vest = 5,
				tops = 3,
				torso = 5,
				head = 1,
				beard = 1,
				shoes = 1,
				mask = 1,
				legs = 1,
				hands = 1,
				access = 1,
				hair = 1,

		    }, 
		    ["Sergeant"] = {
				vest = 5,
				tops = 3,
				torso = 5,
		    }, 
		    ["Lieutenant"] = {
				vest = 6,
				tops = 3,
				torso = 5,
		    },
		    ["Captain"] = {
		        vest = 7,
				tops = 3,
				torso = 5,
		    },
		},
		checkAcePermissions = true, -- false to disable check for ace perms
		acePermission = "lsd.department", -- the ace perms check you can modify this as you wish, needed if checkAcePermissions is set to true
	},
	{
		name = "Blaine County Sheriff's Office" , 
		ranks = {
		    ["Deputy"] = {
		        vest = 9,
				tops = 3,
				torso = 5,
		    }, 
		    ["Sergeant"] = {
		        vest = 8,
				tops = 5,
				torso = 5,
		    }, 
		    ["Lieutenant"] = {
		        vest = 8,
				tops = 9,
				torso = 5,
		    }, 
		    ["Sheriff"] = {
		        vest = 4,
				tops = 7,
				torso = 5,
		    }, 
		    
		},
		checkAcePermissions = false,
		acePermission = "" ,
	},
}

-- keybind to open the EUP selector menu
Config.Keybind = 166 -- F5

Config.UseCommand = true
Config.Command = "openeup" -- command to open menu


Config.MainMenuTitle = "EUP Menu" -- Menu Title
Config.MenuTitle = "EUP Menu" -- Menu Title
Config.MenuOrientation = 0 -- 1 RIGHT | 0 LEFT
Config.MenuWidth = 60
