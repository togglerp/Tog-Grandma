local function deleteGrandma()
  if DoesEntityExist(grandma) then DeletePed(grandma) end
end

local function MinigameHandle(success)
  if not success then return QBCore.Functions.Notify(Config.MessageIfFailedMiniGame, 'error') end
  local ped = PlayerPedId()
  QBCore.Functions.Progressbar("reviving", Config.ProgBarMsg, Config.TalkTime, false, false, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
  }, {}, {}, {}, function()
      TriggerEvent('hospital:client:Revive')
  end, math.random(3, 6), math.random(10, 25))
end

local function spawnGrandma()
    if DoesEntityExist(grandma) then return end
    model = Config.PedModel
    while not HasModelLoaded(model) do RequestModel(model) Wait(0) end
    grandma = CreatePed(6, model, Config.Ped.x, Config.Ped.y, Config.Ped.z - 1.0, Config.Ped.w, false, false)
    SetEntityAsMissionEntity(grandma)
    SetPedFleeAttributes(grandma, 0, 0)
    SetBlockingOfNonTemporaryEvents(grandma, true)
    SetEntityInvincible(grandma, true)
    FreezeEntityPosition(grandma, true)
    exports['qb-target']:AddTargetEntity(grandma, {
        options = {
            {
                action = function()
                local health = GetEntityHealth(PlayerPedId())
                if health >= 200 then return QBCore.Functions.Notify(Config.FullHealth); end
                QBCore.Functions.TriggerCallback("tog-grandma:tryTakeMoney", function(hasMoney)
                    if not hasMoney then return QBCore.Functions.Notify(Config.DontHaveEnough); end
                    if Config.MiniGame == "none" then return MinigameHandle(true) end
                    if not Config.MiniGameArgs[Config.MiniGame] then Config.MiniGame = "Circle" end
                    exports['ps-ui'][Config.MiniGame](nil, function(success)
                        MinigameHandle(success)
                    end, table.unpack(Config.MiniGameArgs[Config.MiniGame]))
                  end)
                end,
                icon = "fas fa-user-check",
                label = Config.GrandmaLabel.. " ($".. Config.Cost ..")",
            },
        },
        distance = 1.5,
    })
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    spawnGrandma()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    deleteGrandma()
end)

AddEventHandler('onResourceStart', function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end
    spawnGrandma()
end)

AddEventHandler('onResourceStop', function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end
    deleteGrandma()
end)

