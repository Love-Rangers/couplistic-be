class WeatherFacade
  def self.get_three_day_forecast(q)
    body = WeatherService.get_three_day_forecast_db(q)
    body[:next_full_moon] = FullMoonHelper.next_full_moon
    
    if body[:error][:message] == "No matching location found."
      "No matching location found."
    else
      Weather.new(body)
    end
  end
end
