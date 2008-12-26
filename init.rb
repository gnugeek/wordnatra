require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-validations'
require 'dm-serializer'
require 'sass'
require 'logger'
require 'yaml'
require 'helpers'

Dir.glob(File.join(File.dirname(__FILE__), 'models/*.rb')).each {|f| require f }
DBCONFIG = YAML.load_file('database.yml') unless defined?(DBCONFIG)

configure :test do
  DataMapper.setup(:default, {
    :host     => DBCONFIG['test']['host'], 
    :adapter  => DBCONFIG['test']['adapter'],
    :database => DBCONFIG['test']['database'],
    :username => DBCONFIG['test']['username'],
    :password => DBCONFIG['test']['password'] 
    })
end

configure :development do
  DataMapper.setup(:default, {
    :host     => DBCONFIG['development']['host'], 
    :adapter  => DBCONFIG['development']['adapter'],
    :database => DBCONFIG['development']['database'],
    :username => DBCONFIG['development']['username'],
    :password => DBCONFIG['development']['password'] 
    })
end

configure :production do
  DataMapper.setup(:default, {
    :host     => DBCONFIG['production']['host'], 
    :adapter  => DBCONFIG['production']['adapter'],
    :database => DBCONFIG['production']['database'],
    :username => DBCONFIG['production']['username'],
    :password => DBCONFIG['production']['password'] 
    })
end
