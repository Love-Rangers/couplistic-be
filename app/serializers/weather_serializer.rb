class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :sunrise_time, :sunset_time, :moonphase, :moon_rise_time, :moon_set_time, :forecast_condition, :forecast_icon, :moon_illumination_grade
end
