require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-validations'
require 'sass'
require 'logger'

Dir.glob(File.join(File.dirname(__FILE__), 'models/*.rb')).each {|f| require f }

configure :development do
  DataMapper.setup(:default, {
    :host     => 'localhost', 
    :adapter  => 'mysql',
    :database => 'wordnet30_development',
    :username => 'rails',
    :password => 'rails4242' })
    
  DataMapper::Logger.new(STDOUT, :debug)
end

configure :production do
  DataMapper.setup(:default, {
    :host     => 'localhost', 
    :adapter  => 'mysql',
    :database => 'wordnet30',
    :username => 'rails',
    :password => 'rails4242' })
end

configure :test do
  DataMapper.setup(:default, {
    :host     => 'localhost', 
    :adapter  => 'mysql',
    :database => 'wordnet30_development',
    :username => 'rails',
    :password => 'rails4242' })
end

get '/' do
  @word ||= Word.first(:lemma => 'hello')
  haml :index
end

post '/' do
  @word = Word.first(:lemma => params[:lemma])
  haml :index
end

get '/stylesheets/style.css' do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass :style
end
