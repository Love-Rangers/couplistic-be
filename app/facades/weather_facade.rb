class WeatherFacade
<<<<<<< HEAD
  def self.get_three_day_forecast
    body = WeatherService.get_three_day_forecast_db
    require 'pry'; binding.pry
=======
  def self.get_three_day_forecast(q)
    body = WeatherService.get_three_day_forecast_db(q)
>>>>>>> de214692b3f4984ffbb635968f7259724425582d
    Weather.new(body)
  end
end
