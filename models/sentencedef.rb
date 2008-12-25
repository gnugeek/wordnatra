class Sentencedef
  include DataMapper::Resource
  storage_names[:sentencedef]
  property :sentenceid, Integer, :key => true, :writer => :protected
  property :sentence,   String, :writer => :protected
end