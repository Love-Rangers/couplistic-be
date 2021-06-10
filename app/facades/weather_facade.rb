class WeatherFacade
  def self.get_three_day_forecast(q)
    body = WeatherService.get_three_day_forecast_db(q)
    if body.first.first == :error
      "No matching location found."
    else
      body[:next_full_moon] = FullMoonHelper.next_full_moon
      Weather.new(body)
    end
  end
end
