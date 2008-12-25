class Synset
  include DataMapper::Resource
  storage_names[:default]='synset'
  property :synsetid,   Integer, :key => true, :writer => :protected
  property :categoryid, Integer, :writer => :protected
  property :definition, String, :writer => :protected
  property :pos,        String, :writer => :protected
  belongs_to  :categorydef, :child_key => [:categoryid]
  has n,      :samples,     :child_key => [:synsetid]
  has n,      :senses,      :child_key => [:synsetid]
end