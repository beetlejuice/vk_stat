class Settings
  @@settings = YAML::load_file(File.expand_path('../../config/settings.yml', __FILE__))

  def self.vk_login
    @@settings['vk_login']
  end

  def self.vk_password
    @@settings['vk_password']
  end
end