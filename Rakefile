require 'bundler/setup'
require 'grape/activerecord/rake'

begin
  require './api/config/environment'
rescue LoadError
  require './config/environment'
end


require 'rspec/core/rake_task'

Dir.glob('./lib/tasks/*.rake').each { |r| import r }

RSpec::Core::RakeTask.new(:spec)
task :default => :spec


