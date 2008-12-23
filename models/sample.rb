class Sample
  include DataMapper::Resource
  storage_names[:default]='sample'
  property :sampleid, Integer, :key => true
  property :synsetid, Integer, :key => true
  property :sample,   String
  belongs_to :synset, :child_key => [:synsetid]
end