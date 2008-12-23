class Sentenceref
  include DataMapper::Resource
  storage_names[:sentenceref]
  property :synsetid,   Integer, :key => true
  property :wordid,     Integer, :key => true
  property :sentenceid, Integer, :key => true
end