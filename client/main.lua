QBCore = exports['qb-core']:GetCoreObject()

local function debugPrint(message)
    if Config.debug then
        print(message)
    end
end

Citizen.CreateThread(function()
    while true do
        local playerData = QBCore.Functions.GetPlayerData()

        if not playerData or not playerData.charinfo then
            debugPrint("Player data not available yet, retrying...")
            Citizen.Wait(5000)
        else
            local playerName = (playerData.charinfo.firstname or "Unknown") .. " " .. (playerData.charinfo.lastname or "Unknown")
            local job = playerData.job and playerData.job.label or "No Job"
            local playerId = GetPlayerServerId(PlayerId())
            local playerCount = #GetActivePlayers()

            local playerPed = PlayerPedId()
            local vehicleName = "On Foot"
            if Config.ShowVehicle then
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                if vehicle ~= 0 then
                    vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
                end
            end

            local health = Config.ShowHealth and (GetEntityHealth(playerPed) - 100) or 0
            local armor = Config.ShowArmor and GetPedArmour(playerPed) or 0

            local location, streetName = "", ""
            if Config.ShowLocation then
                local playerCoords = GetEntityCoords(playerPed)
                local coords = vector4(playerCoords.x, playerCoords.y, playerCoords.z, GetEntityHeading(playerPed))
                location = string.format("vector4(%.2f, %.2f, %.2f, %.2f)", coords.x, coords.y, coords.z, coords.w)
            end

            if Config.ShowStreetName then
                local playerCoords = GetEntityCoords(playerPed)
                local streetHash = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
                streetName = GetStreetNameFromHashKey(streetHash)
            end

            TriggerServerEvent('getPlayerPing', playerId)
            
            SetDiscordAppId(Config.AppID)
            SetDiscordRichPresenceAsset(Config.BigLogo)
            SetDiscordRichPresenceAssetText(Config.BigLogoText)
            SetDiscordRichPresenceAssetSmall(Config.SmallLogo)
            SetDiscordRichPresenceAssetSmallText(Config.SmallLogoText)

            if Config.EnableButtons then
                debugPrint("Configuring buttons...")
                if Config.Buttons and #Config.Buttons > 0 then
                    for i = 1, math.min(#Config.Buttons, 2) do
                        local button = Config.Buttons[i]
                        if button and button.label and button.url then
                            debugPrint(string.format("Setting button %d: %s with URL %s", i, button.label, button.url))
                            SetDiscordRichPresenceAction(i-1, button.label, button.url)
                        else
                            debugPrint("Invalid button configuration detected.")
                        end
                    end
                else
                    debugPrint("No buttons configured.")
                end
            else
                debugPrint("Buttons are disabled in config.")
            end

            local richPresenceText = ""

            local function formatText(text)
                return Config.uppercase and text:upper() or text
            end

            if Config.ShowID then
                richPresenceText = richPresenceText .. (Config.ShowTopics and (" Player ID: %d"):format(playerId) or (" %d"):format(playerId))
            end

            if Config.ShowName then
                richPresenceText = richPresenceText .. (Config.ShowTopics and (" | Name: %s"):format(formatText(playerName)) or (" | %s"):format(formatText(playerName)))
            end

            if Config.ShowJob then
                richPresenceText = richPresenceText .. (Config.ShowTopics and (" | Job: %s"):format(formatText(job)) or (" | %s"):format(formatText(job)))
            end

            if Config.ShowPlayerCount then
                richPresenceText = richPresenceText .. (Config.ShowTopics and (" | Players Online: %d"):format(playerCount) or (" | %d"):format(playerCount))
            end

            if Config.ShowVehicle then
                richPresenceText = richPresenceText .. (Config.ShowTopics and (" | Vehicle: %s"):format(formatText(vehicleName)) or (" | %s"):format(formatText(vehicleName)))
            end

            if Config.ShowHealth then
                richPresenceText = richPresenceText .. (Config.ShowTopics and (" | Health: %d"):format(health) or (" | %d"):format(health))
            end

            if Config.ShowArmor then
                richPresenceText = richPresenceText .. (Config.ShowTopics and (" | Armor: %d"):format(armor) or (" | %d"):format(armor))
            end

            if Config.ShowLocation then
                richPresenceText = richPresenceText .. (Config.ShowTopics and (" | Location: %s"):format(formatText(location)) or (" | %s"):format(formatText(location)))
            end

            if Config.ShowStreetName then
                richPresenceText = richPresenceText .. (Config.ShowTopics and (" | Street: %s"):format(formatText(streetName)) or (" | %s"):format(formatText(streetName)))
            end

            if Config.ShowPing then
                if playerPing then
                    richPresenceText = richPresenceText .. (Config.ShowTopics and (" | Ping: %d ms"):format(playerPing) or (" | %d ms"):format(playerPing))
                else
                    richPresenceText = richPresenceText .. (Config.ShowTopics and " | Ping: N/A" or " | N/A")
                end
            end

            richPresenceText = string.sub(richPresenceText, 1, 128)
            debugPrint("Rich Presence: " .. richPresenceText)

            SetRichPresence(richPresenceText)
            Citizen.Wait(Config.UpdateInterval)
        end
    end
end)

RegisterNetEvent('sendPlayerPing')
AddEventHandler('sendPlayerPing', function(ping)
    playerPing = ping
end)
