require 'pathname'
require 'bundler'
require 'roar'
require 'grape/roar'
require 'roar/representer'
require 'roar/json'
require 'roar/json/hal'


Bundler.require(:default, ENV['RACK_ENV'] || :production)
ROOT = Pathname.new(File.expand_path('../..', __FILE__))
Grape::ActiveRecord.database_file = ROOT.join('config', 'database.yml')
Dir.glob(ROOT.join('app', 'models', '*.rb')).each { |file| require file }
Dir.glob(ROOT.join('app', 'helpers', '*.rb')).each { |file| require file }
Dir.glob(ROOT.join('app', 'entities', '*.rb')).each { |file| require file }
Dir.glob(ROOT.join('app', 'apis', '*.rb')).each { |file| require file }
