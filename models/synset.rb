class Synset
  include DataMapper::Resource
  storage_names[:default]='synset'
  property :synsetid,   Integer, :key => true
  property :categoryid, Integer
  property :definition, String
  property :pos,        String
  belongs_to  :categorydef, :child_key => [:categoryid]
  has n,      :samples,     :child_key => [:synsetid]
  has n,      :senses,      :child_key => [:synsetid]
end