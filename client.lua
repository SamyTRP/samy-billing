local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand(Config.command, function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    local nearbyPlayers = {}
    for _, id in ipairs(QBCore.Functions.GetPlayersFromCoords(playerCoords, 3.0)) do
        if id ~= PlayerId() then
            local serverId = GetPlayerServerId(id)
            table.insert(nearbyPlayers, serverId)
        end
    end

    if #nearbyPlayers == 0 then
        lib.notify({title = _L("notifyError"), description = _L("errorNoPlayers"), type = "error"})
        return
    end

    lib.callback("samy_billing:getNearbyNames", false, function(players)
        if not players or #players == 0 then
            lib.notify({title = _L("notifyError"), description = _L("errorNoNames"), type = "error"})
            return
        end

        local input = lib.inputDialog(_L("menuTitle"), {
            {type = "select", label = _L("selectPlayer"), options = players},
            {type = "number", label = _L("amountLabel"), placeholder = _L("amountPlaceholder"), min = 1},
            {type = "input", label = _L("reasonLabel"), placeholder = _L("reasonPlaceholder")}
        })

        if not input then return end

        local targetId = tonumber(input[1])
        local amount = tonumber(input[2])
        local reason = input[3]

        if not amount or not reason or reason == "" then
            lib.notify({title = _L("notifyError"), description = _L("errorInvalid"), type = "error"})
            return
        end

        TriggerServerEvent("samy_billing:sendBill", targetId, amount, reason)
    end, nearbyPlayers)
end)
