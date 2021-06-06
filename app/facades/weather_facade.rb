class WeatherFacade
  def self.get_three_day_forecast(q)
    body = WeatherService.get_three_day_forecast_db(q)
    
    Weather.new(body)
  end
end
