local MenuOri = 0
if Config.MenuOrientation == 0 then
    MenuOri = 0
elseif Config.MenuOrientation == 1 then
    MenuOri = 1320
else
    MenuOri = 0
end

local menuOpen = false

_menuPool = MenuPool.New()


function AddMenuClearPed(menu)
    local clearped = NativeUI.CreateItem("Clear Ped", "Do you wish to clear the ped?")
    menu:AddItem(clearped)

    clearped.Activated = function()
        for i = 0,11 do
            SetPedComponentVariation(PlayerPedId(), i, 0, 0)
        end
    end
end


local function eupSet(doesHavePerms, depinfo, deprankname)
    --print(duty)
    if doesHavePerms then
            for _, ranksname in pairs(depinfo.ranks) do
                for x,y in pairs(ranksname) do
                    if deprankname == _ then

                        function find_index(array, element, b)
                            for i, value in ipairs(array) do
                              if value == element then
                                if b == true then return true else return i end
                              end
                            end
                            return false
                          end

                        local comIndex = 0
                        local comps = {"head", "beard", "hair", "torso", "legs", "hands", "shoes", "a", "tops", "vest", "mask", "access"}

                        if find_index(comps, x, true) then
                            comIndex = find_index(comps, x, false)
                        end

                        SetPedComponentVariation(PlayerPedId(), comIndex-1, y-1, 0, 0) -- wear it

                    end
                end
            end
    end
end

RegisterNetEvent('mmo:giveEUP', eupSet)

function openEUPSelector()
    _menuPool:Remove()
    _menuPool = NativeUI.CreatePool()
    local title = GetResourceMetadata(GetCurrentResourceName(), 'title', 0)
    local version = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
    local menu = NativeUI.CreateMenu(Config.MenuTitle, ' ~y~' .. title .. " v" .. version, MenuOri)
    _menuPool:Add(menu)
    menu:SetMenuWidthOffset(Config.MenuWidth)
    menu.RightBadgeColor = { r = 10, g = 64, b = 255, a = 255 }
    collectgarbage()

    _menuPool:ControlDisablingEnabled(false)
    _menuPool:MouseControlsEnabled(false)
    AddMenuClearPed(menu)

    for name, category in pairs(Config.Departments) do
        if category.name ~= nil then 
            local departments = _menuPool:AddSubMenu(menu, category.name, '', true)
            departments:SetMenuWidthOffset(Config.MenuWidth)

            for _, ranksname in pairs(category.ranks) do
                local rank = NativeUI.CreateItem(_, '')
                departments:AddItem(rank)

                rank.Activated = function()
                    TriggerServerEvent("mmo:changeEUP", GetPlayerPed(-1), ranksname, category, _)
                end
            end
        end 
    end

    local about = _menuPool:AddSubMenu(menu, "About", "~u~About The Menu", true)
    about:SetMenuWidthOffset(Config.MenuWidth)
    local creator = NativeUI.CreateItem("Creator", "Mehdi MMO - Sweet Vibes#7561")
    about:AddItem(creator)
    local github = NativeUI.CreateItem("Github", "https://github.com/Mehdi-MMO/mmo-eupmenu")
    about:AddItem(github)
    
    menu:Visible(true)
    menuOpen = false
end

-- gotta fix dis
RegisterCommand(Config.Command, function()
    if Config.UseCommand then
        openEUPSelector()
    end
end, false)

Citizen.CreateThread(function()
	while true do
		Wait(0)
        _menuPool:ProcessMenus()	
		_menuPool:ControlDisablingEnabled(false)
		_menuPool:MouseControlsEnabled(false)

		if IsControlJustPressed(1, Config.Keybind) then
            if not menuOpen then
			    openEUPSelector()
            else
                _menuPool:CloseAllMenus()
            end
		end
	end
end)
