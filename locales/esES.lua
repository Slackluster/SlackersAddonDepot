------------------------
-- My Addon: esES.lua --
------------------------
-- Spanish (Spain) localisation
-- Translator(s): Ferran Carril

if GetLocale() ~= "esES" then return end
local appName, app = ...
local L = app.locales

-- Settings
L.SETTINGS_VERSION =                     GAME_VERSION_LABEL .. ":" -- "Version"
L.SETTINGS_SUPPORT_TEXTLONG =            "Desarrollar este addon requiere una cantidad significativa de tiempo y esfuerzo.\nPor favor, considera apoyar financieramente al desarrollador."
L.SETTINGS_SUPPORT_TEXT =                "Apoyar"
L.SETTINGS_SUPPORT_BUTTON =              "Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_SUPPORT_DESC =                "¡Gracias!"
L.SETTINGS_HELP_TEXT =                   "Comentarios y Ayuda"
L.SETTINGS_HELP_BUTTON =                 "Discord" -- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_HELP_DESC =                   "Únete al servidor de Discord."
L.SETTINGS_URL_COPY =                    "Ctrl+C para copiar:"
L.SETTINGS_URL_COPIED =                  "Enlace copiado al portapapeles"

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
