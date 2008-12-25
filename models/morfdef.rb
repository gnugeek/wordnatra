class Morphdef
  include DataMapper::Resource
  storage_names[:morphdef]
  property :morphid,  Integer, :key => true, :writer => :protected
  property :lemma,    String, :writer => :protected
end