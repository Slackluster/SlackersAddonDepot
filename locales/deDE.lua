-------------------------------------
-- Slacker's Addon Depot: deDE.lua --
-------------------------------------
-- German (Germany) localisation
-- Translator(s):

if GetLocale() ~= "deDE" then return end
local appName, app = ...
local L = app.locales

-- Core
L.NEW_VERSION_AVAILABLE =                "Eine neuere Version von %s ist verfügbar:" -- %s becomes the addon name

L.DEBUG_ENABLED =                        "Debugmodus aktiviert"
L.DEBUG_DISABLED =                       "Debugmodus deaktiviert"
L.INVALID_COMMAND =                      "Ungültiger Befehl"

-- Settings
L.VERSION =                              GAME_VERSION_LABEL .. ":" -- "Version"
L.SUPPORT_TEXTLONG1 =                    "Die Entwicklung dieses Addons erfordert viel Zeit und Mühe."
L.SUPPORT_TEXTLONG2 =                    "Bitte erwäge, die Entwicklung finanziell zu unterstützen."
L.SUPPORT =                              "Unterstützen"
L.BUY_ME_A_COFFEE =                      "Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
L.THANK_YOU =                            "Vielen Dank!"
L.FEEDBACK_AND_HELP =                    "Feedback und Hilfe"
L.DISCORD =                              "Discord" -- Brand name, if there isn't a localised version, keep it the way it is
L.JOIN_DISCORD_SERVER =                  "Discord-Server beitreten."
L.CTRL_C_COPY =                          "Strg+C zum Kopieren:"
L.LINK_COPIED =                          "Link in die Zwischenablage kopiert"

L.KEYBINDINGS_AND_SLASH_COMMANDS =       SETTINGS_KEYBINDINGS_LABEL .. " & Slash-Befehle" -- "Keybindings"
_G["BINDING_NAME_SAD_TOGGLELIST"] =      app.NameShort .. ": Addon-Liste ein-/ausblenden"
L.TOGGLE_ADDON_LIST =                    "Addon-Liste ein-/ausblenden"
L.OPEN_SETTINGS =                        "Einstellungen öffnen"
L.NAME_OR_NUMBER =                       "Name oder Nummer"
L.LOAD_PROFILE =                         "Zum Neuladen und Aktivieren des Addon-Profils auffordern"
L.FORCELOAD_PROFILE =                    "Addon-Profil direkt aktivieren und Interface neu laden"
L.APPLY_PROFILES =                       "Login-Profile (erneut) anwenden und neu laden"

L.GENERAL =                              GENERAL -- "General"
L.SHOW_MINIMAP_ICON =                    "Minikartensymbol anzeigen"
L.SHOW_MINIMAP_ICON_DESC =               "Zeigt das Minikartensymbol an. Wenn du dies deaktivierst, bleibt %s über das Addon-Fach erreichbar." -- %s becomes the addon name
L.REPLACE_ADDONS_MENU_BUTTON =           "AddOns-Schaltfläche ersetzen"
L.REPLACE_ADDONS_MENU_BUTTON_DESC =      "Öffnet mit der AddOns-Schaltfläche im Hauptmenü %s." -- %s becomes the addon name

L.ADDON_LIST =                           "Addon-Liste"
L.LOAD_OUT_OF_DATE =                     "Veraltete Addons laden"
L.LOAD_OUT_OF_DATE_DESC =                "Dies kann bei inkompatiblen Addons Fehler verursachen."
L.REMEMBER_UNINSTALLED_ADDONS =          "Nicht installierte Addons merken"
L.REMEMBER_UNINSTALLED_ADDONS_DESC =     "Nicht installierte Addons in Profilen behalten und ihren Aktivierungsstatus merken."
L.CHARLIST_REALMS =                      "Realms der Charakterliste"
L.CHARLIST_REALMS_DESC =                 "Charaktere nach Realm gruppieren."
L.CHARLIST_RULESETS =                    "Regelwerke der Charakterliste"
L.CHARLIST_RULESETS_DESC =               "Charaktere nach Regelwerk gruppieren."
L.CHARLIST_SORT =                        "Sortierung der Charakterliste"
L.CHARLIST_SORT_DESC =                   "Sortiermethode für die Charakterliste festlegen."
L.ALPHABETICAL =                         HOUSING_CHEST_SORT_TYPE_ALPHABETICAL -- "Alphabetical"
L.CLASS =                                CLASS -- "Class"

-- Addon List
L.INSTALLED =                            "Installiert"
L.CATEGORIES =                           CATEGORIES -- "Categories"
L.CATEGORIES_WIKI =                      L.CATEGORIES .. " (Wiki)"
L.ENABLESTATE =                          "Aktivierungsstatus"
L.ENABLED =                              PVP_WAR_MODE_ENABLED -- "Enabled"
L.DISABLED =                             ADDON_DISABLED -- "Disabled"
L.CANCEL =                               CANCEL -- "Cancel"
L.APPLY_CHANGES =                        TRANSMOG_SITUATIONS_APPLY -- "Apply Changes"
L.RELOADUI =                             RELOADUI -- "Reload UI"
L.REAPPLY =                              "(Erneut) anwenden"
L.ENABLE_ALL =                           ENABLE_ALL_ADDONS -- "Enable All"
L.DISABLE_ALL =                          DISABLE_ALL_ADDONS -- "Disable All"
L.REVERT =                               COOLDOWN_VIEWER_SETTINGS_BUTTON_REVERT_CHANGES -- "Revert"
L.OUT_OF_DATE =                          ADDON_INTERFACE_VERSION -- "Out of date"
L.INCOMPATIBLE =                         ADDON_INCOMPATIBLE -- "Incompatible"
L.REQUIRES_RELOAD =                      REQUIRES_RELOAD -- "Requires Reload"
L.DEPENDENCY_DISABLED =                  ADDON_DEP_DISABLED -- "Dependency disabled"
L.DEPENDENCY_MISSING =                   ADDON_DEP_MISSING -- "Dependency missing"
L.CHANGE_PENDING =                       "Ausstehende Änderung"
L.DEPENDENCIES =                         ADDON_DEPENDENCIES -- "Dependencies: " (note the included trailing space)
L.UNCATEGORIZED =                        STABLE_PET_UNCATEGORIZED -- "Uncategorized"
L.ALL =                                  ALL -- "All"
L.NOT_APPLICABLE =                       NOT_APPLICABLE -- "N/A"
L.DELETE_CHARACTER =                     "Ausgewählten Charakter löschen"

