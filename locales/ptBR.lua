-------------------------------------
-- Slacker's Addon Depot: ptBR.lua --
-------------------------------------
-- Portuguese (Brazil) localisation
-- Translator(s):

if GetLocale() ~= "ptBR" then return end
local appName, app = ...
local L = app.locales

-- Core
L.NEW_VERSION_AVAILABLE =                "Há uma versão mais recente de %s disponível:" -- %s becomes the addon name

L.DEBUG_ENABLED =                        "Modo de depuração ativado"
L.DEBUG_DISABLED =                       "Modo de depuração desativado"
L.INVALID_COMMAND =                      "Comando inválido"

-- Settings
L.VERSION =                              GAME_VERSION_LABEL .. ":" -- "Version"
L.SUPPORT_TEXTLONG1 =                    "Desenvolver este addon exige muito tempo e dedicação."
L.SUPPORT_TEXTLONG2 =                    "Considere apoiar financeiramente o desenvolvedor."
L.SUPPORT =                              "Apoiar"
L.BUY_ME_A_COFFEE =                      "Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
L.THANK_YOU =                            "Obrigado!"
L.FEEDBACK_AND_HELP =                    "Comentários e Ajuda"
L.DISCORD =                              "Discord" -- Brand name, if there isn't a localised version, keep it the way it is
L.JOIN_DISCORD_SERVER =                  "Entre no servidor do Discord."
L.CTRL_C_COPY =                          "Ctrl+C para copiar:"
L.LINK_COPIED =                          "Link copiado para a área de transferência"

L.KEYBINDINGS_AND_SLASH_COMMANDS =       SETTINGS_KEYBINDINGS_LABEL .. " e comandos de barra" -- "Keybindings"
_G["BINDING_NAME_SAD_TOGGLELIST"] =      app.NameShort .. ": Alternar lista de addons"
L.TOGGLE_ADDON_LIST =                    "Alternar lista de addons"
L.OPEN_SETTINGS =                        "Abrir as configurações"
L.NAME_OR_NUMBER =                       "nome ou número"
L.LOAD_PROFILE =                         "Solicitar recarregamento e ativação do perfil de addons"
L.FORCELOAD_PROFILE =                    "Recarregar e ativar o perfil de addons imediatamente"
L.APPLY_PROFILES =                       "(Re)aplicar os perfis de login e recarregar"

L.GENERAL =                              GENERAL -- "General"
L.SHOW_MINIMAP_ICON =                    "Mostrar ícone no minimapa"
L.SHOW_MINIMAP_ICON_DESC =               "Mostra o ícone no minimapa. Se desativado, %s continuará disponível no Compartimento de Addons." -- %s becomes the addon name
L.REPLACE_ADDONS_MENU_BUTTON =           "Substituir botão AddOns"
L.REPLACE_ADDONS_MENU_BUTTON_DESC =      "Faz com que o botão AddOns do menu principal abra %s." -- %s becomes the addon name

L.ADDON_LIST =                           "Lista de addons"
L.LOAD_OUT_OF_DATE =                     "Carregar addons desatualizados"
L.LOAD_OUT_OF_DATE_DESC =                "Isso pode causar erros com addons incompatíveis."
L.REMEMBER_UNINSTALLED_ADDONS =          "Lembrar addons não instalados"
L.REMEMBER_UNINSTALLED_ADDONS_DESC =     "Manter addons não instalados nos perfis e lembrar seu estado de ativação."
L.CHARLIST_REALMS =                      "Reinos da lista de personagens"
L.CHARLIST_REALMS_DESC =                 "Agrupar personagens por reino."
L.CHARLIST_RULESETS =                    "Conjuntos de regras da lista de personagens"
L.CHARLIST_RULESETS_DESC =               "Agrupar personagens por conjunto de regras."
L.CHARLIST_SORT =                        "Ordenação da lista de personagens"
L.CHARLIST_SORT_DESC =                   "Defina o método de ordenação da lista de personagens."
L.ALPHABETICAL =                         HOUSING_CHEST_SORT_TYPE_ALPHABETICAL -- "Alphabetical"
L.CLASS =                                CLASS -- "Class"

-- Addon List
L.INSTALLED =                            "Instalado"
L.CATEGORIES =                           CATEGORIES -- "Categories"
L.CATEGORIES_WIKI =                      L.CATEGORIES .. " (Wiki)"
L.ENABLESTATE =                          "Estado de ativação"
L.ENABLED =                              PVP_WAR_MODE_ENABLED -- "Enabled"
L.DISABLED =                             ADDON_DISABLED -- "Disabled"
L.CANCEL =                               CANCEL -- "Cancel"
L.APPLY_CHANGES =                        TRANSMOG_SITUATIONS_APPLY -- "Apply Changes"
L.RELOADUI =                             RELOADUI -- "Reload UI"
L.REAPPLY =                              "(Re)aplicar"
L.ENABLE_ALL =                           ENABLE_ALL_ADDONS -- "Enable All"
L.DISABLE_ALL =                          DISABLE_ALL_ADDONS -- "Disable All"
L.REVERT =                               COOLDOWN_VIEWER_SETTINGS_BUTTON_REVERT_CHANGES -- "Revert"
L.OUT_OF_DATE =                          ADDON_INTERFACE_VERSION -- "Out of date"
L.INCOMPATIBLE =                         ADDON_INCOMPATIBLE -- "Incompatible"
L.REQUIRES_RELOAD =                      REQUIRES_RELOAD -- "Requires Reload"
L.DEPENDENCY_DISABLED =                  ADDON_DEP_DISABLED -- "Dependency disabled"
L.DEPENDENCY_MISSING =                   ADDON_DEP_MISSING -- "Dependency missing"
L.CHANGE_PENDING =                       "Alteração pendente"
L.DEPENDENCIES =                         ADDON_DEPENDENCIES -- "Dependencies: " (note the included trailing space)
L.UNCATEGORIZED =                        STABLE_PET_UNCATEGORIZED -- "Uncategorized"
L.ALL =                                  ALL -- "All"
L.NOT_APPLICABLE =                       NOT_APPLICABLE -- "N/A"
L.DELETE_CHARACTER =                     "Excluir o personagem selecionado"

