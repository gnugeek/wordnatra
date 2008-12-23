class Wordposition
  include DataMapper::Resource
  storage_names[:default]='wordposition'
  property :synsetid, Integer, :key => true
  property :wordid,   Integer, :key => true
  belongs_to :sense, :child_key => [:synsetid, :wordid]
end