-- Profiles
L.PROFILES =                             "Profile"
L.LOGIN_PROFILE =                        "Login-Profil"
L.LOGIN_PROFILES =                       "Login-Profile"
L.LOGIN_PROFILE_DESC1 =                  "Aktiviert Addons beim Einloggen."
L.LOGIN_PROFILE_DESC2 =                  "Wird automatisch auf Charaktere angewendet, die die Ladebedingungen erfüllen. Alle passenden Profile werden angewendet."
L.STANDARD_PROFILE =                     "Standardprofil"
L.STANDARD_PROFILES =                    "Standardprofile"
L.STANDARD_PROFILE_DESC1 =               "Aktiviert Addons während des Spiels."
L.STANDARD_PROFILE_DESC2 =               "Wird manuell auf bestimmte Charaktere angewendet. Es kann jeweils nur ein Profil angewendet werden."

L.SET_LOAD_CONDITIONS =                  "Ladebedingungen festlegen"
L.APPLY_PROFILE =                        "Profil auf %s anwenden" -- %s becomes a character name
L.ADDONS =                               "Addons"
L.SAVE_ADDONS =                          "%d Addons speichern" -- %d becomes a number
L.NEW_PROFILE =                          "Neues Profil"
L.ENABLE_PROFILE =                       "Profil aktivieren"
L.RENAME_PROFILE =                       "Profil umbenennen"
L.DELETE_PROFILE =                       "Profil löschen"
L.PROFILE_NAME_NEW =                     "Neuer Profilname:"
L.PROFILE_NAME_EXISTS =                  "Ein Profil mit diesem Namen existiert bereits."
L.PROFILE_NOT_FOUND =                    "Profil nicht gefunden."
L.DELETE_NAME_Q =                        "%s löschen?" -- %s becomes a name
L.RELOAD_AND_ENABLE =                    "Neu laden und %s aktivieren?" -- %s becomes a name

L.CONDITION = {}
L.CONDITION[1] =                         CHARACTER -- "Character"
L.CONDITION[2] =                         NAME -- "Name"
L.CONDITION[3] =                         LEVEL -- "Level"
L.CONDITION[4] =                         "Realm"
L.CONDITION[5] =                         TRANSMOG_SOURCE_6 -- "Profession"
L.CONDITION[6] =                         CLASS -- "Class"
L.CONDITION[7] =                         "Regelwerk"
L.CONDITIONSTATE = {}
L.CONDITIONSTATE[1] =                    "beliebig"
L.CONDITIONSTATE[2] =                    "alle"
L.CONDITIONSTATE[3] =                    "ist kleiner als"
L.CONDITIONSTATE[4] =                    "ist"
L.CONDITIONSTATE[5] =                    "ist eines von"
L.CONDITIONSTATE[6] =                    "ist größer als"
L.CONDITIONSTATE[7] =                    "ist nicht"
L.CONDITIONSTATE[8] =                    "ist keines von"
L.CONDITIONSTATE[9] =                    "beginnt mit"
L.CONDITIONSTATE[10] =                   "endet mit"
L.CONDITIONSTATE[11] =                   "enthält"
L.CONDITIONSTATE[12] =                   "enthält nicht"
L.RULESET = {}
L.RULESET[1] =                           GDAPI_REALMTYPE_NORMAL -- "Normal"
L.RULESET[2] =                           GDAPI_REALMTYPE_PVP -- "PvP"
L.RULESET[3] =                           "Rollenspiel"
L.RULESET[4] =                           "Rollenspiel-PvP"
L.RULESET[5] =                           GUILD_PLAYSTYLE_HARDCORE -- "Hardcore"

L.LOADCONDITION_WARNING1 =               "WARNUNG:" -- Uppercase
L.LOADCONDITION_WARNING2 =               "Addons, die keinem passenden Login-Profil angehören, werden beim Einloggen deaktiviert."
L.LOADCONDITION_MATCH1 =                 "Abgleichen" -- followed by an any/all dropdown
L.LOADCONDITION_MATCH2 =                 "dieser Bedingungen für Profil %s:" -- preceded by an any/all dropdown, %s becomes a profile name
L.LOADCONDITION_VALID =                  "Ladebedingung ist gültig."
L.LOADCONDITION_INCOMPLETE =             "Ladebedingung ist unvollständig."

L.LOADCONDITION_NEWCHAR1 =               "%s hat diesen Charakter noch nie gesehen (wie traurig)." -- You can omit the (so sad) joke if it doesn't work in your language, %s becomes the addon name
L.LOADCONDITION_NEWCHAR2 =               "Neu laden, um Login-Profile anzuwenden?"
