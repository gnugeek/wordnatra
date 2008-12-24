class Sense
  include DataMapper::Resource
  storage_names[:default]='sense'
  property :synsetid,     Integer, :key => true
  property :wordid,       Integer, :key => true
  property :tagcount,     Integer
  property :casedwordid,  Integer
  property :lexid,        Integer
  property :rank,         Integer
  belongs_to  :word,       :child_key => [:wordid]
  belongs_to  :synset,     :child_key => [:synsetid]
  has n,      :wordpositions, :child_key => [:synsetid, :wordid]
end