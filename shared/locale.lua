-- English translations
local en = {
    -- Discord Rich Presence
    ['player_id'] = 'Player ID: %d',
    ['name'] = 'Name: %s',
    ['job'] = 'Job: %s',
    ['players_online'] = 'Players Online: %d',
    ['vehicle'] = 'Vehicle: %s',
    ['health'] = 'Health: %d',
    ['armor'] = 'Armor: %d',
    ['location'] = 'Location: %s',
    ['street'] = 'Street: %s',
    ['ping'] = 'Ping: %d ms',
    ['ping_na'] = 'Ping: N/A',
    ['on_foot'] = 'On Foot',
    
    -- General Terms
    ['no_job'] = 'No Job',
    ['unknown'] = 'Unknown',
    ['loading'] = 'Loading...',
    ['error'] = 'Error',
    ['success'] = 'Success',
    ['warning'] = 'Warning',
    ['info'] = 'Information',
    
    -- Debug Messages
    ['player_data_not_available'] = 'Player data not available yet, retrying...',
    ['configuring_buttons'] = 'Configuring buttons...',
    ['setting_button'] = 'Setting button %d: %s with URL %s',
    ['invalid_button'] = 'Invalid button configuration detected.',
    ['no_buttons'] = 'No buttons configured.',
    ['buttons_disabled'] = 'Buttons are disabled in config.',
    ['rich_presence'] = 'Rich Presence: %s'
}

-- German translations
local de = {
    -- Discord Rich Presence
    ['player_id'] = 'Spieler ID: %d',
    ['name'] = 'Name: %s',
    ['job'] = 'Job: %s',
    ['players_online'] = 'Spieler Online: %d',
    ['vehicle'] = 'Fahrzeug: %s',
    ['health'] = 'Leben: %d',
    ['armor'] = 'Rüstung: %d',
    ['location'] = 'Position: %s',
    ['street'] = 'Straße: %s',
    ['ping'] = 'Ping: %d ms',
    ['ping_na'] = 'Ping: N/A',
    ['on_foot'] = 'Zu Fuß',
    
    -- General Terms
    ['no_job'] = 'Kein Job',
    ['unknown'] = 'Unbekannt',
    ['loading'] = 'Lädt...',
    ['error'] = 'Fehler',
    ['success'] = 'Erfolg',
    ['warning'] = 'Warnung',
    ['info'] = 'Information',
    
    -- Debug Messages
    ['player_data_not_available'] = 'Spielerdaten noch nicht verfügbar, versuche erneut...',
    ['configuring_buttons'] = 'Konfiguriere Buttons...',
    ['setting_button'] = 'Setze Button %d: %s mit URL %s',
    ['invalid_button'] = 'Ungültige Button-Konfiguration erkannt.',
    ['no_buttons'] = 'Keine Buttons konfiguriert.',
    ['buttons_disabled'] = 'Buttons sind in der Config deaktiviert.',
    ['rich_presence'] = 'Rich Presence: %s'
}

-- French translations
local fr = {
    -- Discord Rich Presence
    ['player_id'] = 'ID Joueur: %d',
    ['name'] = 'Nom: %s',
    ['job'] = 'Métier: %s',
    ['players_online'] = 'Joueurs En Ligne: %d',
    ['vehicle'] = 'Véhicule: %s',
    ['health'] = 'Santé: %d',
    ['armor'] = 'Armure: %d',
    ['location'] = 'Position: %s',
    ['street'] = 'Rue: %s',
    ['ping'] = 'Ping: %d ms',
    ['ping_na'] = 'Ping: N/A',
    ['on_foot'] = 'À Pied',
    
    -- General Terms
    ['no_job'] = 'Sans Emploi',
    ['unknown'] = 'Inconnu',
    ['loading'] = 'Chargement...',
    ['error'] = 'Erreur',
    ['success'] = 'Succès',
    ['warning'] = 'Avertissement',
    ['info'] = 'Information',
    
    -- Debug Messages
    ['player_data_not_available'] = 'Données du joueur pas encore disponibles, nouvelle tentative...',
    ['configuring_buttons'] = 'Configuration des boutons...',
    ['setting_button'] = 'Configuration du bouton %d: %s avec URL %s',
    ['invalid_button'] = 'Configuration de bouton invalide détectée.',
    ['no_buttons'] = 'Aucun bouton configuré.',
    ['buttons_disabled'] = 'Les boutons sont désactivés dans la configuration.',
    ['rich_presence'] = 'Rich Presence: %s'
}

-- Spanish translations
local es = {
    -- Discord Rich Presence
    ['player_id'] = 'ID Jugador: %d',
    ['name'] = 'Nombre: %s',
    ['job'] = 'Trabajo: %s',
    ['players_online'] = 'Jugadores Online: %d',
    ['vehicle'] = 'Vehículo: %s',
    ['health'] = 'Salud: %d',
    ['armor'] = 'Armadura: %d',
    ['location'] = 'Ubicación: %s',
    ['street'] = 'Calle: %s',
    ['ping'] = 'Ping: %d ms',
    ['ping_na'] = 'Ping: N/A',
    ['on_foot'] = 'A Pie',
    
    -- General Terms
    ['no_job'] = 'Sin Trabajo',
    ['unknown'] = 'Desconocido',
    ['loading'] = 'Cargando...',
    ['error'] = 'Error',
    ['success'] = 'Éxito',
    ['warning'] = 'Advertencia',
    ['info'] = 'Información',
    
    -- Debug Messages
    ['player_data_not_available'] = 'Datos del jugador aún no disponibles, reintentando...',
    ['configuring_buttons'] = 'Configurando botones...',
    ['setting_button'] = 'Configurando botón %d: %s con URL %s',
    ['invalid_button'] = 'Configuración de botón inválida detectada.',
    ['no_buttons'] = 'No hay botones configurados.',
    ['buttons_disabled'] = 'Los botones están deshabilitados en la configuración.',
    ['rich_presence'] = 'Rich Presence: %s'
}

function _(key, ...)
    local locale = Config.Locale or 'en'
    local translations = en -- Default to English
    
    if locale == 'de' then
        translations = de
    elseif locale == 'fr' then
        translations = fr
    elseif locale == 'es' then
        translations = es
    end
    
    local phrase = translations[key] or key
    
    if ... then
        return string.format(phrase, ...)
    end
    
    return phrase
end
