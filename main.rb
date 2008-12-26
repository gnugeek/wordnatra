require 'init.rb'

get '/' do
  haml :index
end

post '/' do
  redirect "word/#{params[:lemma]}"
end

get '/word/:lemma' do
  @word = Word.first(:lemma => params[:lemma])
  haml :word
end

get '/stylesheets/style.css' do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass :style
end