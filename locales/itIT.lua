-------------------------------------
-- Slacker's Addon Depot: itIT.lua --
-------------------------------------
-- Italian (Italy) localisation
-- Translator(s):

if GetLocale() ~= "itIT" then return end
local appName, app = ...
local L = app.locales

-- Core
L.NEW_VERSION_AVAILABLE =                "È disponibile una nuova versione di %s:" -- %s becomes the addon name

L.DEBUG_ENABLED =                        "Modalità debug attivata"
L.DEBUG_DISABLED =                       "Modalità debug disattivata"
L.INVALID_COMMAND =                      "Comando non valido"

-- Settings
L.VERSION =                              GAME_VERSION_LABEL .. ":" -- "Version"
L.SUPPORT_TEXTLONG1 =                    "Lo sviluppo di questo addon richiede molto tempo e impegno."
L.SUPPORT_TEXTLONG2 =                    "Ti invitiamo a sostenere economicamente lo sviluppatore."
L.SUPPORT =                              "Supporto"
L.BUY_ME_A_COFFEE =                      "Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
L.THANK_YOU =                            "Grazie!"
L.FEEDBACK_AND_HELP =                    "Feedback e aiuto"
L.DISCORD =                              "Discord" -- Brand name, if there isn't a localised version, keep it the way it is
L.JOIN_DISCORD_SERVER =                  "Entra nel server Discord."
L.CTRL_C_COPY =                          "Ctrl+C per copiare:"
L.LINK_COPIED =                          "Collegamento copiato negli appunti"

L.KEYBINDINGS_AND_SLASH_COMMANDS =       SETTINGS_KEYBINDINGS_LABEL .. " e comandi slash" -- "Keybindings"
_G["BINDING_NAME_SAD_TOGGLELIST"] =      app.NameShort .. ": Mostra/nascondi elenco addon"
L.TOGGLE_ADDON_LIST =                    "Mostra/nascondi elenco addon"
L.OPEN_SETTINGS =                        "Apri le impostazioni"
L.NAME_OR_NUMBER =                       "nome o numero"
L.LOAD_PROFILE =                         "Chiedi di ricaricare l'interfaccia e attivare il profilo degli addon"
L.FORCELOAD_PROFILE =                    "Ricarica e attiva direttamente il profilo degli addon"
L.APPLY_PROFILES =                       "(Ri)applica i profili di accesso e ricarica"

L.GENERAL =                              GENERAL -- "General"
L.SHOW_MINIMAP_ICON =                    "Mostra icona minimappa"
L.SHOW_MINIMAP_ICON_DESC =               "Mostra l'icona sulla minimappa. Se disattivata, %s rimane disponibile dal Comparto addon." -- %s becomes the addon name
L.REPLACE_ADDONS_MENU_BUTTON =           "Sostituisci pulsante AddOn"
L.REPLACE_ADDONS_MENU_BUTTON_DESC =      "Fai aprire %s al pulsante AddOn nel menu principale." -- %s becomes the addon name

L.ADDON_LIST =                           "Elenco degli addon"
L.LOAD_OUT_OF_DATE =                     "Carica addon obsoleti"
L.LOAD_OUT_OF_DATE_DESC =                "Questo potrebbe causare errori con addon incompatibili."
L.REMEMBER_UNINSTALLED_ADDONS =          "Ricorda gli addon non installati"
L.REMEMBER_UNINSTALLED_ADDONS_DESC =     "Mantieni nei profili gli addon non installati e ricorda il loro stato di attivazione."
L.CHARLIST_REALMS =                      "Reami dell'elenco personaggi"
L.CHARLIST_REALMS_DESC =                 "Raggruppa i personaggi per reame."
L.CHARLIST_RULESETS =                    "Regole dell'elenco personaggi"
L.CHARLIST_RULESETS_DESC =               "Raggruppa i personaggi per regole."
L.CHARLIST_SORT =                        "Ordinamento elenco personaggi"
L.CHARLIST_SORT_DESC =                   "Imposta il metodo di ordinamento dell'elenco personaggi."
L.ALPHABETICAL =                         HOUSING_CHEST_SORT_TYPE_ALPHABETICAL -- "Alphabetical"
L.CLASS =                                CLASS -- "Class"

-- Addon List
L.INSTALLED =                            "Installato"
L.CATEGORIES =                           CATEGORIES -- "Categories"
L.CATEGORIES_WIKI =                      L.CATEGORIES .. " (Wiki)"
L.ENABLESTATE =                          "Stato di attivazione"
L.ENABLED =                              PVP_WAR_MODE_ENABLED -- "Enabled"
L.DISABLED =                             ADDON_DISABLED -- "Disabled"
L.CANCEL =                               CANCEL -- "Cancel"
L.APPLY_CHANGES =                        TRANSMOG_SITUATIONS_APPLY -- "Apply Changes"
L.RELOADUI =                             RELOADUI -- "Reload UI"
L.REAPPLY =                              "(Ri)applica"
L.ENABLE_ALL =                           ENABLE_ALL_ADDONS -- "Enable All"
L.DISABLE_ALL =                          DISABLE_ALL_ADDONS -- "Disable All"
L.REVERT =                               COOLDOWN_VIEWER_SETTINGS_BUTTON_REVERT_CHANGES -- "Revert"
L.OUT_OF_DATE =                          ADDON_INTERFACE_VERSION -- "Out of date"
L.INCOMPATIBLE =                         ADDON_INCOMPATIBLE -- "Incompatible"
L.REQUIRES_RELOAD =                      REQUIRES_RELOAD -- "Requires Reload"
L.DEPENDENCY_DISABLED =                  ADDON_DEP_DISABLED -- "Dependency disabled"
L.DEPENDENCY_MISSING =                   ADDON_DEP_MISSING -- "Dependency missing"
L.CHANGE_PENDING =                       "Modifica in sospeso"
L.DEPENDENCIES =                         ADDON_DEPENDENCIES -- "Dependencies: " (note the included trailing space)
L.UNCATEGORIZED =                        STABLE_PET_UNCATEGORIZED -- "Uncategorized"
L.ALL =                                  ALL -- "All"
L.NOT_APPLICABLE =                       NOT_APPLICABLE -- "N/A"
L.DELETE_CHARACTER =                     "Elimina il personaggio selezionato"

