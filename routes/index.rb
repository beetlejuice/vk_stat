get '/' do
  @title = 'Tracked people'
  @people = Person.all
  slim :index
end