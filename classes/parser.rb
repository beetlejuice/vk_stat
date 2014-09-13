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
    @app.client_auth(login: Settings.vk_login, password: Settings.vk_password)
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
    user = self.get_users([user_id]).first
    {:first_name => user['first_name'], :last_name => user['last_name']}
  end
end