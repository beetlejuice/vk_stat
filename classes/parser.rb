class Parser
  require 'singleton'
  require 'vk-ruby'
  require 'open-uri'
  require 'mechanize'

  include Singleton

  def initialize
    VK.configure do |config|
      config.app_id = 4525986
      config.scope = 'friends'
    end

    @app = VK::Application.new
    @app.client_auth(login: 'test', password: 'test')
  end

  def get_friends(id)
    friends = @app.friends.get user_id: id, fields: [:uid]
    friends['items']
  end

  def get_users(ids)
    @app.users.get user_ids: ids, fields: [:online]
  end

  # Helper methods
  def get_user_name(user_id)
    unformatted_name = self.get_users([user_id])
    unformatted_name.first.tap {|e| return e['first_name'] << ' ' << e['last_name'] }
  end
end