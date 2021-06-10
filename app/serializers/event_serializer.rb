class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :event_name, :url, :poster, :venue, :start_time
end
