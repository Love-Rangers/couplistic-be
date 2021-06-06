class WeatherService < BaseService
  def self.get_three_day_forecast_db
    response = conn('http://api.weatherapi.com').get('/v1/forecast.json') do |f|
      f.params['key'] = ENV['weather_api_key']
      f.params['q'] = "Denver"
      f.params['days'] = 3
    end
    format_json(response)
  end
end
