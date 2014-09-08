get '/' do
  @title = 'Tracked people'
  @people = Person.all
  slim :index
end

post '/' do
  person_name = Parser.instance.get_user_name(params[:vk_id])
  person = Person.new :name => person_name, :vk_id => params[:vk_id]
  if person.save
    flash[:result] = "User #{person_name} was successfuly added!"
  else
    flash[:result] = "Error! User #{person_name} was not added."
  end
  redirect '/'
end