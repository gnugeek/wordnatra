class Categorydef
  include DataMapper::Resource
  storage_names[:default]='categorydef'
  property :categoryid, Integer, :key => true
  property :name,       String
  property :pos,        String
end
