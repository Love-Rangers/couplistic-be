require 'rails_helper'

RSpec.describe 'weather object' do
  it 'abstracts and encapsulates weather data that can be read' do
    weather = Weather.new(weather_poro)

    expect(weather).to be_a(Weather)

    expect(weather.sunrise_time).to eq("05:33 AM")
    expect(weather.sunset_time).to eq("08:25 PM")
    expect(weather.moonphase).to eq("Waning Crescent")
    expect(weather.moon_rise_time).to eq("03:11 AM")
    expect(weather.moon_set_time).to eq("04:06 PM")

    expect(weather.forecast_condition).to be_an(Array)
    expect(weather.forecast_condition.first).to eq("Patchy rain possible")
    expect(weather.forecast_condition[1]).to eq("Moderate rain")
    expect(weather.forecast_condition[2]).to eq("Patchy rain possible")

    expect(weather.forecast_icon).to be_an(Array)
    expect(weather.forecast_icon.first).to eq("//cdn.weatherapi.com/weather/64x64/day/176.png")
    expect(weather.forecast_icon[1]).to eq("//cdn.weatherapi.com/weather/64x64/day/302.png")
    expect(weather.forecast_icon[2]).to eq("//cdn.weatherapi.com/weather/64x64/day/176.png")
    
    expect(weather.moon_illumination_grade).to be_an(Array)
    expect(weather.moon_illumination_grade.first).to eq("21")
    expect(weather.moon_illumination_grade[1]).to eq("14")
    expect(weather.moon_illumination_grade[2]).to eq("7")
  end
end