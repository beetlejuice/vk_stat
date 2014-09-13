get '/person/:id' do
  @person = Person.get(params[:id])
  @title = @person.full_name
  @logs = @person.logs
  @labels = ChartHelper.generate_labels
  @data = ChartHelper.prepare_data(@person)
  slim :'person'
end

delete '/person/:id' do
  if params[:id] != 'all'
    person = Person.get(params[:id])
    person.logs.destroy
    person.destroy
  else
    Log.destroy
    Person.destroy
  end
  redirect '/'
end