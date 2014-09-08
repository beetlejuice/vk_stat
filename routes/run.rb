get '/run' do
  Collector.run
  flash[:result] = 'Run complete!'
  redirect '/'
end