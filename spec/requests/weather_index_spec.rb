require 'rails_helper'

RSpec.describe "weather API" do
  describe "search by location and city" do
    it "can search for weather by Thornton" do
      VCR.use_cassette('Denver') do
        search_details = "Denver"

        get "/api/v1/weather?q=#{search_details}"

        expect(response).to be_successful
        weather_data = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(weather_data).to be_a(Hash)
        expect(weather_data).to have_key :id
        expect(weather_data[:id]).to eq(nil)
        
        expect(weather_data).to have_key :type
        expect(weather_data[:type]).to be_a(String)
        
        expect(weather_data).to have_key :attributes
        expect(weather_data[:attributes]).to be_a(Hash)
        
        expect(weather_data[:attributes]).to have_key :next_full_moon
        expect(weather_data[:attributes][:next_full_moon]).to be_a(Integer)

        expect(weather_data[:attributes]).to have_key :sunrise_time
        expect(weather_data[:attributes][:sunrise_time]).to be_a(String)
        
        expect(weather_data[:attributes]).to have_key :sunset_time
        expect(weather_data[:attributes][:sunset_time]).to be_a(String)
        
        expect(weather_data[:attributes]).to have_key :moonphase
        expect(weather_data[:attributes][:moonphase]).to be_a(String)
        
        expect(weather_data[:attributes]).to have_key :moon_rise_time
        expect(weather_data[:attributes][:moon_rise_time]).to be_a(String)

        expect(weather_data[:attributes]).to have_key :moon_set_time
        expect(weather_data[:attributes][:moon_set_time]).to be_a(String)

        expect(weather_data[:attributes]).to have_key :forecast_condition
        expect(weather_data[:attributes][:forecast_condition]).to be_an(Array)

        expect(weather_data[:attributes]).to have_key :forecast_icon
        expect(weather_data[:attributes][:forecast_icon]).to be_an(Array)
        expect(weather_data[:attributes][:forecast_icon][0]).to be_an(String)
        expect(weather_data[:attributes][:forecast_icon][-1]).to be_an(String)

        expect(weather_data[:attributes]).to have_key :moon_illumination_grade
        expect(weather_data[:attributes][:moon_illumination_grade]).to be_an(Array)
        expect(weather_data[:attributes][:moon_illumination_grade][0]).to be_an(String)
        expect(weather_data[:attributes][:moon_illumination_grade][-1]).to be_an(String)
      end
    end
  end
end