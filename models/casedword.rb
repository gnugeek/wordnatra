class Casedword
  include DataMapper::Resource
  storage_names[:default]='casedword'
  property :wordid, Integer, :key => true
  property :lemma,  String
  has 1, :sense, :child_key => [:casedwordid]
end