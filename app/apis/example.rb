require 'rack/contrib'

module Example
  class API < Grape::API
    version 'v1'
    format :json
    rescue_from :all
    
    get 'health' do
      {health: 'ok'}
    end

    get 'quotes' do
      quotes = Quote.all
      present quotes, with: Example::Entities::Quote
    end

    route :any, '*path' do
      {error: 'no route found', message: 'none'}
    end
  end
end