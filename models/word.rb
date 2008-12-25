class Word
  include DataMapper::Resource
  storage_names[:default]='word'
  property :wordid, Integer, :key => true, :writer => :protected
  property :lemma,  String, :writer => :protected
  has n, :senses,   :child_key => [:wordid]
  has n, :synsets,  :through => :senses, :child_key => [:wordid]
end