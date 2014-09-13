class Settings
  attr_reader :vk_login, :vk_password

  @@settings = YAML::load_file('../config/config.yml')

  def vk_login
    @@settings['vk_login']
  end

  def vk_password
    @@settings['vk_password']
  end
end