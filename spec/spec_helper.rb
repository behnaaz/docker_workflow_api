ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'simplecov'
require 'factory_girl'
require 'database_cleaner'


FactoryGirl.definition_file_paths = %w(./spec/factories ./api/spec/factories)
FactoryGirl.find_definitions

#SimpleCov.minimum_coverage 90
SimpleCov.start do
  add_filter "/spec\/.*/"
end

begin
  Dir['./api/spec/support/**/*.rb'].each { |f| require f }
  require './api/config/environment'
rescue LoadError
  Dir['./spec/support/**/*.rb'].each { |f| require f }
  require './config/environment'
end

def app
  Example::API
end


RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Rack::Test::Methods
  config.include Requests::JsonHelpers
  
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end