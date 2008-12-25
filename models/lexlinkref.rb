class Lexlinkref
  include DataMapper::Resource
  storage_names[:default]='lexlinkref'
  property :synset1id,  Integer,  :key => true, :writer => :protected
  property :word1id,    Integer,  :key => true, :writer => :protected
  property :synset2id,  Integer,  :key => true, :writer => :protected
  property :word2id,    Integer,  :key => true, :writer => :protected
  property :linkid,     Integer,  :key => true, :writer => :protected
end