get '/' do
  @title = 'Tracked people'
  @people = Person.all
  slim :index
end

post '/add_user' do
  name = Parser.instance.get_user_name(params[:vk_id])
  person = Person.new :vk_name => name, :vk_id => params[:vk_id]
  if person.save
    flash[:result] = "User #{name} was successfuly added!"
  else
    flash[:result] = "Error! User #{name} was not added."
  end
  redirect '/'
end

post '/add_friends' do
  name = Parser.instance.get_user_name(params[:vk_id])
  friends = Parser.instance.get_friends(params[:vk_id])
  unless friends.empty?
    friends.each do |friend|
      name = friend['first_name'] << ' ' << friend['last_name']
      id = friend['id']
      Person.create :vk_name => name, :vk_id => id
    end
  else
    flash[:result] = "Error! User #{name} was has no friends."
  end
  redirect '/'
end