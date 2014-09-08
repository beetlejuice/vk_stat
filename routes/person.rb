get '/person/:id' do
  @person = Person.get(params[:id])
  @logs = @person.logs
  @title = @person.name
  slim :'person'
end

delete '/person/:id' do
  Person.get(params[:id]).destroy
  redirect '/'
end