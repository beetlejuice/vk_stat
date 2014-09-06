class Log
  include DataMapper::Resource

  property :id,     Serial
  property :person, String
  property :time,   DateTime

  belongs_to :person
end