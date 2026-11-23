-------------------------------------
-- Slacker's Addon Depot: esES.lua --
-------------------------------------
-- Spanish (Spain) localisation
-- Translator(s): Ferran Carril

if GetLocale() ~= "esES" then return end
local appName, app = ...
local L = app.locales

-- Core
L.NEW_VERSION_AVAILABLE =                "Hay una versión más nueva de %s disponible:" -- %s becomes the addon name

L.DEBUG_ENABLED =                        "Modo de depuración activado"
L.DEBUG_DISABLED =                       "Modo de depuración desactivado"
L.INVALID_COMMAND =                      "Comando no válido"

-- Settings
L.VERSION =                              GAME_VERSION_LABEL .. ":" -- "Version"
L.SUPPORT_TEXTLONG1 =                    "Desarrollar este addon requiere una cantidad significativa de tiempo y esfuerzo."
L.SUPPORT_TEXTLONG2 =                    "Por favor, considera apoyar financieramente al desarrollador."
L.SUPPORT =                              "Apoyar"
L.BUY_ME_A_COFFEE =                      "Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
L.THANK_YOU =                            "¡Gracias!"
L.FEEDBACK_AND_HELP =                    "Comentarios y Ayuda"
L.DISCORD =                              "Discord" -- Brand name, if there isn't a localised version, keep it the way it is
L.JOIN_DISCORD_SERVER =                  "Únete al servidor de Discord."
L.CTRL_C_COPY =                          "Ctrl+C para copiar:"
L.LINK_COPIED =                          "Enlace copiado al portapapeles"

L.KEYBINDINGS_AND_SLASH_COMMANDS =       SETTINGS_KEYBINDINGS_LABEL .. " y Comandos" -- "Keybindings"
_G["BINDING_NAME_SAD_TOGGLELIST"] =      app.NameShort .. ": Mostrar/ocultar lista de addons"
L.TOGGLE_ADDON_LIST =                    "Mostrar/ocultar lista de addons"
L.OPEN_SETTINGS =                        "Abrir opciones"
L.NAME_OR_NUMBER =                       "nombre o número"
L.LOAD_PROFILE =                         "Preguntar si se quiere recargar la interfaz y activar el perfil de addons"
L.FORCELOAD_PROFILE =                    "Recargar y activar el perfil de addons directamente"

L.GENERAL =                              GENERAL -- "General"
L.SHOW_MINIMAP_ICON =                    "Mostrar icono de minimapa"
L.SHOW_MINIMAP_ICON_DESC =               "Muestra el icono del minimapa. Si desactivas esto, %s sigue disponible en el apartado de Addons." -- %s becomes the addon name
L.REPLACE_ADDONS_MENU_BUTTON =           "Reemplazar botón AddOns"
L.REPLACE_ADDONS_MENU_BUTTON_DESC =      "Haz que el botón AddOns del menú principal abra %s." -- %s becomes the addon name

L.ADDON_LIST =                           "Lista de addons"
L.LOAD_OUT_OF_DATE =                     "Cargar addons desactualizados"
L.LOAD_OUT_OF_DATE_DESC =                "Esto puede causar errores con addons incompatibles."
L.REMEMBER_UNINSTALLED_ADDONS =          "Recordar addons no instalados"
L.REMEMBER_UNINSTALLED_ADDONS_DESC =     "Mantener los addons no instalados en los perfiles y recordar su estado de activación."
L.CHARLIST_REALMS =                      "Reinos de la lista de personajes"
L.CHARLIST_REALMS_DESC =                 "Agrupar personajes por reino."
L.CHARLIST_RULESETS =                    "Conjuntos de reglas de la lista de personajes"
L.CHARLIST_RULESETS_DESC =               "Agrupar personajes por conjunto de reglas."
L.CHARLIST_SORT =                        "Orden de la lista de personajes"
L.CHARLIST_SORT_DESC =                   "Establece el método de ordenación de la lista de personajes."
L.ALPHABETICAL =                         HOUSING_CHEST_SORT_TYPE_ALPHABETICAL -- "Alphabetical"
L.CLASS =                                CLASS -- "Class"

-- Addon List
L.INSTALLED =                            "Instalado"
L.CATEGORIES =                           CATEGORIES -- "Categories"
L.CATEGORIES_WIKI =                      L.CATEGORIES .. " (Wiki)"
L.ENABLESTATE =                          "Estado de activación"
L.ENABLED =                              PVP_WAR_MODE_ENABLED -- "Enabled"
L.DISABLED =                             ADDON_DISABLED -- "Disabled"
L.CANCEL =                               CANCEL -- "Cancel"
L.APPLY_CHANGES =                        TRANSMOG_SITUATIONS_APPLY -- "Apply Changes"
L.RELOADUI =                             RELOADUI -- "Reload UI"
L.ENABLE_ALL =                           ENABLE_ALL_ADDONS -- "Enable All"
L.DISABLE_ALL =                          DISABLE_ALL_ADDONS -- "Disable All"
L.REVERT =                               COOLDOWN_VIEWER_SETTINGS_BUTTON_REVERT_CHANGES -- "Revert"
L.OUT_OF_DATE =                          ADDON_INTERFACE_VERSION -- "Out of date"
L.INCOMPATIBLE =                         ADDON_INCOMPATIBLE -- "Incompatible"
L.REQUIRES_RELOAD =                      REQUIRES_RELOAD -- "Requires Reload"
L.DEPENDENCY_DISABLED =                  ADDON_DEP_DISABLED -- "Dependency disabled"
L.DEPENDENCY_MISSING =                   ADDON_DEP_MISSING -- "Dependency missing"
L.CHANGE_PENDING =                       "Cambio pendiente"
L.DEPENDENCIES =                         ADDON_DEPENDENCIES -- "Dependencies: " (note the included trailing space)
L.UNCATEGORIZED =                        STABLE_PET_UNCATEGORIZED -- "Uncategorized"
L.ALL =                                  ALL -- "All"
L.NOT_APPLICABLE =                       NOT_APPLICABLE -- "N/A"
L.DELETE_CHARACTER =                     "Eliminar el personaje seleccionado"

