class Weather
  attr_reader :sunrise_time,
              :sunset_time,
              :moonphase,
              :moon_rise_time,
              :moon_set_time,
              :forecast_condition,
              :forecast_icon,
              :moon_illumination_grade,
              :id
  def initialize(weather_data)
    @id                       = nil
    @sunrise_time             = weather_data[:forecast][:forecastday][0][:astro][:sunrise]
    @sunset_time              = weather_data[:forecast][:forecastday][0][:astro][:sunset]
    @moonphase                = weather_data[:forecast][:forecastday][0][:astro][:moon_phase]
    @moon_rise_time           = weather_data[:forecast][:forecastday][0][:astro][:moonrise]
    @moon_set_time            = weather_data[:forecast][:forecastday][0][:astro][:moonset]
    @forecast_condition       = forecast_condition_attr(weather_data)
    @forecast_icon            = forecast_icon_attr(weather_data)
    @moon_illumination_grade  = moon_illumination_grade_attr(weather_data)
  end
  def forecast_condition_attr(weather_data)
    weather_data[:forecast][:forecastday].map do |d|
      d[:day][:condition][:text]
    end
  end
  def forecast_icon_attr(weather_data)
    weather_data[:forecast][:forecastday].map do |d|
      d[:day][:condition][:icon]
    end
  end
  def moon_illumination_grade_attr(weather_data)
    weather_data[:forecast][:forecastday].map do |d|
      d[:astro][:moon_illumination]
    end
  end
end
