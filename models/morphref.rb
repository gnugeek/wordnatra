class Morphref
  include DataMapper::Resource
  storage_names[:morphref]
  property :wordid,   Integer,  :key => true
  property :pos,      String,   :key => true
  property :morphid,  Integer,  :key => true
end