-- Profiles
L.PROFILES =                             "Perfiles"
L.LOGIN_PROFILE =                        "Perfil de Inicio de Sesión"
L.LOGIN_PROFILES =                       "Perfiles de Inicio de Sesión"
L.LOGIN_PROFILE_DESC1 =                  "Activa addons al iniciar sesión."
L.LOGIN_PROFILE_DESC2 =                  "Se aplican automáticamente a los personajes que cumplen las condiciones de carga. Se aplican todos los perfiles coincidentes."
L.STANDARD_PROFILE =                     "Perfil estándar"
L.STANDARD_PROFILES =                    "Perfiles estándar"
L.STANDARD_PROFILE_DESC1 =               "Activa addons durante el juego."
L.STANDARD_PROFILE_DESC2 =               "Se aplican manualmente a personajes concretos. Aplica un perfil a la vez."

L.SET_LOAD_CONDITIONS =                  "Establecer condiciones de carga"
L.APPLY_PROFILE =                        "Aplicar perfil a %s" -- %s becomes a character name
L.ADDONS =                               "Addons"
L.SAVE_ADDONS =                          "Guardar %d addons" -- %d becomes a number
L.NEW_PROFILE =                          "Nuevo perfil"
L.ENABLE_PROFILE =                       "Activar perfil"
L.RENAME_PROFILE =                       "Renombrar perfil"
L.DELETE_PROFILE =                       "Eliminar perfil"
L.PROFILE_NAME_NEW =                     "Nombre del nuevo perfil:"
L.PROFILE_NAME_EXISTS =                  "Ya existe un perfil con ese nombre."
L.PROFILE_NOT_FOUND =                    "Perfil no encontrado."
L.DELETE_NAME_Q =                        "¿Eliminar %s?" -- %s becomes a name
L.RELOAD_AND_ENABLE =                    "¿Recargar y activar %s?" -- %s becomes a name

L.CONDITION = {}
L.CONDITION[1] =                         CHARACTER -- "Character"
L.CONDITION[2] =                         NAME -- "Name"
L.CONDITION[3] =                         LEVEL -- "Level"
L.CONDITION[4] =                         "Reino"
L.CONDITION[5] =                         TRANSMOG_SOURCE_6 -- "Profession"
L.CONDITION[6] =                         CLASS -- "Class"
L.CONDITION[7] =                         "Conjunto de reglas"
L.CONDITIONSTATE = {}
L.CONDITIONSTATE[1] =                    "cualquiera"
L.CONDITIONSTATE[2] =                    "todas"
L.CONDITIONSTATE[3] =                    "es menor que"
L.CONDITIONSTATE[4] =                    "es"
L.CONDITIONSTATE[5] =                    "es uno de"
L.CONDITIONSTATE[6] =                    "es mayor que"
L.CONDITIONSTATE[7] =                    "no es"
L.CONDITIONSTATE[8] =                    "no es ninguno de"
L.CONDITIONSTATE[9] =                    "empieza por"
L.CONDITIONSTATE[10] =                   "termina en"
L.CONDITIONSTATE[11] =                   "contiene"
L.CONDITIONSTATE[12] =                   "no contiene"
L.RULESET = {}
L.RULESET[1] =                           GDAPI_REALMTYPE_NORMAL -- "Normal"
L.RULESET[2] =                           GDAPI_REALMTYPE_PVP -- "PvP"
L.RULESET[3] =                           "Rol"
L.RULESET[4] =                           "Rol PvP"
L.RULESET[5] =                           GUILD_PLAYSTYLE_HARDCORE -- "Hardcore"

L.LOADCONDITION_WARNING1 =               "ADVERTENCIA:" -- Uppercase
L.LOADCONDITION_WARNING2 =               "Los addons que no pertenezcan a ningún Perfil de Inicio de Sesión coincidente se desactivarán al entrar."
L.LOADCONDITION_MATCH1 =                 "Coincidencia" -- followed by an any/all dropdown
L.LOADCONDITION_MATCH2 =                 "de estas condiciones para el perfil %s:" -- preceded by an any/all dropdown, %s becomes a profile name
L.LOADCONDITION_VALID =                  "La condición de carga es válida."
L.LOADCONDITION_INCOMPLETE =             "La condición de carga está incompleta."

L.LOADCONDITION_NEWCHAR1 =               "%s no había visto antes a este personaje (qué tristeza)." -- You can omit the (so sad) joke if it doesn't work in your language, %s becomes the addon name
L.LOADCONDITION_NEWCHAR2 =               "¿Recargar para aplicar los Perfiles de Inicio de Sesión?"
