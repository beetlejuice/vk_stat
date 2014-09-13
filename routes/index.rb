get '/' do
  @title = 'Tracked people'
  @people = Person.all(:order => [ :last_name.asc ])
  slim :index
end

post '/add_user' do
  full_name_h = Parser.instance.get_user_name(params[:vk_id])
  full_name = full_name_h.values.join(' ')
  person = Person.new :first_name => full_name_h[:first_name],
                      :last_name  => full_name_h[:last_name],
                      :vk_id      => params[:vk_id]
  if person.save
    flash[:result] = "User #{full_name} was successfuly added!"
  else
    flash[:result] = "Error! User #{full_name} was not added."
  end
  redirect '/'
end

post '/add_friends' do
  full_name_h = Parser.instance.get_user_name(params[:vk_id])
  full_name = full_name_h.values.join(' ')
  friends = Parser.instance.get_friends(params[:vk_id])
  unless friends.empty?
    friends.each do |friend|
      first_name = friend['first_name']
      last_name = friend['last_name']
      id = friend['id']
      Person.create :first_name => first_name,
                    :last_name  => last_name,
                    :vk_id      => id
    end
  else
    flash[:result] = "Error! User #{full_name} was has no friends."
  end
  redirect '/'
end