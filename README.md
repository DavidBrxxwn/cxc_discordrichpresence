# 📝DESCRIPTION
A FiveM script that updates Discord Rich Presence with customizable player info like name, job, ID, health, armor, location, vehicle, and ping. It supports interactive buttons and text formatting, updating periodically with the latest player details.

Showcase:

# ✨FEATURES
CONFIG:
- Debug -- Enables or disables the debug mode. If true, debug messages are shown.
- Locale -- Language setting: 'en' English, 'de' German, 'fr' French, 'es' Spanish
- Framework -- Framework selection: 'qb' for QBCore or 'esx' for ESX Framework
- UpdateInterval -- Interval in milliseconds for the application to auto-update (30000 ms = 30 seconds).

- AppID = '' -- The AppID used for Discord Rich Presence identification.
- BigLogo = '' -- Name/URL for the big logo that is displayed in the Discord Rich Presence.
- BigLogoText = '' -- Text shown when hovering over the big logo.
- SmallLogo = '' -- Name/URL for the small logo that is displayed in the Discord Rich Presence.
- SmallLogoText = '' -- Text shown when hovering over the small logo.

- Config.EnableButtons = false -- Specifies whether buttons are shown in the Discord Rich Presence.
- Config.Buttons = { -- Defines the buttons that are shown, including the label text and URL.
    {label = "Discord", url = "https://discord.com/invite/CxmmunityClub"}, -- Example: Button for Discord
    {label = "Join", url = "fivem://connect/000.000.000.00:00000"} -- Example: Button to join server
}

- Config.Topics = true -- Specifies whether the "topics" should be shown in the Discord Rich Presence.
- Config.Caps = false -- If true, all text will be shown in uppercase.
- Config.ID = true -- Shows the player's ID if true.
- Config.PlayerName = true -- Shows the player's name if true.
- Config.Job = true -- Shows the player's job if true.
- Config.PlayerCount = true -- Shows the player count if true.
- Config.Vehicle = false -- Shows the player's vehicle if true.
- Config.Health = false -- Shows the player's health if true.
- Config.Armor = false -- Shows the player's armor if true.
- Config.StreetName = true -- Shows the street name if true.
- Config.Ping = false -- Shows the player's ping if true.
- Config.Vector4 = false -- Shows the player's location (coordinates) if true.

# 🚨DEPENDENCY 
- qb-core (QB-Core): https://github.com/qbcore-framework/qb-core
- es_extended (ESX-Core): https://github.com/esx-framework/es_extended
- Discord Bot: https://discord.com/developers/applications

# 📚HELPFUL LINKS
- GTAV Mods: https://www.gta5-mods.com/
- GTACars: https://gtacars.net/
- Plebmasters: https://forge.plebmasters.de/

# 🧠FIVEM DOCS
- FiveM Docs: https://docs.fivem.net/docs/
- FiveM Natives: https://docs.fivem.net/natives/
- Controls: https://docs.fivem.net/docs/game-references/controls/
- Blips: https://docs.fivem.net/docs/game-references/blips/
- Checkpoints: https://docs.fivem.net/docs/game-references/checkpoints/
- Markers: https://docs.fivem.net/docs/game-references/markers/
- Ped Models: https://docs.fivem.net/docs/game-references/ped-models/
- Scenarios: https://wiki.rage.mp/wiki/Scenarios
- Vehicle Models: https://docs.fivem.net/docs/game-references/vehicle-references/vehicle-models/
- Vehicle Colours: https://docs.fivem.net/docs/game-references/vehicle-references/vehicle-colours/
- Vehicle Flags: https://docs.fivem.net/docs/game-references/vehicle-references/vehicle-flags/

# 📱SOCIAL MEDIA
- Discord: https://discord.com/invite/PjM3997JnW
- Ko-fi: https://ko-fi.com/cxmmunityclub
- GitHub: https://github.com/DavidBrxxwn

# 🛡️LICENSE
CREATIVE COMMONS BY-NC 4.0 LICENSE

This work is licensed under the Creative Commons BY-NC 4.0 license. This means you are free to use, share, and modify it as long as you give credit to the author (BY) and do not use it for commercial purposes (NC). Sharing under the same license is not required.
