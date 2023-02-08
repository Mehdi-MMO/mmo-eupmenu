local function hasDepartmentPermission(player, department)
	return department.checkAcePermissions == false or IsPlayerAceAllowed(player, department.acePermission)
end

RegisterServerEvent("mmo:changeEUP")
AddEventHandler("mmo:changeEUP", function(ped, rank, departmentInfo, x)
	TriggerClientEvent('mmo:giveEUP', source, hasDepartmentPermission(source, departmentInfo), departmentInfo, x)
end)