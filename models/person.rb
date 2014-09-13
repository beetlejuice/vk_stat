class Person
  include DataMapper::Resource

  property :id,      Serial
  property :vk_name, String
  property :vk_id,   String

  has n, :logs
end