------------------------
-- My Addon: zhTW.lua --
------------------------
-- Chinese (Traditional, Taiwan) localisation
-- Translator(s):

if GetLocale() ~= "zhTW" then return end
local appName, app = ...
local L = app.locales

-- Settings
-- L.SETTINGS_VERSION =                     GAME_VERSION_LABEL .. ":" -- "Version"
-- L.SETTINGS_SUPPORT_TEXTLONG =            "Developing this addon takes a significant amount of time and effort.\nPlease consider financially supporting the developer."
-- L.SETTINGS_SUPPORT_TEXT =                "Support"
-- L.SETTINGS_SUPPORT_BUTTON =              "Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
-- L.SETTINGS_SUPPORT_DESC =                "Thank you!"
-- L.SETTINGS_HELP_TEXT =                   "Feedback & Help"
-- L.SETTINGS_HELP_BUTTON =                 "Discord" -- Brand name, if there isn't a localised version, keep it the way it is
-- L.SETTINGS_HELP_DESC =                   "Join the Discord server."
-- L.SETTINGS_URL_COPY =                    "Ctrl+C to copy:"
-- L.SETTINGS_URL_COPIED =                  "Link copied to clipboard"

-- L.SETTINGS_KEYSLASH_TITLE =              SETTINGS_KEYBINDINGS_LABEL .. " & Slash Commands" -- "Keybindings"
-- _G["BINDING_NAME_???_FEATURE"] =         app.NameShort .. ": Feature Name"
-- L.SLASH_OPEN_SETTINGS =                  "Open the settings"

-- L.GENERAL =                              GENERAL -- "General"

-- L.SETTINGS_MINIMAP_TITLE =               "Show Minimap Icon"
-- L.SETTINGS_MINIMAP_DESC =                "Show the minimap icon. If you disable this, " .. app.NameShort .. " is still available from the Addon Compartment."

-- General
-- L.NEW_VERSION_AVAILABLE =                "There is a newer version of " .. app.NameLong .. " available:"
-- L.SETTINGS_TOOLTIP =                     app.NameLong .. "\n|cffFFFFFF" ..
--                                          app.IconLMB .. ": " .. "???" .. "\n" ..
--                                          app.IconRMB .. ": " .. L.SLASH_OPEN_SETTINGS

-- L.INVALID_COMMAND =                      "Invalid command."
