class Sentencedef
  include DataMapper::Resource
  storage_names[:sentencedef]
  property :sentenceid, Integer, :key => true
  property :sentence,   String
end