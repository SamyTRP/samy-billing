local QBCore = exports['qb-core']:GetCoreObject()

-- Yakın oyuncuların isimlerini döndür
lib.callback.register("samy_billing:getNearbyNames", function(source, players)
    local result = {}
    for _, id in pairs(players) do
        local Player = QBCore.Functions.GetPlayer(id)
        if Player then
            local charinfo = Player.PlayerData.charinfo
            table.insert(result, {
                value = id,
                label = ("%s %s [ID:%s]"):format(charinfo.firstname, charinfo.lastname, id)
            })
        end
    end
    return result
end)

-- Fatura kesme
RegisterNetEvent("samy_billing:sendBill", function(targetId, amount, reason)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Target = QBCore.Functions.GetPlayer(targetId)

    if not Player or not Target then return end

    local job = Player.PlayerData.job.name
    if not Config.AllowedJobs[job] then
        TriggerClientEvent('ox_lib:notify', src, {
            title = _L("notifyError"),
            description = _L("errorJob"),
            type = "error"
        })
        return
    end

    local society = job
    local senderBilling = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    local senderID = Player.PlayerData.citizenid
    local label = reason

    -- gksphone export
    exports["gksphone"]:NewBilling(targetId, label, society, senderBilling, senderID, amount)

    -- Komisyon ödemesi
    local commission = math.floor(amount * Config.Commission)
    Player.Functions.AddMoney("bank", commission, "fatura-komisyon")

    TriggerClientEvent('ox_lib:notify', src, {
        title = _L("notifySuccess"),
        description = _L("successBill", commission),
        type = "success"
    })
end)
