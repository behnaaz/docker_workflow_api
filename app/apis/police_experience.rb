require_relative 'scenes'
require_relative 'traces'
require_relative 'experiences'
require_relative 'player'
require_relative 'assignments'
require_relative 'hint'
require_relative 'stats'

require 'rack/contrib'

module PoliceExperience
  class API < Grape::API
    version 'v1'
    use Rack::JSONP
    format :json
    rescue_from :all
    @@cache_server = ActiveSupport::Cache::MemoryStore.new expires_in: 30.minutes
    @@cache_server.clear

    def self.cache_server
      @@cache_server
    end
    
    mount PoliceExperience::Scenes
    mount PoliceExperience::Traces
    mount PoliceExperience::PlayerStatus
    mount PoliceExperience::Assignments
    mount PoliceExperience::ExperienceInformation
    mount PoliceExperience::Hints
    mount PoliceExperience::Stats
     
    
    get 'health' do
      {health: 'ok'}
    end

    route :any, '*path' do
      {error: 'geen route gevonden', message: 'Je bent lekker bezig! Bij de politie zijn we altijd geinteresseerd in digitale talenten die verder kijken dan de oppervlakte en die ons willen helpen bij de digitale opsporing. Dus white hat hAx0R, maak er politiewerk van.'}
    end
  end
end