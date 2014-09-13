class ChartHelper
  #TODO: Extract iterators
  def self.generate_labels
    start_hour = Settings.chart_start_hour
    end_hour = Settings.chart_end_hour
    interval = Settings.chart_interval
    minutes = []
    0.upto(60.0/interval.ceil - 1) do |i|
      minutes << ':%s0' % i
    end
    (start_hour..end_hour).flat_map { |e| [e].product(minutes) }.map &:join
  end

  def self.prepare_data(person)
    data = []
    start_hour = Settings.chart_start_hour
    end_hour = Settings.chart_end_hour
    interval = Settings.chart_interval
    (start_hour..end_hour).each do |hour|
      0.upto(60.0/interval.ceil - 1) do |i|
        now = Time.now
        time_upper = Time.new(now.year, now.month, now.day, hour, i*10)
        time_lower = time_upper - interval*60
        online_number = person.logs.count(:online_at.gte => time_lower, :online_at.lt => time_upper)
        data << online_number
      end
    end
    data
  end
end