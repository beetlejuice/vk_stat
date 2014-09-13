class Person
  include DataMapper::Resource

  property :id,         Serial
  property :first_name, String
  property :last_name,  String
  property :vk_id,      String

  has n, :logs

  def full_name
    self[:first_name] + ' ' + self[:last_name]
  end
end