-- Profiles
L.PROFILES =                             "Profili"
L.LOGIN_PROFILE =                        "Profilo di accesso"
L.LOGIN_PROFILES =                       "Profili di accesso"
L.LOGIN_PROFILE_DESC1 =                  "Attiva gli addon all'accesso."
L.LOGIN_PROFILE_DESC2 =                  "Applicati automaticamente ai personaggi che soddisfano le condizioni di caricamento. Vengono applicati tutti i profili corrispondenti."
L.STANDARD_PROFILE =                     "Profilo standard"
L.STANDARD_PROFILES =                    "Profili standard"
L.STANDARD_PROFILE_DESC1 =               "Attiva gli addon durante il gioco."
L.STANDARD_PROFILE_DESC2 =               "Applicati manualmente a personaggi specifici. Applica un solo profilo alla volta."

L.SET_LOAD_CONDITIONS =                  "Imposta condizioni di caricamento"
L.APPLY_PROFILE =                        "Applica il profilo a %s" -- %s becomes a character name
L.ADDONS =                               "Addon"
L.SAVE_ADDONS =                          "Salva %d addon" -- %d becomes a number
L.NEW_PROFILE =                          "Nuovo profilo"
L.ENABLE_PROFILE =                       "Attiva profilo"
L.RENAME_PROFILE =                       "Rinomina profilo"
L.DELETE_PROFILE =                       "Elimina profilo"
L.PROFILE_NAME_NEW =                     "Nome del nuovo profilo:"
L.PROFILE_NAME_EXISTS =                  "Esiste già un profilo con questo nome."
L.PROFILE_NOT_FOUND =                    "Profilo non trovato."
L.DELETE_NAME_Q =                        "Eliminare %s?" -- %s becomes a name
L.RELOAD_AND_ENABLE =                    "Ricaricare e attivare %s?" -- %s becomes a name

L.CONDITION = {}
L.CONDITION[1] =                         CHARACTER -- "Character"
L.CONDITION[2] =                         NAME -- "Name"
L.CONDITION[3] =                         LEVEL -- "Level"
L.CONDITION[4] =                         "Reame"
L.CONDITION[5] =                         TRANSMOG_SOURCE_6 -- "Profession"
L.CONDITION[6] =                         CLASS -- "Class"
L.CONDITION[7] =                         "Regole"
L.CONDITIONSTATE = {}
L.CONDITIONSTATE[1] =                    "qualsiasi"
L.CONDITIONSTATE[2] =                    "tutte"
L.CONDITIONSTATE[3] =                    "è minore di"
L.CONDITIONSTATE[4] =                    "è"
L.CONDITIONSTATE[5] =                    "è uno di"
L.CONDITIONSTATE[6] =                    "è maggiore di"
L.CONDITIONSTATE[7] =                    "non è"
L.CONDITIONSTATE[8] =                    "non è nessuno di"
L.CONDITIONSTATE[9] =                    "inizia con"
L.CONDITIONSTATE[10] =                   "termina con"
L.CONDITIONSTATE[11] =                   "contiene"
L.CONDITIONSTATE[12] =                   "non contiene"
L.RULESET = {}
L.RULESET[1] =                           GDAPI_REALMTYPE_NORMAL -- "Normal"
L.RULESET[2] =                           GDAPI_REALMTYPE_PVP -- "PvP"
L.RULESET[3] =                           "Gioco di ruolo"
L.RULESET[4] =                           "Gioco di ruolo PvP"
L.RULESET[5] =                           GUILD_PLAYSTYLE_HARDCORE -- "Hardcore"

L.LOADCONDITION_WARNING1 =               "ATTENZIONE:" -- Uppercase
L.LOADCONDITION_WARNING2 =               "Gli addon che non appartengono a un profilo di accesso corrispondente verranno disabilitati all'accesso."
L.LOADCONDITION_MATCH1 =                 "Corrispondenza" -- followed by an any/all dropdown
L.LOADCONDITION_MATCH2 =                 "di queste condizioni per il profilo %s:" -- preceded by an any/all dropdown, %s becomes a profile name
L.LOADCONDITION_VALID =                  "La condizione di caricamento è valida."
L.LOADCONDITION_INCOMPLETE =             "La condizione di caricamento è incompleta."

L.LOADCONDITION_NEWCHAR1 =               "%s non ha mai visto questo personaggio (che tristezza)." -- You can omit the (so sad) joke if it doesn't work in your language, %s becomes the addon name
L.LOADCONDITION_NEWCHAR2 =               "Ricaricare per applicare i profili di accesso?"
