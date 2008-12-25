class Casedword
  include DataMapper::Resource
  storage_names[:default]='casedword'
  property :wordid, Integer, :key => true, :writer => :protected
  property :lemma,  String, :writer => :protected
  has 1, :sense, :child_key => [:casedwordid]
end