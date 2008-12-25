class Sentenceref
  include DataMapper::Resource
  storage_names[:sentenceref]
  property :synsetid,   Integer, :key => true, :writer => :protected
  property :wordid,     Integer, :key => true, :writer => :protected
  property :sentenceid, Integer, :key => true, :writer => :protected
end