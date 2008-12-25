class Categorydef
  include DataMapper::Resource
  storage_names[:default]='categorydef'
  property :categoryid, Integer, :key => true, :writer => :protected
  property :name,       String, :writer => :protected
  property :pos,        String, :writer => :protected
end
