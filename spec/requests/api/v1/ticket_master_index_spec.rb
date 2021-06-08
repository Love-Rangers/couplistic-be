require 'rails_helper'

RSpec.describe "ticket master API" do
  describe "search by keyword and city" do
    it "can return events for Red Rocks, Morrison" do
      VCR.use_cassette('Morrison_RedRocks') do

        keyword_query = "Red Rocks"
        city_query    =  "Morrison"

        get "/api/v1/ticketmaster?keyword=#{keyword_query}&city=#{city_query}"
        
        expect(response).to be_successful

        events = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(events.count).to eq(5)

        events.each do |event|
          expect(event).to be_a(Hash)

          expect(event).to have_key :id
          expect(event[:id]).to be_a(String)
          
          expect(event).to have_key :type
          expect(event[:type]).to be_a(String)
          
          expect(event).to have_key :attributes
          expect(event[:attributes]).to be_a(Hash)
          
          expect(event[:attributes]).to have_key :event_name
          expect(event).to have_key :attributes
          
          expect(event[:attributes]).to have_key :url
          expect(event[:attributes][:url]).to be_a(String)
          
          expect(event[:attributes]).to have_key :poster
          expect(event[:attributes][:poster]).to be_a(String)
          
          expect(event[:attributes]).to have_key :start_time
          expect(event[:attributes][:start_time]).to be_a(String)
          
          expect(event[:attributes]).to have_key :venue
          expect(event[:attributes][:venue]).to be_a(String)
        end
      end
    end
  end
end