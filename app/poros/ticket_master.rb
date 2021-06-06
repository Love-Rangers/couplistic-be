class TicketMaster
  attr_reader :event_name,
              :url,
              :poster,
              :start_time,
              :venue

  def initialize(data)
    @event_name = data[:_embedded][:events][0][:name]
    @url        = data[:_embedded][:events][0][:url]
    @poster     = data[:_embedded][:events][0][:images][2][:url]
    @start_time = data[:_embedded][:events][0][:sales][:public][:startDateTime]
    @venue      = data[:_embedded][:events][0][:_embedded][:venues][0][:name]
  end
end