class Collector
  require 'date'

  def self.run
    people = Person.all
    people_ids = people.map { |person| person.vk_id }
    users = Parser.instance.get_users people_ids
    time_now = DateTime.now
    users.each do |user|
      if user['online'] == 1
        person = people.find { |person| person.vk_id == user['id'].to_s }
        person.logs.create :online_at => time_now
      end
    end
  end
end