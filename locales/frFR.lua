-------------------------------------
-- Slacker's Addon Depot: frFR.lua --
-------------------------------------
-- French (France) localisation
-- Translator(s): Klep-Ysondre

if GetLocale() ~= "frFR" then return end
local appName, app = ...
local L = app.locales

-- Core
L.NEW_VERSION_AVAILABLE =                "Une nouvelle version de %s est disponible :" -- %s becomes the addon name

L.DEBUG_ENABLED =                        "Mode débogage activé"
L.DEBUG_DISABLED =                       "Mode débogage désactivé"
L.INVALID_COMMAND =                      "Commande non valide"

-- Settings
L.VERSION =                              GAME_VERSION_LABEL .. " :" -- "Version"
L.SUPPORT_TEXTLONG1 =                    "Le développement de cette extension demande beaucoup de temps et d’efforts."
L.SUPPORT_TEXTLONG2 =                    "Veuillez envisager de soutenir financièrement le développeur."
L.SUPPORT =                              "Soutien"
L.BUY_ME_A_COFFEE =                      "Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
L.THANK_YOU =                            "Merci !"
L.FEEDBACK_AND_HELP =                    "Commentaires et aide"
L.DISCORD =                              "Discord" -- Brand name, if there isn't a localised version, keep it the way it is
L.JOIN_DISCORD_SERVER =                  "Rejoignez le serveur Discord."
L.CTRL_C_COPY =                          "Ctrl + C pour copier :"
L.LINK_COPIED =                          "Lien copié dans le presse-papiers"

L.KEYBINDINGS_AND_SLASH_COMMANDS =       SETTINGS_KEYBINDINGS_LABEL .. " & Commandes « Slash »" -- "Keybindings"
_G["BINDING_NAME_SAD_TOGGLELIST"] =      app.NameShort .. ": Afficher/masquer la liste des addons"
L.TOGGLE_ADDON_LIST =                    "Afficher/masquer la liste des addons"
L.OPEN_SETTINGS =                        "Ouvrir les paramètres"
L.NAME_OR_NUMBER =                       "nom ou nombre"
L.LOAD_PROFILE =                         "Demander le rechargement et l'activation du profil d'addons"
L.FORCELOAD_PROFILE =                    "Recharger et activer directement le profil d'addons"
L.APPLY_PROFILES =                       "(Ré)appliquer les profils de connexion et recharger"

L.GENERAL =                              GENERAL -- "General"
L.SHOW_MINIMAP_ICON =                    "Afficher le bouton de la mini-carte"
L.SHOW_MINIMAP_ICON_DESC =               "Afficher le bouton de la mini-carte. Si vous désactivez cette fonction, %s sera toujours disponible dans le panneau des addons." -- %s becomes the addon name
L.REPLACE_ADDONS_MENU_BUTTON =           "Remplacer le bouton AddOns"
L.REPLACE_ADDONS_MENU_BUTTON_DESC =      "Faire en sorte que le bouton AddOns du menu principal ouvre %s." -- %s becomes the addon name

L.ADDON_LIST =                           "Liste des addons"
L.LOAD_OUT_OF_DATE =                     "Charger les addons obsolètes"
L.LOAD_OUT_OF_DATE_DESC =                "Cela peut provoquer des erreurs avec des addons incompatibles."
L.REMEMBER_UNINSTALLED_ADDONS =          "Mémoriser les addons non installés"
L.REMEMBER_UNINSTALLED_ADDONS_DESC =     "Conserver les addons non installés dans les profils et mémoriser leur état d'activation."
L.CHARLIST_REALMS =                      "Royaumes de la liste des personnages"
L.CHARLIST_REALMS_DESC =                 "Regrouper les personnages par royaume."
L.CHARLIST_RULESETS =                    "Ensembles de règles de la liste des personnages"
L.CHARLIST_RULESETS_DESC =               "Regrouper les personnages par ensemble de règles."
L.CHARLIST_SORT =                        "Tri de la liste des personnages"
L.CHARLIST_SORT_DESC =                   "Définir la méthode de tri de la liste des personnages."
L.ALPHABETICAL =                         HOUSING_CHEST_SORT_TYPE_ALPHABETICAL -- "Alphabetical"
L.CLASS =                                CLASS -- "Class"

-- Addon List
L.INSTALLED =                            "Installé"
L.CATEGORIES =                           CATEGORIES -- "Categories"
L.CATEGORIES_WIKI =                      L.CATEGORIES .. " (Wiki)"
L.ENABLESTATE =                          "État d'activation"
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
L.CHANGE_PENDING =                       "Modification en attente"
L.DEPENDENCIES =                         ADDON_DEPENDENCIES -- "Dependencies: " (note the included trailing space)
L.UNCATEGORIZED =                        STABLE_PET_UNCATEGORIZED -- "Uncategorized"
L.ALL =                                  ALL -- "All"
L.NOT_APPLICABLE =                       NOT_APPLICABLE -- "N/A"
L.DELETE_CHARACTER =                     "Supprimer le personnage sélectionné"

