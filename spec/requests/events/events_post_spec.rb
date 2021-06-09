require 'rails_helper'

RSpec.describe 'POST api/v1/events' do
  it "happy path: it can create an event record" do
    params = {
      "location"=>"red rocks",
      "name"=>"Jax",
      "start_time"=>"2021-06-03T16:00:00Z",
      "user_id"=>"2"
    }
    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/events', headers: headers, params: JSON.generate(params)
    created_event = Event.last
    expect(response).to be_successful
    expect(created_event.location).to eq("red rocks")
    expect(created_event.name).to eq("Jax")
    expect(created_event.start_time).to eq('Thu, 03 Jun 2021 16:00:00 UTC +00:00')
    expect(created_event.user_id).to eq(2)
  end
end
