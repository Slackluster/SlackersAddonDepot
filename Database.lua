-----------------------------------------
-- Slacker's Addon Depot: Database.lua --
-----------------------------------------

local appName, app = ...

-- Strings
app.Name = "Slacker's Addon Depot"
app.NameLong = app:Colour(app.Name)
app.NameShort = app:Colour("SAD")
app.NamePrefix = "SlackAddonDepot"
_G["BINDING_NAME_SLACKERSADDONDEPOT"] = app.Name
_G["BINDING_NAME_SLACKWARE"] = "Slackware"

-- Textures
app.Icon = "Interface\\Icons\\inv_tinkermodule_blue"
app.IconReady = CreateSimpleTextureMarkup("Interface\\RaidFrame\\ReadyCheck-Ready")
app.IconNotReady = CreateSimpleTextureMarkup("Interface\\RaidFrame\\ReadyCheck-NotReady")
app.IconLMB = CreateAtlasMarkup("housing-hotkey-icon-leftclick")
app.IconRMB = CreateAtlasMarkup("housing-hotkey-icon-rightclick")
app.IconNew = CreateAtlasMarkup("UI-Journeys-GreatVault-Tag-new")

app.IconNone = "Interface\\Icons\\inv_misc_questionmark"
