class Sample
  include DataMapper::Resource
  storage_names[:default]='sample'
  property :sampleid, Integer, :key => true, :writer => :protected
  property :synsetid, Integer, :key => true, :writer => :protected
  property :sample,   String, :writer => :protected
  belongs_to :synset, :child_key => [:synsetid]
end