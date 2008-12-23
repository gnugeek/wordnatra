class Framedef
  include DataMapper::Resource
  storage_names[:framedef]
  property :frameid,  Integer, :key => true
  property :frame,    String
end