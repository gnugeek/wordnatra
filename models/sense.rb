class Sense
  include DataMapper::Resource
  storage_names[:default]='sense'
  property :synsetid,     Integer, :key => true, :writer => :protected
  property :wordid,       Integer, :key => true, :writer => :protected
  property :tagcount,     Integer, :writer => :protected
  property :casedwordid,  Integer, :writer => :protected
  property :lexid,        Integer, :writer => :protected
  property :rank,         Integer, :writer => :protected
  belongs_to  :word,       :child_key => [:wordid]
  belongs_to  :synset,     :child_key => [:synsetid]
  has n,      :wordpositions, :child_key => [:synsetid, :wordid]
end