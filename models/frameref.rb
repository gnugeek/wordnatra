class Frameref
  include DataMapper::Resource
  storage_names[:frameref]
  property :synsetid, Integer, :key => true
  property :wordid,   Integer, :key => true
  property :frameid,  Integer, :key => true
end