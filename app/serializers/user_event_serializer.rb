class UserEventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :start_time, :location, :user_id
end
