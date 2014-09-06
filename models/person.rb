class Person
  include DataMapper::Resource

  property :id,    Serial
  property :name,  String
  property :vk_id, String

  has n, :logs
end