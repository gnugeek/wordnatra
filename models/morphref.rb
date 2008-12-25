class Morphref
  include DataMapper::Resource
  storage_names[:morphref]
  property :wordid,   Integer,  :key => true, :writer => :protected
  property :pos,      String,   :key => true, :writer => :protected
  property :morphid,  Integer,  :key => true, :writer => :protected
end