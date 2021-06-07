require 'rails_helper'

RSpec.describe "weather API" do
  describe "search by location and city" do
    it "can search for weather by Thornton" do
      VCR.use_cassette('Denver') do
        search_details = "Denver"

        get "/api/v1/weather?q=#{search_details}"
      end
    end
  end
end