-- Profiles
L.PROFILES =                             "Profils"
L.LOGIN_PROFILE =                        "Profil de connexion"
L.LOGIN_PROFILES =                       "Profils de connexion"
L.LOGIN_PROFILE_DESC1 =                  "Active les addons à la connexion."
L.LOGIN_PROFILE_DESC2 =                  "Appliqués automatiquement aux personnages qui remplissent les conditions de chargement. Tous les profils correspondants sont appliqués."
L.STANDARD_PROFILE =                     "Profil standard"
L.STANDARD_PROFILES =                    "Profils standard"
L.STANDARD_PROFILE_DESC1 =               "Active les addons en jeu."
L.STANDARD_PROFILE_DESC2 =               "Appliqués manuellement à des personnages précis. Appliquez un seul profil à la fois."

L.SET_LOAD_CONDITIONS =                  "Définir les conditions de chargement"
L.APPLY_PROFILE =                        "Appliquer le profil à %s" -- %s becomes a character name
L.ADDONS =                               "Addons"
L.SAVE_ADDONS =                          "Enregistrer %d addons" -- %d becomes a number
L.NEW_PROFILE =                          "Nouveau profil"
L.ENABLE_PROFILE =                       "Activer le profil"
L.RENAME_PROFILE =                       "Renommer le profil"
L.DELETE_PROFILE =                       "Supprimer le profil"
L.PROFILE_NAME_NEW =                     "Nom du nouveau profil :"
L.PROFILE_NAME_EXISTS =                  "Un profil portant ce nom existe déjà."
L.PROFILE_NOT_FOUND =                    "Profil introuvable."
L.DELETE_NAME_Q =                        "Supprimer %s ?" -- %s becomes a name
L.RELOAD_AND_ENABLE =                    "Recharger et activer %s ?" -- %s becomes a name

L.CONDITION = {}
L.CONDITION[1] =                         CHARACTER -- "Character"
L.CONDITION[2] =                         NAME -- "Name"
L.CONDITION[3] =                         LEVEL -- "Level"
L.CONDITION[4] =                         "Royaume"
L.CONDITION[5] =                         TRANSMOG_SOURCE_6 -- "Profession"
L.CONDITION[6] =                         CLASS -- "Class"
L.CONDITION[7] =                         "Ensemble de règles"
L.CONDITIONSTATE = {}
L.CONDITIONSTATE[1] =                    "n'importe lequel"
L.CONDITIONSTATE[2] =                    "toutes"
L.CONDITIONSTATE[3] =                    "est inférieur à"
L.CONDITIONSTATE[4] =                    "est"
L.CONDITIONSTATE[5] =                    "est l'un de"
L.CONDITIONSTATE[6] =                    "est supérieur à"
L.CONDITIONSTATE[7] =                    "n'est pas"
L.CONDITIONSTATE[8] =                    "n'est aucun de"
L.CONDITIONSTATE[9] =                    "commence par"
L.CONDITIONSTATE[10] =                   "se termine par"
L.CONDITIONSTATE[11] =                   "contient"
L.CONDITIONSTATE[12] =                   "ne contient pas"
L.RULESET = {}
L.RULESET[1] =                           GDAPI_REALMTYPE_NORMAL -- "Normal"
L.RULESET[2] =                           GDAPI_REALMTYPE_PVP -- "PvP"
L.RULESET[3] =                           "Jeu de rôle"
L.RULESET[4] =                           "Jeu de rôle JcJ"
L.RULESET[5] =                           GUILD_PLAYSTYLE_HARDCORE -- "Hardcore"

L.LOADCONDITION_WARNING1 =               "ATTENTION :" -- Uppercase
L.LOADCONDITION_WARNING2 =               "Les addons qui ne figurent dans aucun profil de connexion correspondant seront désactivés à la connexion."
L.LOADCONDITION_MATCH1 =                 "Correspondance" -- followed by an any/all dropdown
L.LOADCONDITION_MATCH2 =                 "de ces conditions pour le profil %s :" -- preceded by an any/all dropdown, %s becomes a profile name
L.LOADCONDITION_VALID =                  "La condition de chargement est valide."
L.LOADCONDITION_INCOMPLETE =             "La condition de chargement est incomplète."

L.LOADCONDITION_NEWCHAR1 =               "%s n'avait encore jamais vu ce personnage (quelle tristesse)." -- You can omit the (so sad) joke if it doesn't work in your language, %s becomes the addon name
L.LOADCONDITION_NEWCHAR2 =               "Recharger pour appliquer les profils de connexion ?"
