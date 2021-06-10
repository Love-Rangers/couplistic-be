class TicketMaster
  attr_reader :event_name,
              :url,
              :poster,
              :start_time,
              :venue,
              :id

  def initialize(data)
    @event_name = data[:name]
    @url = data[:url]
    @poster = data[:images][0][:url]
    @start_time = data[:sales][:public][:startDateTime]
    @venue = data[:_embedded][:venues][0][:name]
    @id = data[:id]
  end
end
