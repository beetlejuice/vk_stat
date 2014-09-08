class Log
  include DataMapper::Resource

  property :id,        Serial
  property :online_at, DateTime

  belongs_to :person
end