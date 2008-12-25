class Linkdef
  include DataMapper::Resource
  storage_names[:default]='linkdef'
  property :linkid,   Integer, :key => true, :writer => :protected
  property :name,     String, :writer => :protected
  property :recurses, Boolean, :writer => :protected
end