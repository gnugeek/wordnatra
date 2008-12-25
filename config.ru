require 'rubygems'
require 'sinatra/lib/sinatra.rb'

Sinatra::Application.default_options.merge!(
  :run => false,
  :env => :production
)

require 'main.rb'
run Sinatra.application
