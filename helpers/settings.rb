class Settings
  @@settings = YAML::load_file(File.expand_path('../../config/settings.yml', __FILE__))

  def self.vk_login
    @@settings['vk_login']
  end

  def self.vk_password
    @@settings['vk_password']
  end

  def self.chart_start_hour
    @@settings['start_hour']
  end

  def self.chart_end_hour
    @@settings['end_hour']
  end

  def self.chart_interval
    @@settings['interval']
  end
end