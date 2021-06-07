require 'rails_helper'

RSpec.describe "ticket master API" do
  describe "search by keyword and city" do
    it "can return events for Red Rocks, Morrison" do
      VCR.use_cassette('Morrison_RedRocks') do

        keyword_query = "Red Rocks"
        city_query    =  "Morrison"

        get "/api/v1/ticketmaster?keyword=#{keyword_query}&city=#{city_query}"
      end
    end
  end
end
