class Framedef
  include DataMapper::Resource
  storage_names[:framedef]
  property :frameid,  Integer, :key => true, :writer => :protected
  property :frame,    String, :writer => :protected
end