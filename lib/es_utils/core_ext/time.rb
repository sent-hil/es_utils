require "time"

class Time
  # Returns time in format `2014-06-29T18:26:54-07:00`
  def kibana
    self.strftime("%FT%T%:z")
  end

  def logstash
    self.strftime("%Y.%m.%d")
  end
end
