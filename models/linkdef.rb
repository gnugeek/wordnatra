class Linkdef
  include DataMapper::Resource
  storage_names[:default]='linkdef'
  property :linkid,   Integer, :key => true
  property :name,     String
  property :recurses, Boolean
end