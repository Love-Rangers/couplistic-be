require 'rails_helper'

RSpec.describe 'weather facade' do
  it 'can return a weather object' do
    VCR.use_cassette('Denver') do
      weather = WeatherFacade.get_three_day_forecast
      # stub_request(:get, "http://api.weatherapi.com/v1/forecast.json?days=3&key=65193e43a5804650b16155139210506&q=Denver").
      #     with(
      #       headers: {
      #      'Accept'=>'*/*',
      #      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #      'User-Agent'=>'Faraday v1.4.2'
      #       }).
      #     to_return(status: 200, body: "", headers: {})

      expect(weather).to be_a(Weather)
      expect(weather.sunrise_time).to be_a(String)
      expect(weather.sunset_time).to be_a(String)
      expect(weather.moonphase).to be_a(String)
      expect(weather.moon_rise_time).to be_a(String)
      expect(weather.moon_set_time).to be_a(String)
      expect(weather.forecast_condition).to be_an(Array)
      expect(weather.forecast_condition.first).to be_a(String)
      expect(weather.forecast_icon).to be_an(Array)
      expect(weather.forecast_icon.first).to be_a(String)
      expect(weather.moon_illumination_grade).to be_an(Array)
      expect(weather.moon_illumination_grade.first).to be_a(String)
    end
  end
end
