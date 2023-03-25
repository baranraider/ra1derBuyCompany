local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    RequestModel(GetHashKey(Config.Ped))
    while not HasModelLoaded(GetHashKey(Config.Ped)) do
        Wait(1)
    end
    npc = CreatePed(1, GetHashKey(Config.Ped), Config.PedCoord.x,  Config.PedCoord.y, Config.PedCoord.z, Config.PedHeading, false, true)
    SetPedCombatAttributes(npc, 46, true)               
    SetPedFleeAttributes(npc, 0, 0)               
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)

 
RegisterNetEvent("ra1der_company:purchasequestion",function(veri)
    veri = veri.veri
    local tablo = {
        {
            header = veri.meslek.." Adlı işletmeyi Kirala",
            icon = "fas fa-dollars",
            isMenuHeader = true
        },
        {
            header = "$" ..veri.ucret.. " Ödeyerek Haftalık Kirala",
            isServer = false,
            icon = "fas fa-shopping-basket",
            params = {
                event = "ra1der_company:buyCompany",
                args = {
                    deger = "hafta", 
                    veri = veri
                }
            }
        },
        {
            header =  "$" ..veri.ucret *4 .. " Ödeyerek Aylık Kirala",
            isServer = false,
            icon = "fas fa-shopping-basket",
            params = {
                event = "ra1der_company:buyCompany",
                args = {
                    deger = "aylik", 
                    veri = veri
                }
            }
        },
        {
            header = "Menüyü Kapat",
            icon = "fas fa-times",
            isServer = false,
            params = {
                event = "qb-menu:client:closeMenu"
            }
        }
    }
    exports["qb-menu"]:openMenu(tablo)
end)


function progress()
    QBCore.Functions.Progressbar('name', 'Sözleşme İmzalanıyor', 5000, false, false, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@mp_player_intupperraining_cash",
        anim = "idle_a",
        flags = 16,
    }, {}, {}, function() -- Play When Done
      QBCore.Functions.Notify(Config.Text["finishjob"])
    end)
end


RegisterNetEvent("ra1der_company:buyCompany",function(veri)
    QBCore.Functions.TriggerCallback("ra1der_company:tamamla", function(check,error)
        if check then
            progress()
                QBCore.Functions.Notify(Config.Text["rentbusiness"],"success")
        elseif error then
            QBCore.Functions.Notify(error.message,error.type,error.length)
        end
    end,veri)
end)

function menu_ac()
    local data = QBCore.Functions.GetPlayerData()
    local tablo = {
        {
            header = 'İşletme Kirala',
            txt ='<span style="color:#64e887;">Kiralamak istediğin işletmeyi seç </span>',
            icon = "fas fa-arrow-alt-circle-down",
            isMenuHeader = true
        },
    }
    for k,v in ipairs(meslekler) do
        if data.job and data.job.name == v.job then
            QBCore.Functions.Notify(Config.Text["alreadyboss"], "error")
            return
        end
    end
    for k,v in ipairs(meslekler) do
        table.insert(tablo,{
            header = v.meslek,
            icon = "fas fa-location-arrow",
            txt = "" ..v.txt.. "",
            isServer = false,
            params = {
                event = "ra1der_company:purchasequestion",
                args = {
                    veri = v
                }
            },
        })
    end
    exports["qb-menu"]:openMenu(tablo)
end

RegisterNetEvent('openMenu', function()
    menu_ac()
end)


exports['qb-target']:AddTargetModel(Config.Ped, {
	options = {
		{
			event = "openMenu",
			icon = "fas fa-dollar-sign",
			label = "İşletme Satın Al",
		},
	},
	distance = 2,
})
