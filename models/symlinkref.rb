class Semlinkref
  include DataMapper::Resource
  storage_names[:default]='semlinkref'
  property :synset1id,  Integer, :key => true, :writer => :protected
  property :synset2id,  Integer, :key => true, :writer => :protected
  property :linkid,     Integer, :key => true, :writer => :protected
end