class Word
  include DataMapper::Resource
  storage_names[:default]='word'
  property :wordid, Integer, :key => true
  property :lemma,  String
  has n, :senses,   :child_key => [:wordid]
  has n, :synsets,  :through => :senses, :child_key => [:wordid]
end