class Morphdef
  include DataMapper::Resource
  storage_names[:morphdef]
  property :morphid,  Integer, :key => true
  property :lemma,    String
end