require 'rails_helper'

RSpec.describe 'weather service' do
  it 'can return json' do
    # json = WeatherService.get_three_day_forecast_db
    fixture_json = File.read('spec/fixtures/weather_result.json')
    place_id = "Denver"
    stub_request(:get, "http://api.weatherapi.com/v1/forecast.json?days=3&key=65193e43a5804650b16155139210506&q=Denver").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.4.2'
          }).
        to_return(status: 200, body: fixture_json, headers: {})

  json = WeatherService.get_three_day_forecast_db

    expect(json).to be_a(Hash)
    expect(json).to have_key :forecast
    expect(json[:forecast]).to be_a(Hash)
    expect(json[:forecast]).to have_key :forecastday
    expect(json[:forecast][:forecastday]).to be_an(Array)
    expect(json[:forecast][:forecastday].first).to be_a(Hash)

    expect(json[:forecast][:forecastday].first).to have_key :astro
    expect(json[:forecast][:forecastday].first[:astro]).to be_a(Hash)
    expect(json[:forecast][:forecastday].first[:astro]).to have_key :sunrise
    expect(json[:forecast][:forecastday].first[:astro][:sunrise]).to be_a(String)
    expect(json[:forecast][:forecastday].first[:astro]).to have_key :sunset
    expect(json[:forecast][:forecastday].first[:astro][:sunset]).to be_a(String)
    expect(json[:forecast][:forecastday].first[:astro]).to have_key :moonrise
    expect(json[:forecast][:forecastday].first[:astro][:moonrise]).to be_a(String)
    expect(json[:forecast][:forecastday].first[:astro]).to have_key :moonset
    expect(json[:forecast][:forecastday].first[:astro][:moonset]).to be_a(String)
    expect(json[:forecast][:forecastday].first[:astro]).to have_key :moon_phase
    expect(json[:forecast][:forecastday].first[:astro][:moon_phase]).to be_a(String)
    expect(json[:forecast][:forecastday].first[:astro]).to have_key :moon_illumination
    expect(json[:forecast][:forecastday].first[:astro][:moon_illumination]).to be_a(String)
  end
end
