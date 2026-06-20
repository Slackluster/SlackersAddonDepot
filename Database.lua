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
app.IconReady = "|TInterface\\RaidFrame\\ReadyCheck-Ready:0|t"
app.IconNotReady = "|TInterface\\RaidFrame\\ReadyCheck-NotReady:0|t"
app.IconLMB = "|TInterface\\TutorialFrame\\UI-Tutorial-Frame:12:12:0:0:512:512:10:65:228:283:0|t"
app.IconRMB = "|TInterface\\TutorialFrame\\UI-Tutorial-Frame:12:12:0:0:512:512:10:65:330:385:0|t"
app.IconNew = "|A:UI-Journeys-GreatVault-Tag-new:33:49|a"

app.IconNone = "Interface\\Icons\\inv_misc_questionmark"
