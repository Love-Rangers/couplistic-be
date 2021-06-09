class WeatherFacade
  def self.get_three_day_forecast(q)
    body = WeatherService.get_three_day_forecast_db(q)
    body[:next_full_moon] = FullMoonHelper.next_full_moon
    
    if body[:location][:name] == q
      Weather.new(body)
    else
      "No matching location found."
    end
  end
end
