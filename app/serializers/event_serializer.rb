class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :event_name, :url, :poster, :start_time, :venue
end
