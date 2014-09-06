get '/friends' do
  @title = 'Friends'
  @friends = Parser.instance.get_friends 4827641
  slim :friends
end