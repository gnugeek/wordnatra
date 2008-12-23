class Semlinkref
  include DataMapper::Resource
  storage_names[:default]='semlinkref'
  property :synset1id,  Integer, :key => true
  property :synset2id,  Integer, :key => true
  property :linkid,     Integer, :key => true
end