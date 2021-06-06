require 'rails_helper'

RSpec.describe "weather API" do
  describe "search by location and city" do
    it "can search for weather by Thornton" do
      location_query = "Thornton"

      get "/api/v1/weather?q=#{location_query}"
    end
  end
end