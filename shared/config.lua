-- Author: David Brxxwn | Cxmmunity Club
-- Discord: https://discord.com/invite/EcpCFyX4DC

Config = {}

Config.Debug = true -- Enables or disables the debug mode. If true, debug messages are shown.
Config.Locale = 'en' -- Language setting: 'en' English, 'de' German, 'fr' French, 'es' Spanish
Config.Framework = 'qb' -- Framework selection: 'qb' for QBCore or 'esx' for ESX Framework

Config.UpdateInterval = 30000 -- Interval in milliseconds for the application to auto-update (30000 ms = 30 seconds).

Config.AppID = '' -- The AppID used for Discord Rich Presence identification.
Config.BigLogo = '' -- Name/URL for the big logo that is displayed in the Discord Rich Presence.
Config.BigLogoText = '' -- Text shown when hovering over the big logo.
Config.SmallLogo = '' -- Name/URL for the small logo that is displayed in the Discord Rich Presence.
Config.SmallLogoText = '' -- Text shown when hovering over the small logo.

Config.EnableButtons = true -- Specifies whether buttons are shown in the Discord Rich Presence.
Config.Buttons = { -- Defines the buttons that are shown, including the label text and URL.
    {label = "Discord", url = "https://discord.com/invite/CxmmunityClub"}, -- Example: Button for Discord
    {label = "Join", url = "fivem://connect/000.000.000.00:00000"} -- Example: Button to join server
}

Config.Topics = true -- Specifies whether the "topics" should be shown in the Discord Rich Presence.
Config.Caps = true -- If true, all text will be shown in uppercase.
Config.ID = true -- Shows the player's ID if true.
Config.PlayerName = true -- Shows the player's name if true.
Config.Job = true -- Shows the player's job if true.
Config.PlayerCount = true -- Shows the player count if true.
Config.Vehicle = true -- Shows the player's vehicle if true.
Config.Health = true -- Shows the player's health if true.
Config.Armor = true -- Shows the player's armor if true.
Config.StreetName = true -- Shows the street name if true.
Config.Ping = true -- Shows the player's ping if true.
Config.Vector4 = true -- Shows the player's location (coordinates) if true.
