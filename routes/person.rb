get '/person/:id' do
  @person = Person.get(params[:id])
  @logs = @person.logs
  @title = @person.full_name
  slim :'person'
end

delete '/person/:id' do
  unless params[:id] == 'all'
    person = Person.get(params[:id])
    person.logs.destroy
    person.destroy
  else
    Log.destroy
    Person.destroy
  end
  redirect '/'
end