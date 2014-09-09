require 'sinatra'
require 'sinatra/reloader' if development?
require 'rack-flash'
require 'data_mapper'
require 'dm-migrations'
require 'slim'

enable :sessions
use Rack::Flash

configure :development do
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(
      :default,
      'mysql://root:root@localhost/vk_stat'
  )

  register Sinatra::Reloader
  also_reload "models/*.rb"
  also_reload "views/*.rb"
  also_reload "classes/*.rb"
end

# configure :production do
#   DataMapper.setup(
#       :default,
#       'postgres://postgres:12345@localhost/sinatra_service'
#   )
# end

require './models/init'
require './routes/init'
require './classes/init'

DataMapper.finalize.auto_upgrade!