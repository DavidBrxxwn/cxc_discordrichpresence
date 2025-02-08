Config = {}

Config.debug = false  -- Enables or disables the debug mode. If true, debug messages are shown.
Config.UpdateInterval = 30000  -- Interval in milliseconds for the application to auto-update (30000 ms = 30 seconds).

Config.AppID = ''  -- The AppID used (e.g., for identification or API access).
Config.BigLogo = ''  -- URL for the big logo that is displayed in the application.
Config.BigLogoText = ''  -- Text shown next to the big logo.
Config.SmallLogo = ''  -- URL for the small logo that is displayed in the application.
Config.SmallLogoText = ''  -- Text shown next to the small logo.

Config.EnableButtons = false  -- Specifies whether buttons are shown in the application.
Config.Buttons = {  -- Defines the buttons that are shown, including the text and URL.
    {label = "Discord", url = ""},  -- Example: Button for Discord
    {label = "Join", url = ""}      -- Example: Button to join
}

Config.ShowTopics = false  -- Specifies whether the "topics" should be shown in the application.
Config.uppercase = false  -- If true, all text will be shown in uppercase.

Config.ShowID = true  -- Shows the player's ID if true.
Config.ShowName = true  -- Shows the player's name if true.
Config.ShowJob = false  -- Shows the player's job if true.
Config.ShowPlayerCount = false  -- Shows the player count if true.
Config.ShowVehicle = false  -- Shows the player's vehicle if true.
Config.ShowHealth = false  -- Shows the player's health if true.
Config.ShowArmor = false  -- Shows the player's armor if true.
Config.ShowLocation = false  -- Shows the player's location (e.g., coordinates) if true.
Config.ShowStreetName = false  -- Shows the street name if true.
Config.ShowPing = true  -- Shows the player's ping if true.