require 'rails_helper'

RSpec.describe "Events" do
  describe "it can create an event record" do
    params = {
                :event_name => "STS9: Red Rocks 2021 (Sky World)",
                :user_id => 1,
                "start_time": "2020-02-21T17:00:00Z",
                "venue": "Red Rocks Amphitheatre"
            }

  end
end
