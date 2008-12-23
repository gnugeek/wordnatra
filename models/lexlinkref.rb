class Lexlinkref
  include DataMapper::Resource
  storage_names[:default]='lexlinkref'
  property :synset1id,  Integer,  :key => true
  property :word1id,    Integer,  :key => true
  property :synset2id,  Integer,  :key => true
  property :word2id,    Integer,  :key => true
  property :linkid,     Integer,  :key => true
end