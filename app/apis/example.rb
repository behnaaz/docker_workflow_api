require 'rack/contrib'

module Example
  class API < Grape::API
    version 'v1'
    format :json
    rescue_from :all
    
    get 'health' do
      {health: 'ok'}
    end

    get 'players' do
      players = Player.all
      present players, with: Example::Entities::Player
    end

    route :any, '*path' do
      {error: 'no route found', message: 'none'}
    end
  end
end