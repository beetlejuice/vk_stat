task :environment do
  require File.expand_path('main', File.dirname(__FILE__))
end

task :collect => :environment do
  Collector.run
end