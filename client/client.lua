local QBCore = nil
local ESX = nil

if Config.Framework == 'qb' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = exports["es_extended"]:getSharedObject()
end

local function debugPrint(message)
    if Config.Debug then
        print(message)
    end
end

local function getPlayerData()
    if Config.Framework == 'qb' and QBCore then
        return QBCore.Functions.GetPlayerData()
    elseif Config.Framework == 'esx' and ESX then
        return ESX.GetPlayerData()
    end
    return nil
end

Citizen.CreateThread(function()
    while true do
        local playerData = getPlayerData()

        if not playerData then
            debugPrint(_('player_data_not_available'))
            Citizen.Wait(5000)
        else
            local playerName = _('unknown')
            local job = _('no_job')
            
            if Config.Framework == 'qb' and playerData.charinfo then
                playerName = (playerData.charinfo.firstname or _('unknown')) .. " " .. (playerData.charinfo.lastname or _('unknown'))
                job = playerData.job and playerData.job.label or _('no_job')
            elseif Config.Framework == 'esx' then
                if playerData.firstName and playerData.lastName then
                    playerName = playerData.firstName .. " " .. playerData.lastName
                end
                job = playerData.job and playerData.job.label or _('no_job')
            end
            
            local playerId = GetPlayerServerId(PlayerId())
            local playerCount = #GetActivePlayers()

            local playerPed = PlayerPedId()
            local vehicleName = _('on_foot')
            if Config.Vehicle then
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                if vehicle ~= 0 then
                    vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
                end
            end

            local health = Config.Health and (GetEntityHealth(playerPed) - 100) or 0
            local armor = Config.Armor and GetPedArmour(playerPed) or 0

            local location, streetName = "", ""
            if Config.Vector4 then
                local playerCoords = GetEntityCoords(playerPed)
                local coords = vector4(playerCoords.x, playerCoords.y, playerCoords.z, GetEntityHeading(playerPed))
                location = string.format("vector4(%.2f, %.2f, %.2f, %.2f)", coords.x, coords.y, coords.z, coords.w)
            end

            if Config.StreetName then
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
                debugPrint(_('configuring_buttons'))
                if Config.Buttons and #Config.Buttons > 0 then
                    for i = 1, math.min(#Config.Buttons, 2) do
                        local button = Config.Buttons[i]
                        if button and button.label and button.url then
                            debugPrint(_('setting_button', i, button.label, button.url))
                            SetDiscordRichPresenceAction(i-1, button.label, button.url)
                        else
                            debugPrint(_('invalid_button'))
                        end
                    end
                else
                    debugPrint(_('no_buttons'))
                end
            else
                debugPrint(_('buttons_disabled'))
            end

            local richPresenceText = ""

            local function formatText(text)
                return Config.Caps and text:upper() or text
            end

            if Config.ID then
                richPresenceText = richPresenceText .. (Config.Topics and (" " .. _('player_id', playerId)) or (" %d"):format(playerId))
            end

            if Config.PlayerName then
                richPresenceText = richPresenceText .. (Config.Topics and (" | " .. _('name', formatText(playerName))) or (" | %s"):format(formatText(playerName)))
            end

            if Config.Job then
                richPresenceText = richPresenceText .. (Config.Topics and (" | " .. _('job', formatText(job))) or (" | %s"):format(formatText(job)))
            end

            if Config.PlayerCount then
                richPresenceText = richPresenceText .. (Config.Topics and (" | " .. _('players_online', playerCount)) or (" | %d"):format(playerCount))
            end

            if Config.Vehicle then
                richPresenceText = richPresenceText .. (Config.Topics and (" | " .. _('vehicle', formatText(vehicleName))) or (" | %s"):format(formatText(vehicleName)))
            end

            if Config.Health then
                richPresenceText = richPresenceText .. (Config.Topics and (" | " .. _('health', health)) or (" | %d"):format(health))
            end

            if Config.Armor then
                richPresenceText = richPresenceText .. (Config.Topics and (" | " .. _('armor', armor)) or (" | %d"):format(armor))
            end

            if Config.Vector4 then
                richPresenceText = richPresenceText .. (Config.Topics and (" | " .. _('location', formatText(location))) or (" | %s"):format(formatText(location)))
            end

            if Config.StreetName then
                richPresenceText = richPresenceText .. (Config.Topics and (" | " .. _('street', formatText(streetName))) or (" | %s"):format(formatText(streetName)))
            end

            if Config.Ping then
                if playerPing then
                    richPresenceText = richPresenceText .. (Config.Topics and (" | " .. _('ping', playerPing)) or (" | %d ms"):format(playerPing))
                else
                    richPresenceText = richPresenceText .. (Config.Topics and (" | " .. _('ping_na')) or " | N/A")
                end
            end

            richPresenceText = string.sub(richPresenceText, 1, 128)
            debugPrint(_('rich_presence', richPresenceText))

            SetRichPresence(richPresenceText)
            Citizen.Wait(Config.UpdateInterval)
        end
    end
end)

RegisterNetEvent('sendPlayerPing')
AddEventHandler('sendPlayerPing', function(ping)
    playerPing = ping
end)
