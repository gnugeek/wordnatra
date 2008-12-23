require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-validations'
require 'sass'
require 'logger'

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

class Casedword
  include DataMapper::Resource
  storage_names[:default]='casedword'
  property :wordid, Integer, :key => true
  property :lemma,  String
  has 1, :sense, :child_key => [:casedwordid]
end

class Wordposition
  include DataMapper::Resource
  storage_names[:default]='wordposition'
  property :synsetid, Integer, :key => true
  property :wordid,   Integer, :key => true
  belongs_to :sense, :child_key => [:synsetid, :wordid]
end

class Sample
  include DataMapper::Resource
  storage_names[:default]='sample'
  property :sampleid, Integer, :key => true
  property :synsetid, Integer, :key => true
  property :sample,   String
  belongs_to :synset, :child_key => [:synsetid]
end

class Word
  include DataMapper::Resource
  storage_names[:default]='word'
  property :wordid, Integer, :key => true
  property :lemma,  String
  has n, :senses,   :child_key => [:wordid]
  has n, :synsets,  :through => :senses, :child_key => [:wordid]
end

class Sense
  include DataMapper::Resource
  storage_names[:default]='sense'
  property :synsetid,     Integer, :key => true
  property :wordid,       Integer, :key => true
  property :tagcount,     Integer
  property :casedwordid,  Integer
  property :lexid,        Integer
  property :rank,         Integer
  belongs_to :word,       :child_key => [:wordid]
  belongs_to :synset,     :child_key => [:synsetid]
end

class Synset
  include DataMapper::Resource
  storage_names[:default]='synset'
  property :synsetid,   Integer, :key => true
  property :categoryid, Integer
  property :definition, String
  property :pos,        String
  belongs_to  :categorydef, :child_key => [:categoryid]
  has n,      :samples,     :child_key => [:synsetid]
  has n,      :senses,      :child_key => [:synsetid]
end

class Categorydef
  include DataMapper::Resource
  storage_names[:default]='categorydef'
  property :categoryid, Integer, :key => true
  property :name,       String
  property :pos,        String
end

class Semlinkref
  include DataMapper::Resource
  storage_names[:default]='semlinkref'
  property :synset1id,  Integer, :key => true
  property :synset2id,  Integer, :key => true
  property :linkid,     Integer, :key => true
end

class Lexlinkref
  include DataMapper::Resource
  storage_names[:default]='lexlinkref'
  property :synset1id,  Integer,  :key => true
  property :word1id,    Integer,  :key => true
  property :synset2id,  Integer,  :key => true
  property :word2id,    Integer,  :key => true
  property :linkid,     Integer,  :key => true
end

class Linkdef
  include DataMapper::Resource
  storage_names[:default]='linkdef'
  property :linkid,   Integer, :key => true
  property :name,     String
  property :recurses, Boolean
end

class Morphref
  include DataMapper::Resource
  storage_names[:morphref]
  property :wordid,   Integer,  :key => true
  property :pos,      String,   :key => true
  property :morphid,  Integer,  :key => true
end

class Morphdef
  include DataMapper::Resource
  storage_names[:morphdef]
  property :morphid,  Integer, :key => true
  property :lemma,    String
end

class Frameref
  include DataMapper::Resource
  storage_names[:frameref]
  property :synsetid, Integer, :key => true
  property :wordid,   Integer, :key => true
  property :frameid,  Integer, :key => true
end

class Framedef
  include DataMapper::Resource
  storage_names[:framedef]
  property :frameid,  Integer, :key => true
  property :frame,    String
end

class Sentenceref
  include DataMapper::Resource
  storage_names[:sentenceref]
  property :synsetid,   Integer, :key => true
  property :wordid,     Integer, :key => true
  property :sentenceid, Integer, :key => true
end

class Sentencedef
  include DataMapper::Resource
  storage_names[:sentencedef]
  property :sentenceid, Integer, :key => true
  property :sentence,   String
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
