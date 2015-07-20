module AuthenticatePlayer
  def current_player
    @current_player ||= ::Player.authorize!(params.access_key)
  end

  def authenticate!
    error!({error: 'speler niet gevonden', message: 'Je bent lekker bezig! Bij de politie zijn we altijd geinteresseerd in digitale talenten die verder kijken dan de oppervlakte en die ons willen helpen bij de digitale opsporing. Dus white hat hAx0R, maak er politiewerk van.'}, 401) unless current_player
  end

  def hack_message fault = 'speler niet gevonden'
     error!({error: fault, message: 'Je bent lekker bezig! Bij de politie zijn we altijd geinteresseerd in digitale talenten die verder kijken dan de oppervlakte en die ons willen helpen bij de digitale opsporing. Dus white hat hAx0R, maak er politiewerk van.'}, 401)
  end

end