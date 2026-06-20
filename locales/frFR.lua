-------------------------------------
-- Slacker's Addon Depot: frFR.lua --
-------------------------------------
-- French (France) localisation
-- Translator(s): Klep-Ysondre

if GetLocale() ~= "frFR" then return end
local appName, app = ...
local L = app.locales

-- Settings
L.SETTINGS_VERSION =                     GAME_VERSION_LABEL .. ":"    -- "Version"
L.SETTINGS_SUPPORT_TEXTLONG =            "Le développement de cette extension demande beaucoup de temps et d’efforts.\nVeuillez envisager de soutenir financièrement le développeur."
L.SETTINGS_SUPPORT_TEXT =                "Soutien"
L.SETTINGS_SUPPORT_BUTTON =              "Buy Me a Coffee"    -- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_SUPPORT_DESC =                "Merci !"
L.SETTINGS_HELP_TEXT =                   "Commentaires et aide"
L.SETTINGS_HELP_BUTTON =                 "Discord"    -- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_HELP_DESC =                   "Rejoignez le serveur Discord."
L.SETTINGS_URL_COPY =                    "Ctrl + C pour copier :"
L.SETTINGS_URL_COPIED =                  "Lien copié dans le presse-papiers"

-- L.SETTINGS_KEYSLASH_TITLE =              SETTINGS_KEYBINDINGS_LABEL .. " & Slash Commands" -- "Keybindings"
-- _G["BINDING_NAME_SAD_FEATURE"] =         app.NameShort .. ": Feature Name"
-- L.SLASH_OPEN_SETTINGS =                  "Open the settings"

-- L.GENERAL =                              GENERAL -- "General"

-- L.SETTINGS_MINIMAP_TITLE =               "Show Minimap Icon"
-- L.SETTINGS_MINIMAP_DESC =                "Show the minimap icon. If you disable this, " .. app.NameShort .. " is still available from the Addon Compartment."
-- L.SETTINGS_REPLACE_MENU_BUTTON =         "Replace AddOns Button"
-- L.SETTINGS_REPLACE_MENU_BUTTON_DESC =    "Make the main menu's AddOns button open " .. app.NameLong .. "."

-- General
-- L.NEW_VERSION_AVAILABLE =                "There is a newer version of " .. app.NameLong .. " available:"
-- L.SETTINGS_TOOLTIP =                     app.NameLong .. "\n|cffFFFFFF" ..
--                                          app.IconLMB .. ": " .. "???" .. "\n" ..
--                                          app.IconRMB .. ": " .. L.SLASH_OPEN_SETTINGS

-- L.INVALID_COMMAND =                      "Invalid command."

-- Addon List
-- L.LISTSTYLE_CATEGORIES =                 CATEGORIES
-- L.LISTSTYLE_ENABLESTATE =                "Enable State"
-- L.ENABLED =                              PVP_WAR_MODE_ENABLED
-- L.DISABLED =                             ADDON_DISABLED
-- L.CANCEL =                               CANCEL
-- L.RELOAD =                               RELOADUI
-- L.ENABLE_ALL =                           ENABLE_ALL_ADDONS
-- L.DISABLE_ALL =                          DISABLE_ALL_ADDONS