-- Profiles
L.PROFILES =                             "Perfis"
L.LOGIN_PROFILE =                        "Perfil de Login"
L.LOGIN_PROFILES =                       "Perfis de Login"
L.LOGIN_PROFILE_DESC1 =                  "Ativa addons ao entrar."
L.LOGIN_PROFILE_DESC2 =                  "Aplicados automaticamente aos personagens que atendem às condições de carregamento. Todos os perfis correspondentes serão aplicados."
L.STANDARD_PROFILE =                     "Perfil Padrão"
L.STANDARD_PROFILES =                    "Perfis Padrão"
L.STANDARD_PROFILE_DESC1 =               "Ativa addons durante o jogo."
L.STANDARD_PROFILE_DESC2 =               "Aplicados manualmente a personagens específicos. Aplique um perfil por vez."

L.SET_LOAD_CONDITIONS =                  "Definir condições de carregamento"
L.APPLY_PROFILE =                        "Aplicar perfil a %s" -- %s becomes a character name
L.ADDONS =                               "Addons"
L.SAVE_ADDONS =                          "Salvar %d addons" -- %d becomes a number
L.NEW_PROFILE =                          "Novo perfil"
L.ENABLE_PROFILE =                       "Ativar perfil"
L.RENAME_PROFILE =                       "Renomear perfil"
L.DELETE_PROFILE =                       "Excluir perfil"
L.PROFILE_NAME_NEW =                     "Nome do novo perfil:"
L.PROFILE_NAME_EXISTS =                  "Já existe um perfil com esse nome."
L.PROFILE_NOT_FOUND =                    "Perfil não encontrado."
L.DELETE_NAME_Q =                        "Excluir %s?" -- %s becomes a name
L.RELOAD_AND_ENABLE =                    "Recarregar e ativar %s?" -- %s becomes a name

L.CONDITION = {}
L.CONDITION[1] =                         CHARACTER -- "Character"
L.CONDITION[2] =                         NAME -- "Name"
L.CONDITION[3] =                         LEVEL -- "Level"
L.CONDITION[4] =                         "Reino"
L.CONDITION[5] =                         TRANSMOG_SOURCE_6 -- "Profession"
L.CONDITION[6] =                         CLASS -- "Class"
L.CONDITION[7] =                         "Conjunto de regras"
L.CONDITIONSTATE = {}
L.CONDITIONSTATE[1] =                    "qualquer"
L.CONDITIONSTATE[2] =                    "todas"
L.CONDITIONSTATE[3] =                    "é menor que"
L.CONDITIONSTATE[4] =                    "é"
L.CONDITIONSTATE[5] =                    "é um de"
L.CONDITIONSTATE[6] =                    "é maior que"
L.CONDITIONSTATE[7] =                    "não é"
L.CONDITIONSTATE[8] =                    "não é nenhum de"
L.CONDITIONSTATE[9] =                    "começa com"
L.CONDITIONSTATE[10] =                   "termina com"
L.CONDITIONSTATE[11] =                   "contém"
L.CONDITIONSTATE[12] =                   "não contém"
L.RULESET = {}
L.RULESET[1] =                           GDAPI_REALMTYPE_NORMAL -- "Normal"
L.RULESET[2] =                           GDAPI_REALMTYPE_PVP -- "PvP"
L.RULESET[3] =                           "Interpretação de Papel"
L.RULESET[4] =                           "RP PvP"
L.RULESET[5] =                           GUILD_PLAYSTYLE_HARDCORE -- "Hardcore"

L.LOADCONDITION_WARNING1 =               "AVISO:" -- Uppercase
L.LOADCONDITION_WARNING2 =               "Addons que não estiverem em nenhum Perfil de Login correspondente serão desativados ao entrar."
L.LOADCONDITION_MATCH1 =                 "Corresponder" -- followed by an any/all dropdown
L.LOADCONDITION_MATCH2 =                 "destas condições para o perfil %s:" -- preceded by an any/all dropdown, %s becomes a profile name
L.LOADCONDITION_VALID =                  "A condição de carregamento é válida."
L.LOADCONDITION_INCOMPLETE =             "A condição de carregamento está incompleta."

L.LOADCONDITION_NEWCHAR1 =               "%s nunca viu este personagem antes (que tristeza)." -- You can omit the (so sad) joke if it doesn't work in your language, %s becomes the addon name
L.LOADCONDITION_NEWCHAR2 =               "Recarregar para aplicar os Perfis de Login?"
