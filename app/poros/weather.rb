class Weather
  attr_reader :sunrise_time,
              :sunset_time,
              :moonphase,
              :moon_rise_time,
              :moon_set_time,
              :forecast_condition,
              :forecast_icon,
              :moon_illumination_grade

  def initialize(weather_data)
    @sunrise_time = weather_data[:forecast][:forecastday][0][:astro][:sunrise]
    @sunset_time = weather_data[:forecast][:forecastday][0][:astro][:sunset]
    @moonphase = weather_data[:forecast][:forecastday][0][:astro][:moon_phase]
    # @next_full_moon = weather_data[:]
    @moon_rise_time = weather_data[:forecast][:forecastday][0][:astro][:moonrise]
    @moon_set_time = weather_data[:forecast][:forecastday][0][:astro][:moonset]
    @forecast_days = weather_data[:forecast][:forecastday]
  end

  def forecast_condition
    @forecast_days.map do |d|
      d[:day][:condition][:text]
    end
  end

  def forecast_icon
    @forecast_days.map do |d|
      d[:day][:condition][:icon]
    end
  end

  def moon_illumination_grade
    @forecast_days.map do |d|
      d[:astro][:moon_illumination]
    end
  end
end