class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :location, :user_id, :start_time
end
