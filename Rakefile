task :environment do
  require File.expand_path('main', File.dirname(__FILE__))
end

task :vk_collect => :environment do
  Collector.run
end