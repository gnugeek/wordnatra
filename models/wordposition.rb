class Wordposition
  include DataMapper::Resource
  storage_names[:default]='wordposition'
  property :synsetid, Integer, :key => true, :writer => :protected
  property :wordid,   Integer, :key => true, :writer => :protected
  belongs_to :sense, :child_key => [:synsetid, :wordid]
end