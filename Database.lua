----------------------------
-- My Addon: Database.lua --
----------------------------

local appName, app = ...

-- Strings
app.Name = "My Addon"
app.NameLong = app:Colour(app.Name)
app.NameShort = app:Colour("???")
app.NamePrefix = "MyAddon"
_G["BINDING_NAME_MYADDON"] = app.Name
_G["BINDING_NAME_SLACKWARE"] = "Slackware"

-- Textures
app.Icon = "Interface\\AddOns\\MyAddon\\assets\\icon.png"
app.IconReady = "|TInterface\\RaidFrame\\ReadyCheck-Ready:0|t"
app.IconNotReady = "|TInterface\\RaidFrame\\ReadyCheck-NotReady:0|t"
app.IconLMB = "|TInterface\\TutorialFrame\\UI-Tutorial-Frame:12:12:0:0:512:512:10:65:228:283:0|t"
app.IconRMB = "|TInterface\\TutorialFrame\\UI-Tutorial-Frame:12:12:0:0:512:512:10:65:330:385:0|t"
app.IconNew = "|A:UI-Journeys-GreatVault-Tag-new:33:49|a"
