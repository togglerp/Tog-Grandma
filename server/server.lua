QBCore.Functions.CreateCallback("tog-grandma:tryTakeMoney", function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player.Functions.RemoveMoney(Config.TakeMoney, Config.Cost) then return cb(false); end
    cb(true)
    if not Config.GiveBanage then return end
    if not Player.Functions.AddItem("bandage", 1) then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["bandage"], "add")
    TriggerClientEvent("QBCore:Notify", src, Config.GiveBandageToPlayer, "success")
end)
