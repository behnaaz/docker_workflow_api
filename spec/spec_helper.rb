ENV['RACK_ENV'] = 'test'

require 'rack/test'
#require 'simplecov'
require 'factory_girl'
require 'database_cleaner'

Dir['./spec/support/**/*.rb'].each { |f| require f }

FactoryGirl.definition_file_paths = %w(./spec/factories)
FactoryGirl.find_definitions

#SimpleCov.minimum_coverage 90
#SimpleCov.start do
##  add_filter "/spec\/.*/"
#  add_filter "/vendor\/.*/"
#end

begin
  require './api/config/environment'
rescue LoadError
  require './config/environment'
end

ActiveRecord::Base.logger = nil
def app
  PoliceExperience::API
end




RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Rack::Test::Methods
  config.include Requests::JsonHelpers

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end