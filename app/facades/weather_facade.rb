class WeatherFacade
  def self.get_three_day_forecast
    body = WeatherService.get_three_day_forecast_db
    Weather.new(body)
  end
end