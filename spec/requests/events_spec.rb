require 'rails_helper'

RSpec.describe "GET '/api/v1/events" do
  it "Happy path: I can retrieve events for current calender month" do
    events = FactoryBot.create_list(:random_event, 5)
    require 'pry'; binding.pry
  end
end
