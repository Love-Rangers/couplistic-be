class WeatherFacade
  def self.get_three_day_forecast
    body = WeatherService.get_three_day_forecast_db
    require 'pry'; binding.pry
    Weather.new(body)
  end
end