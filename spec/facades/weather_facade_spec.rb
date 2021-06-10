require 'rails_helper'

RSpec.describe 'weather facade' do
  it 'can return a weather object', :vcr do
    search_details = "Denver"
    weather = WeatherFacade.get_three_day_forecast(search_details)

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
