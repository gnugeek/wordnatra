class Frameref
  include DataMapper::Resource
  storage_names[:frameref]
  property :synsetid, Integer, :key => true, :writer => :protected
  property :wordid,   Integer, :key => true, :writer => :protected
  property :frameid,  Integer, :key => true, :writer => :protected
end