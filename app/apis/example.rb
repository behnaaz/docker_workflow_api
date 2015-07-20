require 'rack/contrib'

module Example
  class API < Grape::API
    version 'v1'
    format :json
    rescue_from :all
    
    get 'health' do
      {health: 'ok'}
    end

    route :any, '*path' do
      {error: 'no route found', message: 'none'}
    end
  end
end