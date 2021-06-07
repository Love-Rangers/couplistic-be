# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'simplecov'
SimpleCov.start
SimpleCov.add_filter ['spec', 'config', '/app/mailers', 'app/jobs', 'app/channels']

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
#
VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.default_cassette_options = {re_record_interval: 7.days}
  # config.allow_http_connections_when_no_cassette = true
end

def weather_poro
  {
    "location": {
        "name": "Denver",
        "region": "Colorado",
        "country": "United States of America",
        "lat": 39.74,
        "lon": -104.98,
        "tz_id": "America/Denver",
        "localtime_epoch": 1622910569,
        "localtime": "2021-06-05 10:29"
    },
    "current": {
        "last_updated_epoch": 1622909700,
        "last_updated": "2021-06-05 10:15",
        "temp_c": 23.9,
        "temp_f": 75.0,
        "is_day": 1,
        "condition": {
            "text": "Partly cloudy",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
            "code": 1003
        },
        "wind_mph": 4.3,
        "wind_kph": 6.8,
        "wind_degree": 10,
        "wind_dir": "N",
        "pressure_mb": 1014.0,
        "pressure_in": 30.4,
        "precip_mm": 0.0,
        "precip_in": 0.0,
        "humidity": 31,
        "cloud": 25,
        "feelslike_c": 24.7,
        "feelslike_f": 76.5,
        "vis_km": 16.0,
        "vis_miles": 9.0,
        "uv": 6.0,
        "gust_mph": 8.1,
        "gust_kph": 13.0
    },
    "forecast": {
        "forecastday": [
            {
                "date": "2021-06-05",
                "date_epoch": 1622851200,
                "day": {
                    "maxtemp_c": 32.0,
                    "maxtemp_f": 89.6,
                    "mintemp_c": 18.3,
                    "mintemp_f": 64.9,
                    "avgtemp_c": 25.5,
                    "avgtemp_f": 77.9,
                    "maxwind_mph": 14.1,
                    "maxwind_kph": 22.7,
                    "totalprecip_mm": 1.5,
                    "totalprecip_in": 0.06,
                    "avgvis_km": 9.8,
                    "avgvis_miles": 6.0,
                    "avghumidity": 37.0,
                    "daily_will_it_rain": 1,
                    "daily_chance_of_rain": "82",
                    "daily_will_it_snow": 0,
                    "daily_chance_of_snow": "0",
                    "condition": {
                        "text": "Patchy rain possible",
                        "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                        "code": 1063
                    },
                    "uv": 10.0
                },
                "astro": {
                    "sunrise": "05:33 AM",
                    "sunset": "08:25 PM",
                    "moonrise": "03:11 AM",
                    "moonset": "04:06 PM",
                    "moon_phase": "Waning Crescent",
                    "moon_illumination": "21"
                },
                "hour": [
                    {
                        "time_epoch": 1622872800,
                        "time": "2021-06-05 00:00",
                        "temp_c": 21.0,
                        "temp_f": 69.8,
                        "is_day": 0,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
                            "code": 1063
                        },
                        "wind_mph": 6.3,
                        "wind_kph": 10.1,
                        "wind_degree": 234,
                        "wind_dir": "SW",
                        "pressure_mb": 1008.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.1,
                        "precip_in": 0.0,
                        "humidity": 42,
                        "cloud": 80,
                        "feelslike_c": 21.0,
                        "feelslike_f": 69.8,
                        "windchill_c": 21.0,
                        "windchill_f": 69.8,
                        "heatindex_c": 21.0,
                        "heatindex_f": 69.8,
                        "dewpoint_c": 7.5,
                        "dewpoint_f": 45.5,
                        "will_it_rain": 1,
                        "chance_of_rain": "81",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 11.0,
                        "gust_kph": 17.6,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1622876400,
                        "time": "2021-06-05 01:00",
                        "temp_c": 20.2,
                        "temp_f": 68.4,
                        "is_day": 0,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                            "code": 1003
                        },
                        "wind_mph": 6.5,
                        "wind_kph": 10.4,
                        "wind_degree": 234,
                        "wind_dir": "SW",
                        "pressure_mb": 1008.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.1,
                        "precip_in": 0.0,
                        "humidity": 43,
                        "cloud": 59,
                        "feelslike_c": 20.2,
                        "feelslike_f": 68.4,
                        "windchill_c": 20.2,
                        "windchill_f": 68.4,
                        "heatindex_c": 20.2,
                        "heatindex_f": 68.4,
                        "dewpoint_c": 7.3,
                        "dewpoint_f": 45.1,
                        "will_it_rain": 0,
                        "chance_of_rain": "54",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 12.1,
                        "gust_kph": 19.4,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1622880000,
                        "time": "2021-06-05 02:00",
                        "temp_c": 19.5,
                        "temp_f": 67.1,
                        "is_day": 0,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
                            "code": 1063
                        },
                        "wind_mph": 6.7,
                        "wind_kph": 10.8,
                        "wind_degree": 234,
                        "wind_dir": "SW",
                        "pressure_mb": 1008.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 44,
                        "cloud": 38,
                        "feelslike_c": 19.5,
                        "feelslike_f": 67.1,
                        "windchill_c": 19.5,
                        "windchill_f": 67.1,
                        "heatindex_c": 19.5,
                        "heatindex_f": 67.1,
                        "dewpoint_c": 7.0,
                        "dewpoint_f": 44.6,
                        "will_it_rain": 0,
                        "chance_of_rain": "27",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 13.4,
                        "gust_kph": 21.6,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1622883600,
                        "time": "2021-06-05 03:00",
                        "temp_c": 18.7,
                        "temp_f": 65.7,
                        "is_day": 0,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                            "code": 1003
                        },
                        "wind_mph": 6.9,
                        "wind_kph": 11.2,
                        "wind_degree": 234,
                        "wind_dir": "SW",
                        "pressure_mb": 1007.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 46,
                        "cloud": 18,
                        "feelslike_c": 18.7,
                        "feelslike_f": 65.7,
                        "windchill_c": 18.7,
                        "windchill_f": 65.7,
                        "heatindex_c": 18.7,
                        "heatindex_f": 65.7,
                        "dewpoint_c": 6.8,
                        "dewpoint_f": 44.2,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 14.5,
                        "gust_kph": 23.4,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1622887200,
                        "time": "2021-06-05 04:00",
                        "temp_c": 18.6,
                        "temp_f": 65.5,
                        "is_day": 0,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                            "code": 1003
                        },
                        "wind_mph": 6.5,
                        "wind_kph": 10.4,
                        "wind_degree": 237,
                        "wind_dir": "WSW",
                        "pressure_mb": 1008.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 45,
                        "cloud": 14,
                        "feelslike_c": 18.6,
                        "feelslike_f": 65.5,
                        "windchill_c": 18.6,
                        "windchill_f": 65.5,
                        "heatindex_c": 18.6,
                        "heatindex_f": 65.5,
                        "dewpoint_c": 6.6,
                        "dewpoint_f": 43.9,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 13.4,
                        "gust_kph": 21.6,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1622890800,
                        "time": "2021-06-05 05:00",
                        "temp_c": 18.4,
                        "temp_f": 65.1,
                        "is_day": 0,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                            "code": 1003
                        },
                        "wind_mph": 5.8,
                        "wind_kph": 9.4,
                        "wind_degree": 241,
                        "wind_dir": "WSW",
                        "pressure_mb": 1008.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 45,
                        "cloud": 10,
                        "feelslike_c": 18.4,
                        "feelslike_f": 65.1,
                        "windchill_c": 18.4,
                        "windchill_f": 65.1,
                        "heatindex_c": 18.4,
                        "heatindex_f": 65.1,
                        "dewpoint_c": 6.3,
                        "dewpoint_f": 43.3,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 12.3,
                        "gust_kph": 19.8,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1622894400,
                        "time": "2021-06-05 06:00",
                        "temp_c": 18.3,
                        "temp_f": 64.9,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 5.4,
                        "wind_kph": 8.6,
                        "wind_degree": 245,
                        "wind_dir": "WSW",
                        "pressure_mb": 1008.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 45,
                        "cloud": 6,
                        "feelslike_c": 18.3,
                        "feelslike_f": 64.9,
                        "windchill_c": 18.3,
                        "windchill_f": 64.9,
                        "heatindex_c": 18.3,
                        "heatindex_f": 64.9,
                        "dewpoint_c": 6.1,
                        "dewpoint_f": 43.0,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 11.2,
                        "gust_kph": 18.0,
                        "uv": 5.0
                    },
                    {
                        "time_epoch": 1622898000,
                        "time": "2021-06-05 07:00",
                        "temp_c": 21.4,
                        "temp_f": 70.5,
                        "is_day": 1,
                        "condition": {
                            "text": "Sunny",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                            "code": 1000
                        },
                        "wind_mph": 4.0,
                        "wind_kph": 6.5,
                        "wind_degree": 237,
                        "wind_dir": "WSW",
                        "pressure_mb": 1008.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 40,
                        "cloud": 4,
                        "feelslike_c": 21.4,
                        "feelslike_f": 70.5,
                        "windchill_c": 21.4,
                        "windchill_f": 70.5,
                        "heatindex_c": 21.1,
                        "heatindex_f": 70.0,
                        "dewpoint_c": 6.9,
                        "dewpoint_f": 44.4,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 8.1,
                        "gust_kph": 13.0,
                        "uv": 6.0
                    },
                    {
                        "time_epoch": 1622901600,
                        "time": "2021-06-05 08:00",
                        "temp_c": 24.5,
                        "temp_f": 76.1,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 2.9,
                        "wind_kph": 4.7,
                        "wind_degree": 229,
                        "wind_dir": "SW",
                        "pressure_mb": 1007.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 35,
                        "cloud": 2,
                        "feelslike_c": 23.8,
                        "feelslike_f": 74.8,
                        "windchill_c": 24.5,
                        "windchill_f": 76.1,
                        "heatindex_c": 23.8,
                        "heatindex_f": 74.8,
                        "dewpoint_c": 7.7,
                        "dewpoint_f": 45.9,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 4.9,
                        "gust_kph": 7.9,
                        "uv": 6.0
                    },
                    {
                        "time_epoch": 1622905200,
                        "time": "2021-06-05 09:00",
                        "temp_c": 27.6,
                        "temp_f": 81.7,
                        "is_day": 1,
                        "condition": {
                            "text": "Sunny",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                            "code": 1000
                        },
                        "wind_mph": 1.6,
                        "wind_kph": 2.5,
                        "wind_degree": 221,
                        "wind_dir": "SW",
                        "pressure_mb": 1007.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 30,
                        "cloud": 0,
                        "feelslike_c": 26.6,
                        "feelslike_f": 79.9,
                        "windchill_c": 27.6,
                        "windchill_f": 81.7,
                        "heatindex_c": 26.6,
                        "heatindex_f": 79.9,
                        "dewpoint_c": 8.5,
                        "dewpoint_f": 47.3,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 1.8,
                        "gust_kph": 2.9,
                        "uv": 7.0
                    },
                    {
                        "time_epoch": 1622908800,
                        "time": "2021-06-05 10:00",
                        "temp_c": 28.9,
                        "temp_f": 84.0,
                        "is_day": 1,
                        "condition": {
                            "text": "Sunny",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                            "code": 1000
                        },
                        "wind_mph": 3.4,
                        "wind_kph": 5.4,
                        "wind_degree": 184,
                        "wind_dir": "S",
                        "pressure_mb": 1006.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 26,
                        "cloud": 0,
                        "feelslike_c": 27.5,
                        "feelslike_f": 81.5,
                        "windchill_c": 28.9,
                        "windchill_f": 84.0,
                        "heatindex_c": 27.5,
                        "heatindex_f": 81.5,
                        "dewpoint_c": 7.3,
                        "dewpoint_f": 45.1,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 3.8,
                        "gust_kph": 6.1,
                        "uv": 7.0
                    },
                    {
                        "time_epoch": 1622912400,
                        "time": "2021-06-05 11:00",
                        "temp_c": 30.1,
                        "temp_f": 86.2,
                        "is_day": 1,
                        "condition": {
                            "text": "Sunny",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                            "code": 1000
                        },
                        "wind_mph": 5.1,
                        "wind_kph": 8.3,
                        "wind_degree": 147,
                        "wind_dir": "SSE",
                        "pressure_mb": 1005.0,
                        "pressure_in": 30.1,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 23,
                        "cloud": 0,
                        "feelslike_c": 28.3,
                        "feelslike_f": 82.9,
                        "windchill_c": 30.1,
                        "windchill_f": 86.2,
                        "heatindex_c": 28.3,
                        "heatindex_f": 82.9,
                        "dewpoint_c": 6.2,
                        "dewpoint_f": 43.2,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 6.0,
                        "gust_kph": 9.7,
                        "uv": 8.0
                    },
                    {
                        "time_epoch": 1622916000,
                        "time": "2021-06-05 12:00",
                        "temp_c": 31.4,
                        "temp_f": 88.5,
                        "is_day": 1,
                        "condition": {
                            "text": "Sunny",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                            "code": 1000
                        },
                        "wind_mph": 6.9,
                        "wind_kph": 11.2,
                        "wind_degree": 111,
                        "wind_dir": "ESE",
                        "pressure_mb": 1004.0,
                        "pressure_in": 30.1,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 19,
                        "cloud": 0,
                        "feelslike_c": 29.2,
                        "feelslike_f": 84.6,
                        "windchill_c": 31.4,
                        "windchill_f": 88.5,
                        "heatindex_c": 29.2,
                        "heatindex_f": 84.6,
                        "dewpoint_c": 5.0,
                        "dewpoint_f": 41.0,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 8.1,
                        "gust_kph": 13.0,
                        "uv": 8.0
                    },
                    {
                        "time_epoch": 1622919600,
                        "time": "2021-06-05 13:00",
                        "temp_c": 31.6,
                        "temp_f": 88.9,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 7.4,
                        "wind_kph": 11.9,
                        "wind_degree": 95,
                        "wind_dir": "E",
                        "pressure_mb": 1003.0,
                        "pressure_in": 30.1,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 19,
                        "cloud": 8,
                        "feelslike_c": 29.4,
                        "feelslike_f": 84.9,
                        "windchill_c": 31.6,
                        "windchill_f": 88.9,
                        "heatindex_c": 29.4,
                        "heatindex_f": 84.9,
                        "dewpoint_c": 4.9,
                        "dewpoint_f": 40.8,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 8.5,
                        "gust_kph": 13.7,
                        "uv": 8.0
                    },
                    {
                        "time_epoch": 1622923200,
                        "time": "2021-06-05 14:00",
                        "temp_c": 31.8,
                        "temp_f": 89.2,
                        "is_day": 1,
                        "condition": {
                            "text": "Sunny",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                            "code": 1000
                        },
                        "wind_mph": 7.8,
                        "wind_kph": 12.6,
                        "wind_degree": 79,
                        "wind_dir": "E",
                        "pressure_mb": 1002.0,
                        "pressure_in": 30.1,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 18,
                        "cloud": 15,
                        "feelslike_c": 29.6,
                        "feelslike_f": 85.3,
                        "windchill_c": 31.8,
                        "windchill_f": 89.2,
                        "heatindex_c": 29.6,
                        "heatindex_f": 85.3,
                        "dewpoint_c": 4.8,
                        "dewpoint_f": 40.6,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 9.2,
                        "gust_kph": 14.8,
                        "uv": 8.0
                    },
                    {
                        "time_epoch": 1622926800,
                        "time": "2021-06-05 15:00",
                        "temp_c": 32.0,
                        "temp_f": 89.6,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 8.3,
                        "wind_kph": 13.3,
                        "wind_degree": 63,
                        "wind_dir": "ENE",
                        "pressure_mb": 1001.0,
                        "pressure_in": 30.0,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 18,
                        "cloud": 23,
                        "feelslike_c": 29.8,
                        "feelslike_f": 85.6,
                        "windchill_c": 32.0,
                        "windchill_f": 89.6,
                        "heatindex_c": 29.8,
                        "heatindex_f": 85.6,
                        "dewpoint_c": 4.7,
                        "dewpoint_f": 40.5,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 9.6,
                        "gust_kph": 15.5,
                        "uv": 8.0
                    },
                    {
                        "time_epoch": 1622930400,
                        "time": "2021-06-05 16:00",
                        "temp_c": 31.0,
                        "temp_f": 87.8,
                        "is_day": 1,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                            "code": 1063
                        },
                        "wind_mph": 8.3,
                        "wind_kph": 13.3,
                        "wind_degree": 144,
                        "wind_dir": "SE",
                        "pressure_mb": 1002.0,
                        "pressure_in": 30.1,
                        "precip_mm": 0.1,
                        "precip_in": 0.0,
                        "humidity": 25,
                        "cloud": 39,
                        "feelslike_c": 30.2,
                        "feelslike_f": 86.4,
                        "windchill_c": 31.0,
                        "windchill_f": 87.8,
                        "heatindex_c": 30.2,
                        "heatindex_f": 86.4,
                        "dewpoint_c": 6.5,
                        "dewpoint_f": 43.7,
                        "will_it_rain": 0,
                        "chance_of_rain": "22",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.7,
                        "vis_miles": 6.0,
                        "gust_mph": 9.6,
                        "gust_kph": 15.5,
                        "uv": 7.0
                    },
                    {
                        "time_epoch": 1622934000,
                        "time": "2021-06-05 17:00",
                        "temp_c": 30.0,
                        "temp_f": 86.0,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 8.3,
                        "wind_kph": 13.3,
                        "wind_degree": 224,
                        "wind_dir": "SW",
                        "pressure_mb": 1003.0,
                        "pressure_in": 30.1,
                        "precip_mm": 0.2,
                        "precip_in": 0.01,
                        "humidity": 32,
                        "cloud": 56,
                        "feelslike_c": 30.6,
                        "feelslike_f": 87.1,
                        "windchill_c": 30.0,
                        "windchill_f": 86.0,
                        "heatindex_c": 30.6,
                        "heatindex_f": 87.1,
                        "dewpoint_c": 8.2,
                        "dewpoint_f": 46.8,
                        "will_it_rain": 0,
                        "chance_of_rain": "44",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.3,
                        "vis_miles": 5.0,
                        "gust_mph": 9.8,
                        "gust_kph": 15.8,
                        "uv": 8.0
                    },
                    {
                        "time_epoch": 1622937600,
                        "time": "2021-06-05 18:00",
                        "temp_c": 29.0,
                        "temp_f": 84.2,
                        "is_day": 1,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                            "code": 1063
                        },
                        "wind_mph": 8.3,
                        "wind_kph": 13.3,
                        "wind_degree": 304,
                        "wind_dir": "NW",
                        "pressure_mb": 1004.0,
                        "pressure_in": 30.1,
                        "precip_mm": 0.3,
                        "precip_in": 0.01,
                        "humidity": 39,
                        "cloud": 72,
                        "feelslike_c": 31.0,
                        "feelslike_f": 87.8,
                        "windchill_c": 29.0,
                        "windchill_f": 84.2,
                        "heatindex_c": 31.0,
                        "heatindex_f": 87.8,
                        "dewpoint_c": 10.0,
                        "dewpoint_f": 50.0,
                        "will_it_rain": 0,
                        "chance_of_rain": "66",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 9.8,
                        "gust_kph": 15.8,
                        "uv": 6.0
                    },
                    {
                        "time_epoch": 1622941200,
                        "time": "2021-06-05 19:00",
                        "temp_c": 28.0,
                        "temp_f": 82.4,
                        "is_day": 1,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                            "code": 1063
                        },
                        "wind_mph": 10.3,
                        "wind_kph": 16.6,
                        "wind_degree": 284,
                        "wind_dir": "WNW",
                        "pressure_mb": 1005.0,
                        "pressure_in": 30.1,
                        "precip_mm": 0.6,
                        "precip_in": 0.02,
                        "humidity": 45,
                        "cloud": 72,
                        "feelslike_c": 30.0,
                        "feelslike_f": 86.0,
                        "windchill_c": 28.0,
                        "windchill_f": 82.4,
                        "heatindex_c": 30.0,
                        "heatindex_f": 86.0,
                        "dewpoint_c": 10.1,
                        "dewpoint_f": 50.2,
                        "will_it_rain": 1,
                        "chance_of_rain": "71",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 12.8,
                        "gust_kph": 20.5,
                        "uv": 6.0
                    },
                    {
                        "time_epoch": 1622944800,
                        "time": "2021-06-05 20:00",
                        "temp_c": 27.0,
                        "temp_f": 80.6,
                        "is_day": 1,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                            "code": 1063
                        },
                        "wind_mph": 12.1,
                        "wind_kph": 19.4,
                        "wind_degree": 263,
                        "wind_dir": "W",
                        "pressure_mb": 1006.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.8,
                        "precip_in": 0.03,
                        "humidity": 50,
                        "cloud": 72,
                        "feelslike_c": 29.0,
                        "feelslike_f": 84.2,
                        "windchill_c": 27.0,
                        "windchill_f": 80.6,
                        "heatindex_c": 29.0,
                        "heatindex_f": 84.2,
                        "dewpoint_c": 10.2,
                        "dewpoint_f": 50.4,
                        "will_it_rain": 1,
                        "chance_of_rain": "77",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 15.7,
                        "gust_kph": 25.2,
                        "uv": 6.0
                    },
                    {
                        "time_epoch": 1622948400,
                        "time": "2021-06-05 21:00",
                        "temp_c": 26.0,
                        "temp_f": 78.8,
                        "is_day": 0,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
                            "code": 1063
                        },
                        "wind_mph": 14.1,
                        "wind_kph": 22.7,
                        "wind_degree": 243,
                        "wind_dir": "WSW",
                        "pressure_mb": 1006.0,
                        "pressure_in": 30.2,
                        "precip_mm": 1.1,
                        "precip_in": 0.04,
                        "humidity": 55,
                        "cloud": 72,
                        "feelslike_c": 28.0,
                        "feelslike_f": 82.4,
                        "windchill_c": 26.0,
                        "windchill_f": 78.8,
                        "heatindex_c": 28.0,
                        "heatindex_f": 82.4,
                        "dewpoint_c": 10.3,
                        "dewpoint_f": 50.5,
                        "will_it_rain": 1,
                        "chance_of_rain": "82",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 18.6,
                        "gust_kph": 29.9,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1622952000,
                        "time": "2021-06-05 22:00",
                        "temp_c": 23.6,
                        "temp_f": 74.5,
                        "is_day": 0,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
                            "code": 1063
                        },
                        "wind_mph": 11.9,
                        "wind_kph": 19.1,
                        "wind_degree": 238,
                        "wind_dir": "WSW",
                        "pressure_mb": 1006.0,
                        "pressure_in": 30.2,
                        "precip_mm": 1.3,
                        "precip_in": 0.05,
                        "humidity": 57,
                        "cloud": 72,
                        "feelslike_c": 24.9,
                        "feelslike_f": 76.8,
                        "windchill_c": 23.6,
                        "windchill_f": 74.5,
                        "heatindex_c": 24.9,
                        "heatindex_f": 76.8,
                        "dewpoint_c": 10.5,
                        "dewpoint_f": 50.9,
                        "will_it_rain": 1,
                        "chance_of_rain": "84",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 15.9,
                        "gust_kph": 25.6,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1622955600,
                        "time": "2021-06-05 23:00",
                        "temp_c": 21.1,
                        "temp_f": 70.0,
                        "is_day": 0,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
                            "code": 1063
                        },
                        "wind_mph": 9.8,
                        "wind_kph": 15.8,
                        "wind_degree": 233,
                        "wind_dir": "SW",
                        "pressure_mb": 1006.0,
                        "pressure_in": 30.2,
                        "precip_mm": 1.4,
                        "precip_in": 0.06,
                        "humidity": 59,
                        "cloud": 73,
                        "feelslike_c": 21.1,
                        "feelslike_f": 70.0,
                        "windchill_c": 21.1,
                        "windchill_f": 70.0,
                        "heatindex_c": 21.8,
                        "heatindex_f": 71.2,
                        "dewpoint_c": 10.7,
                        "dewpoint_f": 51.3,
                        "will_it_rain": 1,
                        "chance_of_rain": "85",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 13.4,
                        "gust_kph": 21.6,
                        "uv": 1.0
                    }
                ]
            },
            {
                "date": "2021-06-06",
                "date_epoch": 1622937600,
                "day": {
                    "maxtemp_c": 29.9,
                    "maxtemp_f": 85.8,
                    "mintemp_c": 10.7,
                    "mintemp_f": 51.3,
                    "avgtemp_c": 18.9,
                    "avgtemp_f": 66.1,
                    "maxwind_mph": 19.7,
                    "maxwind_kph": 31.7,
                    "totalprecip_mm": 8.6,
                    "totalprecip_in": 0.34,
                    "avgvis_km": 9.4,
                    "avgvis_miles": 5.0,
                    "avghumidity": 53.0,
                    "daily_will_it_rain": 1,
                    "daily_chance_of_rain": "87",
                    "daily_will_it_snow": 0,
                    "daily_chance_of_snow": "0",
                    "condition": {
                        "text": "Moderate rain",
                        "icon": "//cdn.weatherapi.com/weather/64x64/day/302.png",
                        "code": 1189
                    },
                    "uv": 10.0
                },
                "astro": {
                    "sunrise": "05:33 AM",
                    "sunset": "08:26 PM",
                    "moonrise": "03:34 AM",
                    "moonset": "05:05 PM",
                    "moon_phase": "Waning Crescent",
                    "moon_illumination": "14"
                },
                "hour": [
                    {
                        "time_epoch": 1622959200,
                        "time": "2021-06-06 00:00",
                        "temp_c": 18.7,
                        "temp_f": 65.7,
                        "is_day": 0,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
                            "code": 1063
                        },
                        "wind_mph": 7.6,
                        "wind_kph": 12.2,
                        "wind_degree": 229,
                        "wind_dir": "SW",
                        "pressure_mb": 1006.0,
                        "pressure_in": 30.2,
                        "precip_mm": 1.6,
                        "precip_in": 0.06,
                        "humidity": 61,
                        "cloud": 73,
                        "feelslike_c": 18.7,
                        "feelslike_f": 65.7,
                        "windchill_c": 18.7,
                        "windchill_f": 65.7,
                        "heatindex_c": 18.7,
                        "heatindex_f": 65.7,
                        "dewpoint_c": 10.9,
                        "dewpoint_f": 51.6,
                        "will_it_rain": 1,
                        "chance_of_rain": "87",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 10.7,
                        "gust_kph": 17.3,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1622962800,
                        "time": "2021-06-06 01:00",
                        "temp_c": 18.5,
                        "temp_f": 65.3,
                        "is_day": 0,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                            "code": 1003
                        },
                        "wind_mph": 7.2,
                        "wind_kph": 11.5,
                        "wind_degree": 243,
                        "wind_dir": "WSW",
                        "pressure_mb": 1006.0,
                        "pressure_in": 30.2,
                        "precip_mm": 1.1,
                        "precip_in": 0.04,
                        "humidity": 60,
                        "cloud": 52,
                        "feelslike_c": 18.5,
                        "feelslike_f": 65.3,
                        "windchill_c": 18.5,
                        "windchill_f": 65.3,
                        "heatindex_c": 18.5,
                        "heatindex_f": 65.3,
                        "dewpoint_c": 10.7,
                        "dewpoint_f": 51.3,
                        "will_it_rain": 0,
                        "chance_of_rain": "58",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.3,
                        "vis_miles": 5.0,
                        "gust_mph": 10.1,
                        "gust_kph": 16.2,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1622966400,
                        "time": "2021-06-06 02:00",
                        "temp_c": 18.4,
                        "temp_f": 65.1,
                        "is_day": 0,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
                            "code": 1063
                        },
                        "wind_mph": 6.5,
                        "wind_kph": 10.4,
                        "wind_degree": 258,
                        "wind_dir": "WSW",
                        "pressure_mb": 1005.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.5,
                        "precip_in": 0.02,
                        "humidity": 60,
                        "cloud": 31,
                        "feelslike_c": 18.4,
                        "feelslike_f": 65.1,
                        "windchill_c": 18.4,
                        "windchill_f": 65.1,
                        "heatindex_c": 18.4,
                        "heatindex_f": 65.1,
                        "dewpoint_c": 10.5,
                        "dewpoint_f": 50.9,
                        "will_it_rain": 0,
                        "chance_of_rain": "29",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.7,
                        "vis_miles": 6.0,
                        "gust_mph": 9.4,
                        "gust_kph": 15.1,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1622970000,
                        "time": "2021-06-06 03:00",
                        "temp_c": 18.2,
                        "temp_f": 64.8,
                        "is_day": 0,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                            "code": 1003
                        },
                        "wind_mph": 6.0,
                        "wind_kph": 9.7,
                        "wind_degree": 272,
                        "wind_dir": "W",
                        "pressure_mb": 1005.0,
                        "pressure_in": 30.1,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 60,
                        "cloud": 9,
                        "feelslike_c": 18.2,
                        "feelslike_f": 64.8,
                        "windchill_c": 18.2,
                        "windchill_f": 64.8,
                        "heatindex_c": 18.2,
                        "heatindex_f": 64.8,
                        "dewpoint_c": 10.3,
                        "dewpoint_f": 50.5,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 8.7,
                        "gust_kph": 14.0,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1622973600,
                        "time": "2021-06-06 04:00",
                        "temp_c": 17.8,
                        "temp_f": 64.0,
                        "is_day": 0,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                            "code": 1003
                        },
                        "wind_mph": 5.8,
                        "wind_kph": 9.4,
                        "wind_degree": 260,
                        "wind_dir": "W",
                        "pressure_mb": 1005.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 59,
                        "cloud": 10,
                        "feelslike_c": 17.8,
                        "feelslike_f": 64.0,
                        "windchill_c": 17.8,
                        "windchill_f": 64.0,
                        "heatindex_c": 17.8,
                        "heatindex_f": 64.0,
                        "dewpoint_c": 9.8,
                        "dewpoint_f": 49.6,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 9.4,
                        "gust_kph": 15.1,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1622977200,
                        "time": "2021-06-06 05:00",
                        "temp_c": 17.4,
                        "temp_f": 63.3,
                        "is_day": 0,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                            "code": 1003
                        },
                        "wind_mph": 5.8,
                        "wind_kph": 9.4,
                        "wind_degree": 247,
                        "wind_dir": "WSW",
                        "pressure_mb": 1006.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 59,
                        "cloud": 11,
                        "feelslike_c": 17.4,
                        "feelslike_f": 63.3,
                        "windchill_c": 17.4,
                        "windchill_f": 63.3,
                        "heatindex_c": 17.4,
                        "heatindex_f": 63.3,
                        "dewpoint_c": 9.2,
                        "dewpoint_f": 48.6,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 10.1,
                        "gust_kph": 16.2,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1622980800,
                        "time": "2021-06-06 06:00",
                        "temp_c": 17.0,
                        "temp_f": 62.6,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 5.6,
                        "wind_kph": 9.0,
                        "wind_degree": 234,
                        "wind_dir": "SW",
                        "pressure_mb": 1006.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 58,
                        "cloud": 12,
                        "feelslike_c": 17.0,
                        "feelslike_f": 62.6,
                        "windchill_c": 17.0,
                        "windchill_f": 62.6,
                        "heatindex_c": 17.0,
                        "heatindex_f": 62.6,
                        "dewpoint_c": 8.7,
                        "dewpoint_f": 47.7,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 10.7,
                        "gust_kph": 17.3,
                        "uv": 5.0
                    },
                    {
                        "time_epoch": 1622984400,
                        "time": "2021-06-06 07:00",
                        "temp_c": 19.9,
                        "temp_f": 67.8,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 4.5,
                        "wind_kph": 7.2,
                        "wind_degree": 230,
                        "wind_dir": "SW",
                        "pressure_mb": 1006.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 50,
                        "cloud": 9,
                        "feelslike_c": 19.9,
                        "feelslike_f": 67.8,
                        "windchill_c": 19.9,
                        "windchill_f": 67.8,
                        "heatindex_c": 19.8,
                        "heatindex_f": 67.6,
                        "dewpoint_c": 8.5,
                        "dewpoint_f": 47.3,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 8.1,
                        "gust_kph": 13.0,
                        "uv": 5.0
                    },
                    {
                        "time_epoch": 1622988000,
                        "time": "2021-06-06 08:00",
                        "temp_c": 22.7,
                        "temp_f": 72.9,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 3.4,
                        "wind_kph": 5.4,
                        "wind_degree": 226,
                        "wind_dir": "SW",
                        "pressure_mb": 1005.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 41,
                        "cloud": 7,
                        "feelslike_c": 22.5,
                        "feelslike_f": 72.5,
                        "windchill_c": 22.7,
                        "windchill_f": 72.9,
                        "heatindex_c": 22.5,
                        "heatindex_f": 72.5,
                        "dewpoint_c": 8.2,
                        "dewpoint_f": 46.8,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 5.1,
                        "gust_kph": 8.3,
                        "uv": 6.0
                    },
                    {
                        "time_epoch": 1622991600,
                        "time": "2021-06-06 09:00",
                        "temp_c": 25.6,
                        "temp_f": 78.1,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 2.2,
                        "wind_kph": 3.6,
                        "wind_degree": 221,
                        "wind_dir": "SW",
                        "pressure_mb": 1005.0,
                        "pressure_in": 30.1,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 33,
                        "cloud": 5,
                        "feelslike_c": 25.3,
                        "feelslike_f": 77.5,
                        "windchill_c": 25.6,
                        "windchill_f": 78.1,
                        "heatindex_c": 25.3,
                        "heatindex_f": 77.5,
                        "dewpoint_c": 8.0,
                        "dewpoint_f": 46.4,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 2.5,
                        "gust_kph": 4.0,
                        "uv": 7.0
                    },
                    {
                        "time_epoch": 1622995200,
                        "time": "2021-06-06 10:00",
                        "temp_c": 27.0,
                        "temp_f": 80.6,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 3.6,
                        "wind_kph": 5.8,
                        "wind_degree": 182,
                        "wind_dir": "S",
                        "pressure_mb": 1004.0,
                        "pressure_in": 30.1,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 29,
                        "cloud": 6,
                        "feelslike_c": 26.1,
                        "feelslike_f": 79.0,
                        "windchill_c": 27.0,
                        "windchill_f": 80.6,
                        "heatindex_c": 26.1,
                        "heatindex_f": 79.0,
                        "dewpoint_c": 7.0,
                        "dewpoint_f": 44.6,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 4.0,
                        "gust_kph": 6.5,
                        "uv": 7.0
                    },
                    {
                        "time_epoch": 1622998800,
                        "time": "2021-06-06 11:00",
                        "temp_c": 28.5,
                        "temp_f": 83.3,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 5.1,
                        "wind_kph": 8.3,
                        "wind_degree": 144,
                        "wind_dir": "SE",
                        "pressure_mb": 1004.0,
                        "pressure_in": 30.1,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 25,
                        "cloud": 8,
                        "feelslike_c": 26.9,
                        "feelslike_f": 80.4,
                        "windchill_c": 28.5,
                        "windchill_f": 83.3,
                        "heatindex_c": 26.9,
                        "heatindex_f": 80.4,
                        "dewpoint_c": 5.9,
                        "dewpoint_f": 42.6,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 5.8,
                        "gust_kph": 9.4,
                        "uv": 7.0
                    },
                    {
                        "time_epoch": 1623002400,
                        "time": "2021-06-06 12:00",
                        "temp_c": 29.9,
                        "temp_f": 85.8,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 6.5,
                        "wind_kph": 10.4,
                        "wind_degree": 105,
                        "wind_dir": "ESE",
                        "pressure_mb": 1003.0,
                        "pressure_in": 30.1,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 20,
                        "cloud": 10,
                        "feelslike_c": 27.7,
                        "feelslike_f": 81.9,
                        "windchill_c": 29.9,
                        "windchill_f": 85.8,
                        "heatindex_c": 27.7,
                        "heatindex_f": 81.9,
                        "dewpoint_c": 4.9,
                        "dewpoint_f": 40.8,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 7.4,
                        "gust_kph": 11.9,
                        "uv": 7.0
                    },
                    {
                        "time_epoch": 1623006000,
                        "time": "2021-06-06 13:00",
                        "temp_c": 25.5,
                        "temp_f": 77.9,
                        "is_day": 1,
                        "condition": {
                            "text": "Moderate rain at times",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/299.png",
                            "code": 1186
                        },
                        "wind_mph": 11.0,
                        "wind_kph": 17.6,
                        "wind_degree": 145,
                        "wind_dir": "SE",
                        "pressure_mb": 1005.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.9,
                        "precip_in": 0.04,
                        "humidity": 37,
                        "cloud": 35,
                        "feelslike_c": 24.0,
                        "feelslike_f": 75.2,
                        "windchill_c": 25.5,
                        "windchill_f": 77.9,
                        "heatindex_c": 24.0,
                        "heatindex_f": 75.2,
                        "dewpoint_c": 7.1,
                        "dewpoint_f": 44.8,
                        "will_it_rain": 0,
                        "chance_of_rain": "21",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.3,
                        "vis_miles": 5.0,
                        "gust_mph": 14.3,
                        "gust_kph": 23.0,
                        "uv": 6.0
                    },
                    {
                        "time_epoch": 1623009600,
                        "time": "2021-06-06 14:00",
                        "temp_c": 21.1,
                        "temp_f": 70.0,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 15.2,
                        "wind_kph": 24.5,
                        "wind_degree": 185,
                        "wind_dir": "S",
                        "pressure_mb": 1007.0,
                        "pressure_in": 30.2,
                        "precip_mm": 1.7,
                        "precip_in": 0.07,
                        "humidity": 54,
                        "cloud": 59,
                        "feelslike_c": 21.1,
                        "feelslike_f": 70.0,
                        "windchill_c": 21.1,
                        "windchill_f": 70.0,
                        "heatindex_c": 20.4,
                        "heatindex_f": 68.7,
                        "dewpoint_c": 9.3,
                        "dewpoint_f": 48.7,
                        "will_it_rain": 0,
                        "chance_of_rain": "43",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 8.7,
                        "vis_miles": 5.0,
                        "gust_mph": 21.3,
                        "gust_kph": 34.2,
                        "uv": 6.0
                    },
                    {
                        "time_epoch": 1623013200,
                        "time": "2021-06-06 15:00",
                        "temp_c": 16.7,
                        "temp_f": 62.1,
                        "is_day": 1,
                        "condition": {
                            "text": "Moderate rain at times",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/299.png",
                            "code": 1186
                        },
                        "wind_mph": 19.7,
                        "wind_kph": 31.7,
                        "wind_degree": 225,
                        "wind_dir": "SW",
                        "pressure_mb": 1009.0,
                        "pressure_in": 30.3,
                        "precip_mm": 2.6,
                        "precip_in": 0.1,
                        "humidity": 71,
                        "cloud": 84,
                        "feelslike_c": 16.7,
                        "feelslike_f": 62.1,
                        "windchill_c": 16.7,
                        "windchill_f": 62.1,
                        "heatindex_c": 16.7,
                        "heatindex_f": 62.1,
                        "dewpoint_c": 11.5,
                        "dewpoint_f": 52.7,
                        "will_it_rain": 0,
                        "chance_of_rain": "64",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 8.0,
                        "vis_miles": 4.0,
                        "gust_mph": 28.2,
                        "gust_kph": 45.4,
                        "uv": 4.0
                    },
                    {
                        "time_epoch": 1623016800,
                        "time": "2021-06-06 16:00",
                        "temp_c": 16.0,
                        "temp_f": 60.8,
                        "is_day": 1,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                            "code": 1063
                        },
                        "wind_mph": 18.3,
                        "wind_kph": 29.5,
                        "wind_degree": 226,
                        "wind_dir": "SW",
                        "pressure_mb": 1009.0,
                        "pressure_in": 30.3,
                        "precip_mm": 3.0,
                        "precip_in": 0.12,
                        "humidity": 67,
                        "cloud": 80,
                        "feelslike_c": 16.0,
                        "feelslike_f": 60.8,
                        "windchill_c": 16.0,
                        "windchill_f": 60.8,
                        "heatindex_c": 17.0,
                        "heatindex_f": 62.6,
                        "dewpoint_c": 11.4,
                        "dewpoint_f": 52.5,
                        "will_it_rain": 0,
                        "chance_of_rain": "68",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 8.3,
                        "vis_miles": 5.0,
                        "gust_mph": 25.3,
                        "gust_kph": 40.7,
                        "uv": 4.0
                    },
                    {
                        "time_epoch": 1623020400,
                        "time": "2021-06-06 17:00",
                        "temp_c": 15.4,
                        "temp_f": 59.7,
                        "is_day": 1,
                        "condition": {
                            "text": "Moderate rain at times",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/299.png",
                            "code": 1186
                        },
                        "wind_mph": 16.8,
                        "wind_kph": 27.0,
                        "wind_degree": 228,
                        "wind_dir": "SW",
                        "pressure_mb": 1008.0,
                        "pressure_in": 30.2,
                        "precip_mm": 3.4,
                        "precip_in": 0.13,
                        "humidity": 62,
                        "cloud": 75,
                        "feelslike_c": 15.4,
                        "feelslike_f": 59.7,
                        "windchill_c": 15.4,
                        "windchill_f": 59.7,
                        "heatindex_c": 17.4,
                        "heatindex_f": 63.3,
                        "dewpoint_c": 11.3,
                        "dewpoint_f": 52.3,
                        "will_it_rain": 1,
                        "chance_of_rain": "71",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 8.7,
                        "vis_miles": 5.0,
                        "gust_mph": 22.4,
                        "gust_kph": 36.0,
                        "uv": 4.0
                    },
                    {
                        "time_epoch": 1623024000,
                        "time": "2021-06-06 18:00",
                        "temp_c": 14.7,
                        "temp_f": 58.5,
                        "is_day": 1,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                            "code": 1063
                        },
                        "wind_mph": 15.4,
                        "wind_kph": 24.8,
                        "wind_degree": 229,
                        "wind_dir": "SW",
                        "pressure_mb": 1007.0,
                        "pressure_in": 30.2,
                        "precip_mm": 3.8,
                        "precip_in": 0.15,
                        "humidity": 58,
                        "cloud": 71,
                        "feelslike_c": 14.7,
                        "feelslike_f": 58.5,
                        "windchill_c": 14.7,
                        "windchill_f": 58.5,
                        "heatindex_c": 17.7,
                        "heatindex_f": 63.9,
                        "dewpoint_c": 11.2,
                        "dewpoint_f": 52.2,
                        "will_it_rain": 1,
                        "chance_of_rain": "75",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 19.5,
                        "gust_kph": 31.3,
                        "uv": 3.0
                    },
                    {
                        "time_epoch": 1623027600,
                        "time": "2021-06-06 19:00",
                        "temp_c": 13.4,
                        "temp_f": 56.1,
                        "is_day": 1,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                            "code": 1063
                        },
                        "wind_mph": 15.4,
                        "wind_kph": 24.8,
                        "wind_degree": 238,
                        "wind_dir": "WSW",
                        "pressure_mb": 1008.0,
                        "pressure_in": 30.2,
                        "precip_mm": 2.7,
                        "precip_in": 0.11,
                        "humidity": 59,
                        "cloud": 76,
                        "feelslike_c": 13.4,
                        "feelslike_f": 56.1,
                        "windchill_c": 13.4,
                        "windchill_f": 56.1,
                        "heatindex_c": 16.4,
                        "heatindex_f": 61.5,
                        "dewpoint_c": 10.6,
                        "dewpoint_f": 51.1,
                        "will_it_rain": 1,
                        "chance_of_rain": "75",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 20.4,
                        "gust_kph": 32.8,
                        "uv": 3.0
                    },
                    {
                        "time_epoch": 1623031200,
                        "time": "2021-06-06 20:00",
                        "temp_c": 12.0,
                        "temp_f": 53.6,
                        "is_day": 1,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                            "code": 1063
                        },
                        "wind_mph": 15.2,
                        "wind_kph": 24.5,
                        "wind_degree": 248,
                        "wind_dir": "WSW",
                        "pressure_mb": 1009.0,
                        "pressure_in": 30.3,
                        "precip_mm": 1.7,
                        "precip_in": 0.07,
                        "humidity": 59,
                        "cloud": 81,
                        "feelslike_c": 12.0,
                        "feelslike_f": 53.6,
                        "windchill_c": 12.0,
                        "windchill_f": 53.6,
                        "heatindex_c": 15.0,
                        "heatindex_f": 59.0,
                        "dewpoint_c": 10.0,
                        "dewpoint_f": 50.0,
                        "will_it_rain": 1,
                        "chance_of_rain": "75",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 21.3,
                        "gust_kph": 34.2,
                        "uv": 3.0
                    },
                    {
                        "time_epoch": 1623034800,
                        "time": "2021-06-06 21:00",
                        "temp_c": 10.7,
                        "temp_f": 51.3,
                        "is_day": 0,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
                            "code": 1063
                        },
                        "wind_mph": 15.2,
                        "wind_kph": 24.5,
                        "wind_degree": 257,
                        "wind_dir": "WSW",
                        "pressure_mb": 1010.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.6,
                        "precip_in": 0.02,
                        "humidity": 60,
                        "cloud": 86,
                        "feelslike_c": 10.7,
                        "feelslike_f": 51.3,
                        "windchill_c": 10.7,
                        "windchill_f": 51.3,
                        "heatindex_c": 13.7,
                        "heatindex_f": 56.7,
                        "dewpoint_c": 9.4,
                        "dewpoint_f": 48.9,
                        "will_it_rain": 1,
                        "chance_of_rain": "75",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 22.1,
                        "gust_kph": 35.6,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1623038400,
                        "time": "2021-06-06 22:00",
                        "temp_c": 13.0,
                        "temp_f": 55.4,
                        "is_day": 0,
                        "condition": {
                            "text": "Moderate rain at times",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/299.png",
                            "code": 1186
                        },
                        "wind_mph": 12.3,
                        "wind_kph": 19.8,
                        "wind_degree": 248,
                        "wind_dir": "WSW",
                        "pressure_mb": 1010.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.6,
                        "precip_in": 0.02,
                        "humidity": 60,
                        "cloud": 82,
                        "feelslike_c": 13.0,
                        "feelslike_f": 55.4,
                        "windchill_c": 13.0,
                        "windchill_f": 55.4,
                        "heatindex_c": 15.0,
                        "heatindex_f": 59.0,
                        "dewpoint_c": 9.5,
                        "dewpoint_f": 49.1,
                        "will_it_rain": 1,
                        "chance_of_rain": "72",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.3,
                        "vis_miles": 5.0,
                        "gust_mph": 18.1,
                        "gust_kph": 29.2,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1623042000,
                        "time": "2021-06-06 23:00",
                        "temp_c": 15.2,
                        "temp_f": 59.4,
                        "is_day": 0,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
                            "code": 1063
                        },
                        "wind_mph": 9.4,
                        "wind_kph": 15.1,
                        "wind_degree": 238,
                        "wind_dir": "WSW",
                        "pressure_mb": 1010.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.7,
                        "precip_in": 0.03,
                        "humidity": 60,
                        "cloud": 78,
                        "feelslike_c": 15.2,
                        "feelslike_f": 59.4,
                        "windchill_c": 15.2,
                        "windchill_f": 59.4,
                        "heatindex_c": 16.2,
                        "heatindex_f": 61.2,
                        "dewpoint_c": 9.5,
                        "dewpoint_f": 49.1,
                        "will_it_rain": 0,
                        "chance_of_rain": "69",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.7,
                        "vis_miles": 6.0,
                        "gust_mph": 13.9,
                        "gust_kph": 22.3,
                        "uv": 1.0
                    }
                ]
            },
            {
                "date": "2021-06-07",
                "date_epoch": 1623024000,
                "day": {
                    "maxtemp_c": 29.4,
                    "maxtemp_f": 84.9,
                    "mintemp_c": 16.0,
                    "mintemp_f": 60.8,
                    "avgtemp_c": 22.4,
                    "avgtemp_f": 72.3,
                    "maxwind_mph": 11.4,
                    "maxwind_kph": 18.4,
                    "totalprecip_mm": 1.8,
                    "totalprecip_in": 0.07,
                    "avgvis_km": 9.8,
                    "avgvis_miles": 6.0,
                    "avghumidity": 44.0,
                    "daily_will_it_rain": 0,
                    "daily_chance_of_rain": "66",
                    "daily_will_it_snow": 0,
                    "daily_chance_of_snow": "0",
                    "condition": {
                        "text": "Patchy rain possible",
                        "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                        "code": 1063
                    },
                    "uv": 10.0
                },
                "astro": {
                    "sunrise": "05:33 AM",
                    "sunset": "08:26 PM",
                    "moonrise": "03:59 AM",
                    "moonset": "06:04 PM",
                    "moon_phase": "Waning Crescent",
                    "moon_illumination": "7"
                },
                "hour": [
                    {
                        "time_epoch": 1623045600,
                        "time": "2021-06-07 00:00",
                        "temp_c": 17.5,
                        "temp_f": 63.5,
                        "is_day": 0,
                        "condition": {
                            "text": "Moderate rain at times",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/299.png",
                            "code": 1186
                        },
                        "wind_mph": 6.5,
                        "wind_kph": 10.4,
                        "wind_degree": 228,
                        "wind_dir": "SW",
                        "pressure_mb": 1010.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.7,
                        "precip_in": 0.03,
                        "humidity": 60,
                        "cloud": 74,
                        "feelslike_c": 17.5,
                        "feelslike_f": 63.5,
                        "windchill_c": 17.5,
                        "windchill_f": 63.5,
                        "heatindex_c": 17.5,
                        "heatindex_f": 63.5,
                        "dewpoint_c": 9.6,
                        "dewpoint_f": 49.3,
                        "will_it_rain": 0,
                        "chance_of_rain": "66",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 9.8,
                        "gust_kph": 15.8,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1623049200,
                        "time": "2021-06-07 01:00",
                        "temp_c": 17.1,
                        "temp_f": 62.8,
                        "is_day": 0,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                            "code": 1003
                        },
                        "wind_mph": 6.7,
                        "wind_kph": 10.8,
                        "wind_degree": 232,
                        "wind_dir": "SW",
                        "pressure_mb": 1010.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.5,
                        "precip_in": 0.02,
                        "humidity": 59,
                        "cloud": 51,
                        "feelslike_c": 17.1,
                        "feelslike_f": 62.8,
                        "windchill_c": 17.1,
                        "windchill_f": 62.8,
                        "heatindex_c": 17.1,
                        "heatindex_f": 62.8,
                        "dewpoint_c": 9.0,
                        "dewpoint_f": 48.2,
                        "will_it_rain": 0,
                        "chance_of_rain": "44",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 11.6,
                        "gust_kph": 18.7,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1623052800,
                        "time": "2021-06-07 02:00",
                        "temp_c": 16.7,
                        "temp_f": 62.1,
                        "is_day": 0,
                        "condition": {
                            "text": "Moderate rain at times",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/299.png",
                            "code": 1186
                        },
                        "wind_mph": 6.9,
                        "wind_kph": 11.2,
                        "wind_degree": 236,
                        "wind_dir": "WSW",
                        "pressure_mb": 1009.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.2,
                        "precip_in": 0.01,
                        "humidity": 58,
                        "cloud": 27,
                        "feelslike_c": 16.7,
                        "feelslike_f": 62.1,
                        "windchill_c": 16.7,
                        "windchill_f": 62.1,
                        "heatindex_c": 16.7,
                        "heatindex_f": 62.1,
                        "dewpoint_c": 8.3,
                        "dewpoint_f": 46.9,
                        "will_it_rain": 0,
                        "chance_of_rain": "22",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 13.2,
                        "gust_kph": 21.2,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1623056400,
                        "time": "2021-06-07 03:00",
                        "temp_c": 16.3,
                        "temp_f": 61.3,
                        "is_day": 0,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                            "code": 1003
                        },
                        "wind_mph": 7.2,
                        "wind_kph": 11.5,
                        "wind_degree": 239,
                        "wind_dir": "WSW",
                        "pressure_mb": 1009.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 57,
                        "cloud": 4,
                        "feelslike_c": 16.3,
                        "feelslike_f": 61.3,
                        "windchill_c": 16.3,
                        "windchill_f": 61.3,
                        "heatindex_c": 16.3,
                        "heatindex_f": 61.3,
                        "dewpoint_c": 7.7,
                        "dewpoint_f": 45.9,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 15.0,
                        "gust_kph": 24.1,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1623060000,
                        "time": "2021-06-07 04:00",
                        "temp_c": 16.2,
                        "temp_f": 61.2,
                        "is_day": 0,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                            "code": 1003
                        },
                        "wind_mph": 6.7,
                        "wind_kph": 10.8,
                        "wind_degree": 233,
                        "wind_dir": "SW",
                        "pressure_mb": 1009.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 55,
                        "cloud": 6,
                        "feelslike_c": 16.2,
                        "feelslike_f": 61.2,
                        "windchill_c": 16.2,
                        "windchill_f": 61.2,
                        "heatindex_c": 16.2,
                        "heatindex_f": 61.2,
                        "dewpoint_c": 7.3,
                        "dewpoint_f": 45.1,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 14.3,
                        "gust_kph": 23.0,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1623063600,
                        "time": "2021-06-07 05:00",
                        "temp_c": 16.1,
                        "temp_f": 61.0,
                        "is_day": 0,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                            "code": 1003
                        },
                        "wind_mph": 6.5,
                        "wind_kph": 10.4,
                        "wind_degree": 227,
                        "wind_dir": "SW",
                        "pressure_mb": 1009.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 54,
                        "cloud": 8,
                        "feelslike_c": 16.1,
                        "feelslike_f": 61.0,
                        "windchill_c": 16.1,
                        "windchill_f": 61.0,
                        "heatindex_c": 16.1,
                        "heatindex_f": 61.0,
                        "dewpoint_c": 6.9,
                        "dewpoint_f": 44.4,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 13.4,
                        "gust_kph": 21.6,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1623067200,
                        "time": "2021-06-07 06:00",
                        "temp_c": 16.0,
                        "temp_f": 60.8,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 6.0,
                        "wind_kph": 9.7,
                        "wind_degree": 221,
                        "wind_dir": "SW",
                        "pressure_mb": 1009.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 53,
                        "cloud": 11,
                        "feelslike_c": 16.0,
                        "feelslike_f": 60.8,
                        "windchill_c": 16.0,
                        "windchill_f": 60.8,
                        "heatindex_c": 16.0,
                        "heatindex_f": 60.8,
                        "dewpoint_c": 6.5,
                        "dewpoint_f": 43.7,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 12.8,
                        "gust_kph": 20.5,
                        "uv": 5.0
                    },
                    {
                        "time_epoch": 1623070800,
                        "time": "2021-06-07 07:00",
                        "temp_c": 18.7,
                        "temp_f": 65.7,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 4.5,
                        "wind_kph": 7.2,
                        "wind_degree": 235,
                        "wind_dir": "SW",
                        "pressure_mb": 1009.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 47,
                        "cloud": 14,
                        "feelslike_c": 18.7,
                        "feelslike_f": 65.7,
                        "windchill_c": 18.7,
                        "windchill_f": 65.7,
                        "heatindex_c": 18.8,
                        "heatindex_f": 65.8,
                        "dewpoint_c": 6.7,
                        "dewpoint_f": 44.1,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 8.9,
                        "gust_kph": 14.4,
                        "uv": 5.0
                    },
                    {
                        "time_epoch": 1623074400,
                        "time": "2021-06-07 08:00",
                        "temp_c": 21.3,
                        "temp_f": 70.3,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 2.7,
                        "wind_kph": 4.3,
                        "wind_degree": 249,
                        "wind_dir": "WSW",
                        "pressure_mb": 1008.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 40,
                        "cloud": 17,
                        "feelslike_c": 21.3,
                        "feelslike_f": 70.3,
                        "windchill_c": 21.3,
                        "windchill_f": 70.3,
                        "heatindex_c": 21.6,
                        "heatindex_f": 70.9,
                        "dewpoint_c": 6.8,
                        "dewpoint_f": 44.2,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 5.1,
                        "gust_kph": 8.3,
                        "uv": 6.0
                    },
                    {
                        "time_epoch": 1623078000,
                        "time": "2021-06-07 09:00",
                        "temp_c": 24.0,
                        "temp_f": 75.2,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 1.1,
                        "wind_kph": 1.8,
                        "wind_degree": 263,
                        "wind_dir": "W",
                        "pressure_mb": 1008.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 34,
                        "cloud": 19,
                        "feelslike_c": 24.4,
                        "feelslike_f": 75.9,
                        "windchill_c": 24.0,
                        "windchill_f": 75.2,
                        "heatindex_c": 24.4,
                        "heatindex_f": 75.9,
                        "dewpoint_c": 7.0,
                        "dewpoint_f": 44.6,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 1.3,
                        "gust_kph": 2.2,
                        "uv": 6.0
                    },
                    {
                        "time_epoch": 1623081600,
                        "time": "2021-06-07 10:00",
                        "temp_c": 25.7,
                        "temp_f": 78.3,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 1.3,
                        "wind_kph": 2.2,
                        "wind_degree": 209,
                        "wind_dir": "SSW",
                        "pressure_mb": 1007.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 30,
                        "cloud": 21,
                        "feelslike_c": 25.4,
                        "feelslike_f": 77.7,
                        "windchill_c": 25.7,
                        "windchill_f": 78.3,
                        "heatindex_c": 25.4,
                        "heatindex_f": 77.7,
                        "dewpoint_c": 6.5,
                        "dewpoint_f": 43.7,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 1.6,
                        "gust_kph": 2.5,
                        "uv": 7.0
                    },
                    {
                        "time_epoch": 1623085200,
                        "time": "2021-06-07 11:00",
                        "temp_c": 27.5,
                        "temp_f": 81.5,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 1.8,
                        "wind_kph": 2.9,
                        "wind_degree": 155,
                        "wind_dir": "SSE",
                        "pressure_mb": 1007.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 26,
                        "cloud": 23,
                        "feelslike_c": 26.3,
                        "feelslike_f": 79.3,
                        "windchill_c": 27.5,
                        "windchill_f": 81.5,
                        "heatindex_c": 26.3,
                        "heatindex_f": 79.3,
                        "dewpoint_c": 6.0,
                        "dewpoint_f": 42.8,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 2.0,
                        "gust_kph": 3.2,
                        "uv": 7.0
                    },
                    {
                        "time_epoch": 1623088800,
                        "time": "2021-06-07 12:00",
                        "temp_c": 29.2,
                        "temp_f": 84.6,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 2.0,
                        "wind_kph": 3.2,
                        "wind_degree": 102,
                        "wind_dir": "ESE",
                        "pressure_mb": 1006.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 22,
                        "cloud": 25,
                        "feelslike_c": 27.3,
                        "feelslike_f": 81.1,
                        "windchill_c": 29.2,
                        "windchill_f": 84.6,
                        "heatindex_c": 27.3,
                        "heatindex_f": 81.1,
                        "dewpoint_c": 5.5,
                        "dewpoint_f": 41.9,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 2.2,
                        "gust_kph": 3.6,
                        "uv": 7.0
                    },
                    {
                        "time_epoch": 1623092400,
                        "time": "2021-06-07 13:00",
                        "temp_c": 29.3,
                        "temp_f": 84.7,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 2.9,
                        "wind_kph": 4.7,
                        "wind_degree": 87,
                        "wind_dir": "E",
                        "pressure_mb": 1006.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 23,
                        "cloud": 23,
                        "feelslike_c": 27.4,
                        "feelslike_f": 81.3,
                        "windchill_c": 29.3,
                        "windchill_f": 84.7,
                        "heatindex_c": 27.4,
                        "heatindex_f": 81.3,
                        "dewpoint_c": 5.8,
                        "dewpoint_f": 42.4,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 3.4,
                        "gust_kph": 5.4,
                        "uv": 7.0
                    },
                    {
                        "time_epoch": 1623096000,
                        "time": "2021-06-07 14:00",
                        "temp_c": 29.3,
                        "temp_f": 84.7,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 4.0,
                        "wind_kph": 6.5,
                        "wind_degree": 72,
                        "wind_dir": "ENE",
                        "pressure_mb": 1005.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 23,
                        "cloud": 22,
                        "feelslike_c": 27.5,
                        "feelslike_f": 81.5,
                        "windchill_c": 29.3,
                        "windchill_f": 84.7,
                        "heatindex_c": 27.5,
                        "heatindex_f": 81.5,
                        "dewpoint_c": 6.2,
                        "dewpoint_f": 43.2,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 4.5,
                        "gust_kph": 7.2,
                        "uv": 7.0
                    },
                    {
                        "time_epoch": 1623099600,
                        "time": "2021-06-07 15:00",
                        "temp_c": 29.4,
                        "temp_f": 84.9,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 4.9,
                        "wind_kph": 7.9,
                        "wind_degree": 57,
                        "wind_dir": "ENE",
                        "pressure_mb": 1005.0,
                        "pressure_in": 30.1,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 24,
                        "cloud": 21,
                        "feelslike_c": 27.6,
                        "feelslike_f": 81.7,
                        "windchill_c": 29.4,
                        "windchill_f": 84.9,
                        "heatindex_c": 27.6,
                        "heatindex_f": 81.7,
                        "dewpoint_c": 6.5,
                        "dewpoint_f": 43.7,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 5.6,
                        "gust_kph": 9.0,
                        "uv": 7.0
                    },
                    {
                        "time_epoch": 1623103200,
                        "time": "2021-06-07 16:00",
                        "temp_c": 28.1,
                        "temp_f": 82.6,
                        "is_day": 1,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                            "code": 1063
                        },
                        "wind_mph": 5.8,
                        "wind_kph": 9.4,
                        "wind_degree": 134,
                        "wind_dir": "SE",
                        "pressure_mb": 1006.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.1,
                        "precip_in": 0.0,
                        "humidity": 30,
                        "cloud": 38,
                        "feelslike_c": 27.5,
                        "feelslike_f": 81.5,
                        "windchill_c": 28.1,
                        "windchill_f": 82.6,
                        "heatindex_c": 27.5,
                        "heatindex_f": 81.5,
                        "dewpoint_c": 7.7,
                        "dewpoint_f": 45.9,
                        "will_it_rain": 0,
                        "chance_of_rain": "19",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.7,
                        "vis_miles": 6.0,
                        "gust_mph": 6.5,
                        "gust_kph": 10.4,
                        "uv": 6.0
                    },
                    {
                        "time_epoch": 1623106800,
                        "time": "2021-06-07 17:00",
                        "temp_c": 26.7,
                        "temp_f": 80.1,
                        "is_day": 1,
                        "condition": {
                            "text": "Partly cloudy",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1003
                        },
                        "wind_mph": 6.5,
                        "wind_kph": 10.4,
                        "wind_degree": 210,
                        "wind_dir": "SSW",
                        "pressure_mb": 1008.0,
                        "pressure_in": 30.2,
                        "precip_mm": 0.3,
                        "precip_in": 0.01,
                        "humidity": 36,
                        "cloud": 55,
                        "feelslike_c": 27.5,
                        "feelslike_f": 81.5,
                        "windchill_c": 26.7,
                        "windchill_f": 80.1,
                        "heatindex_c": 27.5,
                        "heatindex_f": 81.5,
                        "dewpoint_c": 9.0,
                        "dewpoint_f": 48.2,
                        "will_it_rain": 0,
                        "chance_of_rain": "38",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.3,
                        "vis_miles": 5.0,
                        "gust_mph": 7.6,
                        "gust_kph": 12.2,
                        "uv": 7.0
                    },
                    {
                        "time_epoch": 1623110400,
                        "time": "2021-06-07 18:00",
                        "temp_c": 25.4,
                        "temp_f": 77.7,
                        "is_day": 1,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                            "code": 1063
                        },
                        "wind_mph": 7.4,
                        "wind_kph": 11.9,
                        "wind_degree": 287,
                        "wind_dir": "WNW",
                        "pressure_mb": 1009.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.4,
                        "precip_in": 0.02,
                        "humidity": 42,
                        "cloud": 72,
                        "feelslike_c": 27.4,
                        "feelslike_f": 81.3,
                        "windchill_c": 25.4,
                        "windchill_f": 77.7,
                        "heatindex_c": 27.4,
                        "heatindex_f": 81.3,
                        "dewpoint_c": 10.2,
                        "dewpoint_f": 50.4,
                        "will_it_rain": 0,
                        "chance_of_rain": "57",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 8.5,
                        "gust_kph": 13.7,
                        "uv": 6.0
                    },
                    {
                        "time_epoch": 1623114000,
                        "time": "2021-06-07 19:00",
                        "temp_c": 24.1,
                        "temp_f": 75.4,
                        "is_day": 1,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                            "code": 1063
                        },
                        "wind_mph": 8.7,
                        "wind_kph": 14.0,
                        "wind_degree": 265,
                        "wind_dir": "W",
                        "pressure_mb": 1010.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.5,
                        "precip_in": 0.02,
                        "humidity": 48,
                        "cloud": 73,
                        "feelslike_c": 26.7,
                        "feelslike_f": 80.1,
                        "windchill_c": 24.1,
                        "windchill_f": 75.4,
                        "heatindex_c": 26.7,
                        "heatindex_f": 80.1,
                        "dewpoint_c": 10.3,
                        "dewpoint_f": 50.5,
                        "will_it_rain": 0,
                        "chance_of_rain": "58",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 11.6,
                        "gust_kph": 18.7,
                        "uv": 5.0
                    },
                    {
                        "time_epoch": 1623117600,
                        "time": "2021-06-07 20:00",
                        "temp_c": 22.7,
                        "temp_f": 72.9,
                        "is_day": 1,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                            "code": 1063
                        },
                        "wind_mph": 10.1,
                        "wind_kph": 16.2,
                        "wind_degree": 243,
                        "wind_dir": "WSW",
                        "pressure_mb": 1011.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.6,
                        "precip_in": 0.02,
                        "humidity": 54,
                        "cloud": 75,
                        "feelslike_c": 26.1,
                        "feelslike_f": 79.0,
                        "windchill_c": 22.7,
                        "windchill_f": 72.9,
                        "heatindex_c": 26.1,
                        "heatindex_f": 79.0,
                        "dewpoint_c": 10.4,
                        "dewpoint_f": 50.7,
                        "will_it_rain": 0,
                        "chance_of_rain": "59",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 14.8,
                        "gust_kph": 23.8,
                        "uv": 5.0
                    },
                    {
                        "time_epoch": 1623121200,
                        "time": "2021-06-07 21:00",
                        "temp_c": 21.4,
                        "temp_f": 70.5,
                        "is_day": 0,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
                            "code": 1063
                        },
                        "wind_mph": 11.4,
                        "wind_kph": 18.4,
                        "wind_degree": 221,
                        "wind_dir": "SW",
                        "pressure_mb": 1011.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.7,
                        "precip_in": 0.03,
                        "humidity": 60,
                        "cloud": 76,
                        "feelslike_c": 21.4,
                        "feelslike_f": 70.5,
                        "windchill_c": 21.4,
                        "windchill_f": 70.5,
                        "heatindex_c": 25.4,
                        "heatindex_f": 77.7,
                        "dewpoint_c": 10.5,
                        "dewpoint_f": 50.9,
                        "will_it_rain": 0,
                        "chance_of_rain": "60",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 17.9,
                        "gust_kph": 28.8,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1623124800,
                        "time": "2021-06-07 22:00",
                        "temp_c": 20.5,
                        "temp_f": 68.9,
                        "is_day": 0,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
                            "code": 1063
                        },
                        "wind_mph": 10.3,
                        "wind_kph": 16.6,
                        "wind_degree": 220,
                        "wind_dir": "SW",
                        "pressure_mb": 1011.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.7,
                        "precip_in": 0.03,
                        "humidity": 59,
                        "cloud": 80,
                        "feelslike_c": 20.5,
                        "feelslike_f": 68.9,
                        "windchill_c": 20.5,
                        "windchill_f": 68.9,
                        "heatindex_c": 23.2,
                        "heatindex_f": 73.8,
                        "dewpoint_c": 10.5,
                        "dewpoint_f": 50.9,
                        "will_it_rain": 0,
                        "chance_of_rain": "68",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 16.8,
                        "gust_kph": 27.0,
                        "uv": 1.0
                    },
                    {
                        "time_epoch": 1623128400,
                        "time": "2021-06-07 23:00",
                        "temp_c": 19.6,
                        "temp_f": 67.3,
                        "is_day": 0,
                        "condition": {
                            "text": "Patchy rain possible",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
                            "code": 1063
                        },
                        "wind_mph": 8.9,
                        "wind_kph": 14.4,
                        "wind_degree": 220,
                        "wind_dir": "SW",
                        "pressure_mb": 1011.0,
                        "pressure_in": 30.3,
                        "precip_mm": 0.8,
                        "precip_in": 0.03,
                        "humidity": 59,
                        "cloud": 84,
                        "feelslike_c": 19.6,
                        "feelslike_f": 67.3,
                        "windchill_c": 19.6,
                        "windchill_f": 67.3,
                        "heatindex_c": 20.9,
                        "heatindex_f": 69.6,
                        "dewpoint_c": 10.5,
                        "dewpoint_f": 50.9,
                        "will_it_rain": 1,
                        "chance_of_rain": "77",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 9.0,
                        "vis_miles": 5.0,
                        "gust_mph": 15.4,
                        "gust_kph": 24.8,
                        "uv": 1.0
                    }
                ]
            }
        ]
    }
}
end

def ticket_master_poro_data
    {
    "_embedded": {
        "events": [
            {
                "name": "STS9: Red Rocks 2021 (Sky World)",
                "type": "event",
                "id": "G5vzZpA5Itp8H",
                "test": false,
                "url": "https://www.axs.com/events/391667/sts9-7-23-21-tickets",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    },
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2020-02-21T17:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-07-24T00:00:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-07-23",
                        "localTime": "18:00:00",
                        "dateTime": "2021-07-24T00:00:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "rescheduled"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAeA",
                            "name": "Rock"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7v6dt",
                            "name": "Alternative Rock"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    },
                    {
                        "id": "4576",
                        "name": "LIVE NATION 3PE EVENT",
                        "description": "LIVE NATION 3PE EVENT / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZpA5Itp8H?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ9171iif?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "STS9",
                            "type": "attraction",
                            "id": "K8vZ9171iif",
                            "test": false,
                            "url": "https://www.ticketmaster.com/sts9-tickets/artist/806111",
                            "locale": "en-us",
                            "aliases": [
                                "sts9",
                                "sound tribe sector 9",
                                "sound tribe sector nine"
                            ],
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAeA",
                                        "name": "Rock"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7v6dt",
                                        "name": "Alternative Rock"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 6,
                                "ticketmaster": 6
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9171iif?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "STS9: Red Rocks 2021 (Sky World)",
                "type": "event",
                "id": "G5vzZpA5ICp8P",
                "test": false,
                "url": "https://www.axs.com/events/391705/sts9-7-24-21-tickets",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    },
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2020-02-21T17:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-07-25T00:00:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-07-24",
                        "localTime": "18:00:00",
                        "dateTime": "2021-07-25T00:00:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "rescheduled"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAeA",
                            "name": "Rock"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7v6dt",
                            "name": "Alternative Rock"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZpA5ICp8P?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ9171iif?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "STS9",
                            "type": "attraction",
                            "id": "K8vZ9171iif",
                            "test": false,
                            "url": "https://www.ticketmaster.com/sts9-tickets/artist/806111",
                            "locale": "en-us",
                            "aliases": [
                                "sts9",
                                "sound tribe sector 9",
                                "sound tribe sector nine"
                            ],
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAeA",
                                        "name": "Rock"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7v6dt",
                                        "name": "Alternative Rock"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 6,
                                "ticketmaster": 6
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9171iif?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "Kygo",
                "type": "event",
                "id": "G5vzZplzPUdMY",
                "test": false,
                "url": "https://www.axs.com/events/404204/kygo-tickets",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2021-06-03T16:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-06-25T01:30:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-06-24",
                        "localTime": "19:30:00",
                        "dateTime": "2021-06-25T01:30:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "onsale"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAvF",
                            "name": "Dance/Electronic"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7va1k",
                            "name": "Witchstep"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZplzPUdMY?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ9173FFf?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "Kygo",
                            "type": "attraction",
                            "id": "K8vZ9173FFf",
                            "test": false,
                            "url": "https://www.ticketmaster.com/kygo-tickets/artist/1958261",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/KygoMusic"
                                    },
                                    {
                                        "url": "https://www.youtube.com/user/KygoOfficialVEVO"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/KygoMusic"
                                    }
                                ],
                                "itunes": [
                                    {
                                        "url": "https://itunes.apple.com/artist/id635806094"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/kygoofficial"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "http://en.wikipedia.org/wiki/Kygo"
                                    }
                                ],
                                "instagram": [
                                    {
                                        "url": "https://instagram.com/kygomusic/"
                                    },
                                    {
                                        "url": "https://instagram.com/kygomusic"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "ba0e7638-0cd6-4ff4-8987-c3e224d22c23"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.kygomusic.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/f49/58c71015-896e-4126-983c-c226a09a8f49_1430371_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAvF",
                                        "name": "Dance/Electronic"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vAJ1",
                                        "name": "Club Dance"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 2,
                                "ticketmaster": 2
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9173FFf?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "Foreigner",
                "type": "event",
                "id": "G5vzZ4yCX7gov",
                "test": false,
                "url": "https://www.axs.com/events/389738/foreigner-tickets",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2020-01-17T17:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-07-22T01:00:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-07-21",
                        "localTime": "19:00:00",
                        "dateTime": "2021-07-22T01:00:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "rescheduled"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAeA",
                            "name": "Rock"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7v6F1",
                            "name": "Pop"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    },
                    {
                        "id": "4576",
                        "name": "LIVE NATION 3PE EVENT",
                        "description": "LIVE NATION 3PE EVENT / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZ4yCX7gov?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ9171CG7?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "Foreigner",
                            "type": "attraction",
                            "id": "K8vZ9171CG7",
                            "test": false,
                            "url": "https://www.ticketmaster.com/foreigner-tickets/artist/735109",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/FWebTeam"
                                    }
                                ],
                                "lastfm": [
                                    {
                                        "url": "http://www.last.fm/music/Foreigner"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/Foreigner"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/Foreigner_(band)"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "160629ab-ec18-4931-8c95-02cb92d06186"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.foreigneronline.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/750/9c9123af-b6ed-48a0-ad9b-934c25192750_1334791_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAeA",
                                        "name": "Rock"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7v6F1",
                                        "name": "Pop"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 30,
                                "mfx-nl": 1,
                                "ticketmaster": 29
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9171CG7?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "Bill Burr",
                "type": "event",
                "id": "G5vzZpI4R5803",
                "test": false,
                "url": "https://www.axs.com/events/400176/bill-burr-tickets",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false,
                        "attribution": "N/A"
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2021-04-09T16:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-09-17T02:00:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-09-16",
                        "localTime": "20:00:00",
                        "dateTime": "2021-09-17T02:00:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "onsale"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7na",
                            "name": "Arts & Theatre"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAe1",
                            "name": "Comedy"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7vF17",
                            "name": "Comedy"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZpI4R5803?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ9175YiV?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "Bill Burr",
                            "type": "attraction",
                            "id": "K8vZ9175YiV",
                            "test": false,
                            "url": "https://www.ticketmaster.com/bill-burr-tickets/artist/961318",
                            "locale": "en-us",
                            "externalLinks": {
                                "musicbrainz": [
                                    {
                                        "id": "ffaa26b0-d8cb-4a31-8d5a-934e49d2240c"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false,
                                    "attribution": "N/A"
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7na",
                                        "name": "Arts & Theatre"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAe1",
                                        "name": "Comedy"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vF17",
                                        "name": "Comedy"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 42,
                                "ticketmaster": 42
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9175YiV?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "Bill Burr",
                "type": "event",
                "id": "G5vzZpISEkajW",
                "test": false,
                "url": "https://www.axs.com/events/400549/bill-burr-tickets?skin=redrocks",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false,
                        "attribution": "N/A"
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false,
                        "attribution": "N/A"
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2021-04-12T22:26:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-10-02T02:00:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-10-01",
                        "localTime": "20:00:00",
                        "dateTime": "2021-10-02T02:00:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "onsale"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7na",
                            "name": "Arts & Theatre"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAe1",
                            "name": "Comedy"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7vF17",
                            "name": "Comedy"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZpISEkajW?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ9175YiV?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "Bill Burr",
                            "type": "attraction",
                            "id": "K8vZ9175YiV",
                            "test": false,
                            "url": "https://www.ticketmaster.com/bill-burr-tickets/artist/961318",
                            "locale": "en-us",
                            "externalLinks": {
                                "musicbrainz": [
                                    {
                                        "id": "ffaa26b0-d8cb-4a31-8d5a-934e49d2240c"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false,
                                    "attribution": "N/A"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/bba/269547f1-126e-4ee8-96cb-b8d6b5238bba_1417221_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false,
                                    "attribution": "N/A"
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7na",
                                        "name": "Arts & Theatre"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAe1",
                                        "name": "Comedy"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vF17",
                                        "name": "Comedy"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 42,
                                "ticketmaster": 42
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9175YiV?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "Reggae On The Rocks ft. Rebelution",
                "type": "event",
                "id": "G5vzZ4yeEGS0z",
                "test": false,
                "url": "https://www.axs.com/events/389300/reggae-on-the-rocks-2020-tickets",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    },
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2019-12-20T17:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-08-21T20:00:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-08-21",
                        "localTime": "14:00:00",
                        "dateTime": "2021-08-21T20:00:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "onsale"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAed",
                            "name": "Reggae"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7vknl",
                            "name": "Reggae"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    },
                    {
                        "id": "4576",
                        "name": "LIVE NATION 3PE EVENT",
                        "description": "LIVE NATION 3PE EVENT / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZ4yeEGS0z?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ917Gp77?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ91718PV?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ91718d7?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ91725VV?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ91714s7?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ917p49f?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ917GMo0?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "Rebelution",
                            "type": "attraction",
                            "id": "K8vZ917Gp77",
                            "test": false,
                            "url": "https://www.ticketmaster.com/rebelution-tickets/artist/1182307",
                            "locale": "en-us",
                            "externalLinks": {
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/rebelution"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/Rebelution_(band)"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "bf225245-fce7-4d30-b648-887cb33529e4"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAed",
                                        "name": "Reggae"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vknl",
                                        "name": "Reggae"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 26,
                                "ticketweb": 3,
                                "ticketmaster": 23
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917Gp77?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Steel Pulse",
                            "type": "attraction",
                            "id": "K8vZ91718PV",
                            "test": false,
                            "url": "https://www.ticketmaster.com/steel-pulse-tickets/artist/733929",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/therandboy"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/steelpulse"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/SteelPulse"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/Steel_Pulse"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "37367b2f-69e4-4df2-9e64-75ca6204764b"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.steel-pulse.com/"
                                    },
                                    {
                                        "url": "http://steelpulse.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAed",
                                        "name": "Reggae"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vknl",
                                        "name": "Reggae"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 29,
                                "mfx-nl": 1,
                                "ticketweb": 3,
                                "ticketmaster": 25
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ91718PV?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Inner Circle",
                            "type": "attraction",
                            "id": "K8vZ91718d7",
                            "test": false,
                            "url": "https://www.ticketmaster.com/inner-circle-tickets/artist/733899",
                            "locale": "en-us",
                            "externalLinks": {
                                "lastfm": [
                                    {
                                        "url": "http://www.last.fm/music/Inner+Circle"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/InnerCircleFanpage"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/Inner_Circle_(band)"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "0a5c92c7-4aa7-4324-82ab-8e8e733507cb"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://innercircle-reggae.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/dce/9f08a30a-68a4-4126-b175-10d050020dce_52141_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/dce/9f08a30a-68a4-4126-b175-10d050020dce_52141_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/dce/9f08a30a-68a4-4126-b175-10d050020dce_52141_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": true
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dbimages/105261a.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/105262a.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAed",
                                        "name": "Reggae"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vknl",
                                        "name": "Reggae"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 1,
                                "ticketmaster": 1
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ91718d7?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "The Green",
                            "type": "attraction",
                            "id": "K8vZ91725VV",
                            "test": false,
                            "url": "https://www.ticketmaster.com/the-green-tickets/artist/1550559",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/thegreenhawaii"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/TheGreen808"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/TheGreen808"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "a2030c8d-cad0-4327-9534-47761f8ef0f0"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.thegreenmusic.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAed",
                                        "name": "Reggae"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vknl",
                                        "name": "Reggae"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 25,
                                "ticketweb": 3,
                                "ticketmaster": 22
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ91725VV?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Israel Vibration",
                            "type": "attraction",
                            "id": "K8vZ91714s7",
                            "test": false,
                            "url": "https://www.ticketmaster.com/israel-vibration-tickets/artist/733900",
                            "locale": "en-us",
                            "externalLinks": {
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/Israel_Vibration"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "ffce4003-a756-46c0-b062-2e942de13d37"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.rasrecords.com/israelvibration/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/556/69f5df94-b320-4c79-9285-4013d9aa1556_702281_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/556/69f5df94-b320-4c79-9285-4013d9aa1556_702281_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/556/69f5df94-b320-4c79-9285-4013d9aa1556_702281_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/556/69f5df94-b320-4c79-9285-4013d9aa1556_702281_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/556/69f5df94-b320-4c79-9285-4013d9aa1556_702281_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/556/69f5df94-b320-4c79-9285-4013d9aa1556_702281_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/556/69f5df94-b320-4c79-9285-4013d9aa1556_702281_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/556/69f5df94-b320-4c79-9285-4013d9aa1556_702281_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/556/69f5df94-b320-4c79-9285-4013d9aa1556_702281_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/556/69f5df94-b320-4c79-9285-4013d9aa1556_702281_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAed",
                                        "name": "Reggae"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vknl",
                                        "name": "Reggae"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 1,
                                "ticketmaster": 1
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ91714s7?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Keznamdi",
                            "type": "attraction",
                            "id": "K8vZ917p49f",
                            "test": false,
                            "url": "https://www.ticketmaster.com/keznamdi-tickets/artist/2271264",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAed",
                                        "name": "Reggae"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vknl",
                                        "name": "Reggae"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7la",
                                        "name": "Individual"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7vAd7",
                                        "name": "Musician"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 23,
                                "ticketweb": 3,
                                "ticketmaster": 20
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917p49f?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Judge Roughneck",
                            "type": "attraction",
                            "id": "K8vZ917GMo0",
                            "test": false,
                            "url": "https://www.ticketmaster.com/judge-roughneck-tickets/artist/713019",
                            "locale": "en-us",
                            "externalLinks": {
                                "lastfm": [
                                    {
                                        "url": "http://www.last.fm/music/Judge%20Roughneck"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "b3a9ef6f-ec20-4e77-bc05-72457dab5369"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.judgeroughneck.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": true
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": true
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAeA",
                                        "name": "Rock"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7v6F1",
                                        "name": "Pop"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 2,
                                "ticketmaster": 2
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917GMo0?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "Reggae On The Rocks ft. Rebelution",
                "type": "event",
                "id": "G5vzZ4yeteSP_",
                "test": false,
                "url": "https://www.axs.com/events/389479/reggae-on-the-rocks-2020-tickets",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    },
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2019-12-20T17:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-08-22T20:00:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-08-22",
                        "localTime": "14:00:00",
                        "dateTime": "2021-08-22T20:00:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "onsale"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAed",
                            "name": "Reggae"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7vknl",
                            "name": "Reggae"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    },
                    {
                        "id": "4576",
                        "name": "LIVE NATION 3PE EVENT",
                        "description": "LIVE NATION 3PE EVENT / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZ4yeteSP_?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ917Gp77?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ91718PV?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ91718d0?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ91725VV?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ9171Xlf?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ917p49f?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ917GMo0?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "Rebelution",
                            "type": "attraction",
                            "id": "K8vZ917Gp77",
                            "test": false,
                            "url": "https://www.ticketmaster.com/rebelution-tickets/artist/1182307",
                            "locale": "en-us",
                            "externalLinks": {
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/rebelution"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/Rebelution_(band)"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "bf225245-fce7-4d30-b648-887cb33529e4"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8c1/c8eed5ef-2b48-4403-91d6-cfdb3c8e78c1_1440341_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAed",
                                        "name": "Reggae"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vknl",
                                        "name": "Reggae"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 26,
                                "ticketweb": 3,
                                "ticketmaster": 23
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917Gp77?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Steel Pulse",
                            "type": "attraction",
                            "id": "K8vZ91718PV",
                            "test": false,
                            "url": "https://www.ticketmaster.com/steel-pulse-tickets/artist/733929",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/therandboy"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/steelpulse"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/SteelPulse"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/Steel_Pulse"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "37367b2f-69e4-4df2-9e64-75ca6204764b"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.steel-pulse.com/"
                                    },
                                    {
                                        "url": "http://steelpulse.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8b0/d4e642b3-7dcb-4c2d-a5ef-cc162ab0c8b0_924971_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAed",
                                        "name": "Reggae"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vknl",
                                        "name": "Reggae"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 29,
                                "mfx-nl": 1,
                                "ticketweb": 3,
                                "ticketmaster": 25
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ91718PV?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Third World",
                            "type": "attraction",
                            "id": "K8vZ91718d0",
                            "test": false,
                            "url": "https://www.ticketmaster.com/third-world-tickets/artist/733932",
                            "locale": "en-us",
                            "externalLinks": {
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/thirdworldband"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/Third_World_(band)"
                                    }
                                ],
                                "instagram": [
                                    {
                                        "url": "https://www.instagram.com/thirdworldband"
                                    },
                                    {
                                        "url": "https://www.instagram.com/thirdworldband/"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "a9355030-319f-4d1b-8798-adaf43f85112"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://thirdworldband.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/176233a.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": true
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dbimages/176232a.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": true
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAed",
                                        "name": "Reggae"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vknl",
                                        "name": "Reggae"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 1,
                                "ticketmaster": 1
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ91718d0?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "The Green",
                            "type": "attraction",
                            "id": "K8vZ91725VV",
                            "test": false,
                            "url": "https://www.ticketmaster.com/the-green-tickets/artist/1550559",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/thegreenhawaii"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/TheGreen808"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/TheGreen808"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "a2030c8d-cad0-4327-9534-47761f8ef0f0"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.thegreenmusic.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/3c4/f02ad6eb-301a-4d29-a509-8500aafb13c4_244221_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAed",
                                        "name": "Reggae"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vknl",
                                        "name": "Reggae"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 25,
                                "ticketweb": 3,
                                "ticketmaster": 22
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ91725VV?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Michael Rose",
                            "type": "attraction",
                            "id": "K8vZ9171Xlf",
                            "test": false,
                            "url": "https://www.ticketmaster.com/michael-rose-tickets/artist/771618",
                            "locale": "en-us",
                            "externalLinks": {
                                "musicbrainz": [
                                    {
                                        "id": "75266bd1-1a2c-4fb7-ace8-971d22c30dbb"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": true
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/c/27e/458d1b62-6e4f-4ffd-8941-9ed303d8e27e_106041_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": true
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAed",
                                        "name": "Reggae"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vknl",
                                        "name": "Reggae"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 1,
                                "ticketmaster": 1
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9171Xlf?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Keznamdi",
                            "type": "attraction",
                            "id": "K8vZ917p49f",
                            "test": false,
                            "url": "https://www.ticketmaster.com/keznamdi-tickets/artist/2271264",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/8ca/9ee9b2cc-c9c8-4edd-b5b4-e07f247ae8ca_1295911_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAed",
                                        "name": "Reggae"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vknl",
                                        "name": "Reggae"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7la",
                                        "name": "Individual"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7vAd7",
                                        "name": "Musician"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 23,
                                "ticketweb": 3,
                                "ticketmaster": 20
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917p49f?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Judge Roughneck",
                            "type": "attraction",
                            "id": "K8vZ917GMo0",
                            "test": false,
                            "url": "https://www.ticketmaster.com/judge-roughneck-tickets/artist/713019",
                            "locale": "en-us",
                            "externalLinks": {
                                "lastfm": [
                                    {
                                        "url": "http://www.last.fm/music/Judge%20Roughneck"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "b3a9ef6f-ec20-4e77-bc05-72457dab5369"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.judgeroughneck.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": true
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/fbc/b293c0ad-c904-4215-bc59-8d7f2414dfbc_106141_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": true
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAeA",
                                        "name": "Rock"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7v6F1",
                                        "name": "Pop"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 2,
                                "ticketmaster": 2
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917GMo0?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "The Revivalists",
                "type": "event",
                "id": "G5vzZpeyUJooK",
                "test": false,
                "url": "https://www.axs.com/events/389705/the-revivalists-tickets",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    },
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2020-01-17T17:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-06-12T01:30:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-06-11",
                        "localTime": "19:30:00",
                        "dateTime": "2021-06-12T01:30:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "rescheduled"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAeA",
                            "name": "Rock"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7v6F1",
                            "name": "Pop"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    },
                    {
                        "id": "4576",
                        "name": "LIVE NATION 3PE EVENT",
                        "description": "LIVE NATION 3PE EVENT / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZpeyUJooK?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ917uhlV?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ9171fB0?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ9179YTf?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "The Revivalists",
                            "type": "attraction",
                            "id": "K8vZ917uhlV",
                            "test": false,
                            "url": "https://www.ticketmaster.com/the-revivalists-tickets/artist/1512734",
                            "locale": "en-us",
                            "externalLinks": {
                                "musicbrainz": [
                                    {
                                        "id": "ed4a08e1-2a79-4538-b519-87bb2ee0fd9d"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/663/5d0efd44-af80-48c8-8f5b-f81ee275e663_861851_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAeA",
                                        "name": "Rock"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7v6F1",
                                        "name": "Pop"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 8,
                                "ticketmaster": 8
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917uhlV?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Preservation Hall Jazz Band",
                            "type": "attraction",
                            "id": "K8vZ9171fB0",
                            "test": false,
                            "url": "https://www.ticketmaster.com/preservation-hall-jazz-band-tickets/artist/737676",
                            "locale": "en-us",
                            "externalLinks": {
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/Preservation_Hall_Jazz_Band"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "1a9b4e0d-05e2-4491-83f0-a4a676283f99"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.preservationhall.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/5ee/66a24b78-3fbd-485e-a337-56cbe47745ee_1079401_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/5ee/66a24b78-3fbd-485e-a337-56cbe47745ee_1079401_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/5ee/66a24b78-3fbd-485e-a337-56cbe47745ee_1079401_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/5ee/66a24b78-3fbd-485e-a337-56cbe47745ee_1079401_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/5ee/66a24b78-3fbd-485e-a337-56cbe47745ee_1079401_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/5ee/66a24b78-3fbd-485e-a337-56cbe47745ee_1079401_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/5ee/66a24b78-3fbd-485e-a337-56cbe47745ee_1079401_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/5ee/66a24b78-3fbd-485e-a337-56cbe47745ee_1079401_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/5ee/66a24b78-3fbd-485e-a337-56cbe47745ee_1079401_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/5ee/66a24b78-3fbd-485e-a337-56cbe47745ee_1079401_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAvE",
                                        "name": "Jazz"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vkda",
                                        "name": "Jazz"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 2,
                                "ticketmaster": 2
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9171fB0?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Neal Francis",
                            "type": "attraction",
                            "id": "K8vZ9179YTf",
                            "test": false,
                            "url": "https://www.ticketmaster.com/neal-francis-tickets/artist/2584534",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/4f4/1e5012bd-1c13-4b7f-ab2e-1a2728b7f4f4_1435361_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/4f4/1e5012bd-1c13-4b7f-ab2e-1a2728b7f4f4_1435361_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/4f4/1e5012bd-1c13-4b7f-ab2e-1a2728b7f4f4_1435361_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/4f4/1e5012bd-1c13-4b7f-ab2e-1a2728b7f4f4_1435361_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/4f4/1e5012bd-1c13-4b7f-ab2e-1a2728b7f4f4_1435361_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/4f4/1e5012bd-1c13-4b7f-ab2e-1a2728b7f4f4_1435361_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/4f4/1e5012bd-1c13-4b7f-ab2e-1a2728b7f4f4_1435361_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/4f4/1e5012bd-1c13-4b7f-ab2e-1a2728b7f4f4_1435361_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/4f4/1e5012bd-1c13-4b7f-ab2e-1a2728b7f4f4_1435361_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/4f4/1e5012bd-1c13-4b7f-ab2e-1a2728b7f4f4_1435361_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAeA",
                                        "name": "Rock"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7v6da",
                                        "name": "Rock"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7la",
                                        "name": "Individual"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7vAd7",
                                        "name": "Musician"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 6,
                                "ticketmaster": 6
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9179YTf?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "Dermot Kennedy: Without Fear Tour",
                "type": "event",
                "id": "G5vzZp7E3RVb-",
                "test": false,
                "url": "https://www.axs.com/events/392292/dermot-kennedy-without-fear-tour-tickets",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    },
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2020-02-14T17:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-08-06T01:00:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-08-05",
                        "localTime": "19:00:00",
                        "dateTime": "2021-08-06T01:00:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "onsale"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAeA",
                            "name": "Rock"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7v6F1",
                            "name": "Pop"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    },
                    {
                        "id": "4576",
                        "name": "LIVE NATION 3PE EVENT",
                        "description": "LIVE NATION 3PE EVENT / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZp7E3RVb-?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ917Ku7V?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ917fI17?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "Dermot Kennedy",
                            "type": "attraction",
                            "id": "K8vZ917Ku7V",
                            "test": false,
                            "url": "https://www.ticketmaster.com/dermot-kennedy-tickets/artist/2089473",
                            "locale": "en-us",
                            "externalLinks": {
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/dermotkennedymusic"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "aa9ea04c-6d55-4244-9139-22c75bd19f97"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.dermotkennedy.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/5d0/9ffe71cc-a700-496c-993b-c7c4d4fac5d0_1162371_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAeA",
                                        "name": "Rock"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7v6F1",
                                        "name": "Pop"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 37,
                                "ticketweb": 1,
                                "ticketmaster": 36
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917Ku7V?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Bishop Briggs",
                            "type": "attraction",
                            "id": "K8vZ917fI17",
                            "test": false,
                            "url": "https://www.ticketmaster.com/bishop-briggs-tickets/artist/2230385",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/channel/UCAOUTJyHMjLgLcu71xMEyAQ"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/thatgirlbishop"
                                    }
                                ],
                                "itunes": [
                                    {
                                        "url": "https://itunes.apple.com/en/artist/id1047012236"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/thatgirlbishop"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/Bishop_Briggs"
                                    }
                                ],
                                "instagram": [
                                    {
                                        "url": "https://www.instagram.com/thatgirlbishop/"
                                    },
                                    {
                                        "url": "https://www.instagram.com/thatgirlbishop"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "ee0c82bb-85ca-4a3c-94b8-d7221e74333f"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.bishopbriggs.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/4bd/3227ef85-5125-43f1-aace-9f3d46c214bd_1110681_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/4bd/3227ef85-5125-43f1-aace-9f3d46c214bd_1110681_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/4bd/3227ef85-5125-43f1-aace-9f3d46c214bd_1110681_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/4bd/3227ef85-5125-43f1-aace-9f3d46c214bd_1110681_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/4bd/3227ef85-5125-43f1-aace-9f3d46c214bd_1110681_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/4bd/3227ef85-5125-43f1-aace-9f3d46c214bd_1110681_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/4bd/3227ef85-5125-43f1-aace-9f3d46c214bd_1110681_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/4bd/3227ef85-5125-43f1-aace-9f3d46c214bd_1110681_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/4bd/3227ef85-5125-43f1-aace-9f3d46c214bd_1110681_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/4bd/3227ef85-5125-43f1-aace-9f3d46c214bd_1110681_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAvv",
                                        "name": "Alternative"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vAvn",
                                        "name": "Alternative Rock"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7l1",
                                        "name": "Group"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7vA71",
                                        "name": "Band"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 2,
                                "ticketmaster": 2
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917fI17?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "RÜFÜS DU SOL",
                "type": "event",
                "id": "G5vzZpeU51xGn",
                "test": false,
                "url": "https://www.axs.com/events/390237/rufus-du-sol-tickets",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    },
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2020-01-17T17:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-08-12T01:30:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-08-11",
                        "localTime": "19:30:00",
                        "dateTime": "2021-08-12T01:30:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "onsale"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAvF",
                            "name": "Dance/Electronic"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7va1k",
                            "name": "Witchstep"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    },
                    {
                        "id": "4576",
                        "name": "LIVE NATION 3PE EVENT",
                        "description": "LIVE NATION 3PE EVENT / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZpeU51xGn?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ9173ujV?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ917GgUf?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "RÜFÜS DU SOL",
                            "type": "attraction",
                            "id": "K8vZ9173ujV",
                            "test": false,
                            "url": "https://www.ticketmaster.com/rufus-du-sol-tickets/artist/1957114",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/RUFUSDUSOLVEVO"
                                    },
                                    {
                                        "url": "https://www.youtube.com/user/monekeleon"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/RufusDuSol"
                                    }
                                ],
                                "itunes": [
                                    {
                                        "url": "https://itunes.apple.com/artist/id412480558"
                                    },
                                    {
                                        "url": "https://itunes.apple.com/artist/id799587823"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/R%C3%BCf%C3%BCs_Du_Sol"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/rufusdusol"
                                    }
                                ],
                                "instagram": [
                                    {
                                        "url": "https://www.instagram.com/rufusdusol/"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "1cfa6ee5-1189-4ade-97db-8f20a6ba5c76"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.rufusdusol.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAvF",
                                        "name": "Dance/Electronic"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vAJ1",
                                        "name": "Club Dance"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 10,
                                "ticketmaster": 10
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9173ujV?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Jon Hopkins",
                            "type": "attraction",
                            "id": "K8vZ917GgUf",
                            "test": false,
                            "url": "https://www.ticketmaster.com/jon-hopkins-tickets/artist/1482190",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/JonHopkinsVEVO"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/Jon_Hopkins_"
                                    }
                                ],
                                "itunes": [
                                    {
                                        "url": "https://itunes.apple.com/artist/id15040325"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/jonhopkinsmusic"
                                    },
                                    {
                                        "url": "https://www.facebook.com/King.Creosote.and.Jon.Hopkins"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/Jon_Hopkins"
                                    }
                                ],
                                "instagram": [
                                    {
                                        "url": "https://www.instagram.com/mrjonhopkins/"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "0b0c25f4-f31c-46a5-a4fb-ccbf53d663bd"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.jonhopkins.co.uk/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAvF",
                                        "name": "Dance/Electronic"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vAJ1",
                                        "name": "Club Dance"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 9,
                                "ticketmaster": 8,
                                "mfx-be": 1
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917GgUf?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "RÜFÜS DU SOL",
                "type": "event",
                "id": "G5vzZpeXNzxq2",
                "test": false,
                "url": "https://www.axs.com/events/390409/rufus-du-sol-tickets",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    },
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2020-01-17T17:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-08-13T01:30:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-08-12",
                        "localTime": "19:30:00",
                        "dateTime": "2021-08-13T01:30:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "onsale"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAvF",
                            "name": "Dance/Electronic"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7va1k",
                            "name": "Witchstep"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    },
                    {
                        "id": "4576",
                        "name": "LIVE NATION 3PE EVENT",
                        "description": "LIVE NATION 3PE EVENT / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZpeXNzxq2?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ9173ujV?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ917GgUf?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "RÜFÜS DU SOL",
                            "type": "attraction",
                            "id": "K8vZ9173ujV",
                            "test": false,
                            "url": "https://www.ticketmaster.com/rufus-du-sol-tickets/artist/1957114",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/RUFUSDUSOLVEVO"
                                    },
                                    {
                                        "url": "https://www.youtube.com/user/monekeleon"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/RufusDuSol"
                                    }
                                ],
                                "itunes": [
                                    {
                                        "url": "https://itunes.apple.com/artist/id412480558"
                                    },
                                    {
                                        "url": "https://itunes.apple.com/artist/id799587823"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/R%C3%BCf%C3%BCs_Du_Sol"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/rufusdusol"
                                    }
                                ],
                                "instagram": [
                                    {
                                        "url": "https://www.instagram.com/rufusdusol/"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "1cfa6ee5-1189-4ade-97db-8f20a6ba5c76"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.rufusdusol.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/40e/523d7635-c45d-4bb1-884f-6836101b140e_1418261_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAvF",
                                        "name": "Dance/Electronic"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vAJ1",
                                        "name": "Club Dance"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 10,
                                "ticketmaster": 10
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9173ujV?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Jon Hopkins",
                            "type": "attraction",
                            "id": "K8vZ917GgUf",
                            "test": false,
                            "url": "https://www.ticketmaster.com/jon-hopkins-tickets/artist/1482190",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/JonHopkinsVEVO"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/Jon_Hopkins_"
                                    }
                                ],
                                "itunes": [
                                    {
                                        "url": "https://itunes.apple.com/artist/id15040325"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/jonhopkinsmusic"
                                    },
                                    {
                                        "url": "https://www.facebook.com/King.Creosote.and.Jon.Hopkins"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/Jon_Hopkins"
                                    }
                                ],
                                "instagram": [
                                    {
                                        "url": "https://www.instagram.com/mrjonhopkins/"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "0b0c25f4-f31c-46a5-a4fb-ccbf53d663bd"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.jonhopkins.co.uk/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/472/caa827a1-cfa6-4ddc-b13c-aaf456fe5472_817521_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false,
                                    "attribution": "By Peter Kirn [CC BY-SA 2.0 (https://creativecommons.org/licenses/by-sa/2.0)], from [Flickr (https://www.flickr.com/photos/p_kirn/5020554088)]"
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAvF",
                                        "name": "Dance/Electronic"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vAJ1",
                                        "name": "Club Dance"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 9,
                                "ticketmaster": 8,
                                "mfx-be": 1
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917GgUf?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "Jonas Brothers: The Remember This Tour",
                "type": "event",
                "id": "G5vzZpl1JKecI",
                "test": false,
                "url": "https://www.axs.com/events/403317/jonas-brothers-tickets",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    },
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2021-05-27T16:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-09-06T01:00:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-09-05",
                        "localTime": "19:00:00",
                        "dateTime": "2021-09-06T01:00:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "onsale"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAeA",
                            "name": "Rock"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7v6F1",
                            "name": "Pop"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZpl1JKecI?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ9175T17?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ917KkmV?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "Jonas Brothers",
                            "type": "attraction",
                            "id": "K8vZ9175T17",
                            "test": false,
                            "url": "https://www.ticketmaster.com/jonas-brothers-tickets/artist/1052712",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/channel/UCFvXnyAhluG3sa6p3eOs_LA"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/jonasbrothers"
                                    }
                                ],
                                "itunes": [
                                    {
                                        "url": "https://music.apple.com/us/artist/jonas-brothers/114342891"
                                    }
                                ],
                                "lastfm": [
                                    {
                                        "url": "http://www.last.fm/music/Jonas%20Brothers"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/Jonas_Brothers"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/JonasBrothers"
                                    }
                                ],
                                "spotify": [
                                    {
                                        "url": "https://open.spotify.com/artist/7gOdHgIoIKoe4i9Tta6qdD"
                                    }
                                ],
                                "instagram": [
                                    {
                                        "url": "https://www.instagram.com/jonasbrothers"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "6e019bc6-5c23-4935-94f0-4a896631d846"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.jonasbrothers.com/"
                                    }
                                ]
                            },
                            "aliases": [
                                "jonas bros",
                                "jonas brothers"
                            ],
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/efc/57325e97-ce7b-431d-a751-8929ec5a6efc_1438001_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAeA",
                                        "name": "Rock"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7v6F1",
                                        "name": "Pop"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7l1",
                                        "name": "Group"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7vA71",
                                        "name": "Band"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 45,
                                "ticketmaster": 45
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9175T17?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Kelsea Ballerini",
                            "type": "attraction",
                            "id": "K8vZ917KkmV",
                            "test": false,
                            "url": "https://www.ticketmaster.com/kelsea-ballerini-tickets/artist/2076923",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/KelseaBallerini"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/KelseaBallerini"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/kelseaballerini"
                                    }
                                ],
                                "instagram": [
                                    {
                                        "url": "https://www.instagram.com/kelseaballerini"
                                    },
                                    {
                                        "url": "https://www.instagram.com/kelseaballerini/"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "779d1126-e48c-43f2-8b51-005f3b116d7e"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.kelseaballerini.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/2d4/70fcacf2-320a-4656-80d2-c6a4b4de22d4_880141_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/2d4/70fcacf2-320a-4656-80d2-c6a4b4de22d4_880141_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/2d4/70fcacf2-320a-4656-80d2-c6a4b4de22d4_880141_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/2d4/70fcacf2-320a-4656-80d2-c6a4b4de22d4_880141_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/2d4/70fcacf2-320a-4656-80d2-c6a4b4de22d4_880141_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/2d4/70fcacf2-320a-4656-80d2-c6a4b4de22d4_880141_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/2d4/70fcacf2-320a-4656-80d2-c6a4b4de22d4_880141_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/2d4/70fcacf2-320a-4656-80d2-c6a4b4de22d4_880141_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/2d4/70fcacf2-320a-4656-80d2-c6a4b4de22d4_880141_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/2d4/70fcacf2-320a-4656-80d2-c6a4b4de22d4_880141_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAv6",
                                        "name": "Country"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vAFa",
                                        "name": "Country"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 44,
                                "ticketmaster": 44
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917KkmV?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "Quinn XCII",
                "type": "event",
                "id": "G5vzZplxyy3EZ",
                "test": false,
                "url": "https://www.axs.com/events/403070/quinn-xcii-tickets",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2021-05-27T16:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-08-18T01:00:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-08-17",
                        "localTime": "19:00:00",
                        "dateTime": "2021-08-18T01:00:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "onsale"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAev",
                            "name": "Pop"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7vk1t",
                            "name": "Pop"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZplxyy3EZ?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ917ffB0?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ917prsf?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ9179de0?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ9174qg0?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "Quinn XCII",
                            "type": "attraction",
                            "id": "K8vZ917ffB0",
                            "test": false,
                            "url": "https://www.ticketmaster.com/quinn-xcii-tickets/artist/2211287",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/WatchQuinn"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/quinnxcii"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/quinnxcii"
                                    }
                                ],
                                "instagram": [
                                    {
                                        "url": "https://www.instagram.com/quinnxcii"
                                    },
                                    {
                                        "url": "https://www.instagram.com/quinnxcii/"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "20749ae2-4e7b-4b12-bf58-4436afe33385"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.quinnxcii.com/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/e49/bdea6f98-c1ad-467c-b1f9-8b0bd7deae49_1449741_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAev",
                                        "name": "Pop"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vkEk",
                                        "name": "Indie Pop"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7la",
                                        "name": "Individual"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7vAd7",
                                        "name": "Musician"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 1,
                                "ticketmaster": 1
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917ffB0?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Chelsea Cutler",
                            "type": "attraction",
                            "id": "K8vZ917prsf",
                            "test": false,
                            "url": "https://www.ticketmaster.com/chelsea-cutler-tickets/artist/2437092",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/e83/d23ed862-e708-4b47-b5ad-5c6a20f1fe83_1448881_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/e83/d23ed862-e708-4b47-b5ad-5c6a20f1fe83_1448881_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/e83/d23ed862-e708-4b47-b5ad-5c6a20f1fe83_1448881_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/e83/d23ed862-e708-4b47-b5ad-5c6a20f1fe83_1448881_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/e83/d23ed862-e708-4b47-b5ad-5c6a20f1fe83_1448881_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/e83/d23ed862-e708-4b47-b5ad-5c6a20f1fe83_1448881_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/e83/d23ed862-e708-4b47-b5ad-5c6a20f1fe83_1448881_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/e83/d23ed862-e708-4b47-b5ad-5c6a20f1fe83_1448881_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/e83/d23ed862-e708-4b47-b5ad-5c6a20f1fe83_1448881_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/e83/d23ed862-e708-4b47-b5ad-5c6a20f1fe83_1448881_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAeA",
                                        "name": "Rock"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7v6F1",
                                        "name": "Pop"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7la",
                                        "name": "Individual"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7vAd7",
                                        "name": "Musician"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 1,
                                "ticketmaster": 1
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917prsf?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Jeremy Zucker",
                            "type": "attraction",
                            "id": "K8vZ9179de0",
                            "test": false,
                            "url": "https://www.ticketmaster.com/jeremy-zucker-tickets/artist/2502805",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/c2a/7338a1d7-e8c6-4793-b09f-dd0b6ec0bc2a_1301801_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/c2a/7338a1d7-e8c6-4793-b09f-dd0b6ec0bc2a_1301801_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/c2a/7338a1d7-e8c6-4793-b09f-dd0b6ec0bc2a_1301801_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/c2a/7338a1d7-e8c6-4793-b09f-dd0b6ec0bc2a_1301801_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/c2a/7338a1d7-e8c6-4793-b09f-dd0b6ec0bc2a_1301801_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/c2a/7338a1d7-e8c6-4793-b09f-dd0b6ec0bc2a_1301801_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/c2a/7338a1d7-e8c6-4793-b09f-dd0b6ec0bc2a_1301801_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/c2a/7338a1d7-e8c6-4793-b09f-dd0b6ec0bc2a_1301801_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/c2a/7338a1d7-e8c6-4793-b09f-dd0b6ec0bc2a_1301801_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/c2a/7338a1d7-e8c6-4793-b09f-dd0b6ec0bc2a_1301801_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAev",
                                        "name": "Pop"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vk1t",
                                        "name": "Pop"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7la",
                                        "name": "Individual"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7vAd7",
                                        "name": "Musician"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 2,
                                "ticketmaster": 2
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9179de0?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "ayokay",
                            "type": "attraction",
                            "id": "K8vZ9174qg0",
                            "test": false,
                            "url": "https://www.ticketmaster.com/ayokay-tickets/artist/2289399",
                            "locale": "en-us",
                            "externalLinks": {
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/ayokay"
                                    }
                                ],
                                "itunes": [
                                    {
                                        "url": "https://itunes.apple.com/ca/artist/id648926675"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "04454506-29bb-48f2-a310-bb043f4b6681"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": true
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": true
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAvF",
                                        "name": "Dance/Electronic"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vA1E",
                                        "name": "Dance/Electronic"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7la",
                                        "name": "Individual"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7vAd7",
                                        "name": "Musician"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 1,
                                "ticketmaster": 1
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9174qg0?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "Rowdytown IX: Gigantic NGHTMRE",
                "type": "event",
                "id": "G5vzZpC-XROIG",
                "test": false,
                "url": "https://www.axs.com/events/391868/rowdytown-ix-gigantic-nghtmre-rescheduled-from-2020-tickets?skin=redrocks",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2020-07-08T15:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-09-25T00:00:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-09-24",
                        "localTime": "18:00:00",
                        "dateTime": "2021-09-25T00:00:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "onsale"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAvF",
                            "name": "Dance/Electronic"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7va1k",
                            "name": "Witchstep"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZpC-XROIG?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ917GRLf?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ917K3C0?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ917p1y7?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ9171fl0?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "Big Gigantic",
                            "type": "attraction",
                            "id": "K8vZ917GRLf",
                            "test": false,
                            "url": "https://www.ticketmaster.com/big-gigantic-tickets/artist/1474639",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/BigGigantic"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/biggigantic"
                                    }
                                ],
                                "lastfm": [
                                    {
                                        "url": "http://www.last.fm/music/Big%20Gigantic"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/BigGigantic"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/Big_Gigantic"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "f6c003f9-4aae-40ce-8e4c-112d9a1b140c"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://biggigantic.net/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAvF",
                                        "name": "Dance/Electronic"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vAJ1",
                                        "name": "Club Dance"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 5,
                                "ticketweb": 2,
                                "ticketmaster": 3
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917GRLf?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Nghtmre",
                            "type": "attraction",
                            "id": "K8vZ917K3C0",
                            "test": false,
                            "url": "https://www.ticketmaster.com/nghtmre-tickets/artist/2100926",
                            "locale": "en-us",
                            "externalLinks": {
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/itsNGHTMRE"
                                    }
                                ],
                                "lastfm": [
                                    {
                                        "url": "http://www.last.fm/music/NGHTMRE"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/nghtmre"
                                    }
                                ],
                                "instagram": [
                                    {
                                        "url": "http://instagram.com/nghtmre"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "f72e0c57-94fd-447d-afdb-868e70d356d7"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/46e/ec5648c4-5bf8-4ebc-b1dc-54d18b84146e_1179401_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/46e/ec5648c4-5bf8-4ebc-b1dc-54d18b84146e_1179401_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/46e/ec5648c4-5bf8-4ebc-b1dc-54d18b84146e_1179401_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/46e/ec5648c4-5bf8-4ebc-b1dc-54d18b84146e_1179401_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/46e/ec5648c4-5bf8-4ebc-b1dc-54d18b84146e_1179401_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/46e/ec5648c4-5bf8-4ebc-b1dc-54d18b84146e_1179401_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/46e/ec5648c4-5bf8-4ebc-b1dc-54d18b84146e_1179401_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/46e/ec5648c4-5bf8-4ebc-b1dc-54d18b84146e_1179401_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/46e/ec5648c4-5bf8-4ebc-b1dc-54d18b84146e_1179401_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/46e/ec5648c4-5bf8-4ebc-b1dc-54d18b84146e_1179401_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAvF",
                                        "name": "Dance/Electronic"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vAJ1",
                                        "name": "Club Dance"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 2,
                                "ticketmaster": 2
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917K3C0?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Droeloe",
                            "type": "attraction",
                            "id": "K8vZ917p1y7",
                            "test": false,
                            "url": "https://www.ticketmaster.com/droeloe-tickets/artist/2395692",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": true
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": true
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAvF",
                                        "name": "Dance/Electronic"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vA1E",
                                        "name": "Dance/Electronic"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7l1",
                                        "name": "Group"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7vA71",
                                        "name": "Band"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 3,
                                "ticketmaster": 2,
                                "mfx-cz": 1
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917p1y7?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Goldfish",
                            "type": "attraction",
                            "id": "K8vZ9171fl0",
                            "test": false,
                            "url": "https://www.ticketmaster.com/goldfish-tickets/artist/806908",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/Goldfishlive"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/goldfishlive"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/GOLDFISHLIVE"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "b0354b4a-e18a-40a8-b263-ea1ca1291898"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/2f0/3bb920c8-6122-4fbd-a0e5-4192489de2f0_58621_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/2f0/3bb920c8-6122-4fbd-a0e5-4192489de2f0_58621_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/2f0/3bb920c8-6122-4fbd-a0e5-4192489de2f0_58621_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/2f0/3bb920c8-6122-4fbd-a0e5-4192489de2f0_58621_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/2f0/3bb920c8-6122-4fbd-a0e5-4192489de2f0_58621_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/2f0/3bb920c8-6122-4fbd-a0e5-4192489de2f0_58621_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/2f0/3bb920c8-6122-4fbd-a0e5-4192489de2f0_58621_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/2f0/3bb920c8-6122-4fbd-a0e5-4192489de2f0_58621_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/2f0/3bb920c8-6122-4fbd-a0e5-4192489de2f0_58621_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/2f0/3bb920c8-6122-4fbd-a0e5-4192489de2f0_58621_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAeA",
                                        "name": "Rock"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7v6F1",
                                        "name": "Pop"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 1,
                                "ticketmaster": 1
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9171fl0?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "Rowdytown IX: Big Gigantic",
                "type": "event",
                "id": "G5vzZp7p3a_GY",
                "test": false,
                "url": "https://www.axs.com/events/391869/rowdytown-ix-big-gigantic-rescheduled-from-2020-tickets?skin=redrocks",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2020-02-07T17:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-09-26T00:00:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-09-25",
                        "localTime": "18:00:00",
                        "dateTime": "2021-09-26T00:00:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "onsale"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAvF",
                            "name": "Dance/Electronic"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7va1k",
                            "name": "Witchstep"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    },
                    {
                        "id": "4576",
                        "name": "LIVE NATION 3PE EVENT",
                        "description": "LIVE NATION 3PE EVENT / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZp7p3a_GY?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ917GRLf?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ917bFUf?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ917p0S0?locale=en-us"
                        },
                        {
                            "href": "/discovery/v2/attractions/K8vZ917pbD0?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "Big Gigantic",
                            "type": "attraction",
                            "id": "K8vZ917GRLf",
                            "test": false,
                            "url": "https://www.ticketmaster.com/big-gigantic-tickets/artist/1474639",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/BigGigantic"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/biggigantic"
                                    }
                                ],
                                "lastfm": [
                                    {
                                        "url": "http://www.last.fm/music/Big%20Gigantic"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/BigGigantic"
                                    }
                                ],
                                "wiki": [
                                    {
                                        "url": "https://en.wikipedia.org/wiki/Big_Gigantic"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "f6c003f9-4aae-40ce-8e4c-112d9a1b140c"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://biggigantic.net/"
                                    }
                                ]
                            },
                            "images": [
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/baf/7c2ac34f-2ece-4a97-a728-ccf879d60baf_1263351_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAvF",
                                        "name": "Dance/Electronic"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vAJ1",
                                        "name": "Club Dance"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 5,
                                "ticketweb": 2,
                                "ticketmaster": 3
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917GRLf?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Peekaboo",
                            "type": "attraction",
                            "id": "K8vZ917bFUf",
                            "test": false,
                            "url": "https://www.ticketmaster.com/peekaboo-tickets/artist/2535652",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": true
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": true
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAvF",
                                        "name": "Dance/Electronic"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vA1E",
                                        "name": "Dance/Electronic"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7la",
                                        "name": "Individual"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7vAd7",
                                        "name": "Musician"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 3,
                                "ticketmaster": 3
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917bFUf?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Slenderbodies",
                            "type": "attraction",
                            "id": "K8vZ917p0S0",
                            "test": false,
                            "url": "https://www.ticketmaster.com/slenderbodies-tickets/artist/2451349",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/1b2/116a2239-e7d2-4e2a-b463-a3e6648381b2_1286141_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/1b2/116a2239-e7d2-4e2a-b463-a3e6648381b2_1286141_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/1b2/116a2239-e7d2-4e2a-b463-a3e6648381b2_1286141_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/1b2/116a2239-e7d2-4e2a-b463-a3e6648381b2_1286141_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/1b2/116a2239-e7d2-4e2a-b463-a3e6648381b2_1286141_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/1b2/116a2239-e7d2-4e2a-b463-a3e6648381b2_1286141_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/1b2/116a2239-e7d2-4e2a-b463-a3e6648381b2_1286141_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/1b2/116a2239-e7d2-4e2a-b463-a3e6648381b2_1286141_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/1b2/116a2239-e7d2-4e2a-b463-a3e6648381b2_1286141_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/1b2/116a2239-e7d2-4e2a-b463-a3e6648381b2_1286141_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAvv",
                                        "name": "Alternative"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vAvJ",
                                        "name": "Alternative"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7l1",
                                        "name": "Group"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7vA71",
                                        "name": "Band"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 6,
                                "ticketmaster": 6
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917p0S0?locale=en-us"
                                }
                            }
                        },
                        {
                            "name": "Dreamers Delight",
                            "type": "attraction",
                            "id": "K8vZ917pbD0",
                            "test": false,
                            "url": "https://www.ticketmaster.com/dreamers-delight-tickets/artist/2422273",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": true
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": true
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": true
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/c/df8/81eadad8-4449-412e-a2b1-3d8bbb78edf8_106181_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": true
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAvF",
                                        "name": "Dance/Electronic"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7vA1E",
                                        "name": "Dance/Electronic"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7la",
                                        "name": "Individual"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7vAd7",
                                        "name": "Musician"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 1,
                                "ticketmaster": 1
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ917pbD0?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "The Black Crowes Present: Shake Your Money Maker",
                "type": "event",
                "id": "G5vzZ4UGFqKDT",
                "test": false,
                "url": "https://www.axs.com/events/386559/the-black-crowes-tickets",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    },
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2019-11-11T17:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-08-30T01:30:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-08-29",
                        "localTime": "19:30:00",
                        "dateTime": "2021-08-30T01:30:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "rescheduled"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAeA",
                            "name": "Rock"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7v6F1",
                            "name": "Pop"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    },
                    {
                        "id": "4576",
                        "name": "LIVE NATION 3PE EVENT",
                        "description": "LIVE NATION 3PE EVENT / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZ4UGFqKDT?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ9171uef?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "THE BLACK CROWES",
                            "type": "attraction",
                            "id": "K8vZ9171uef",
                            "test": false,
                            "url": "https://www.ticketmaster.com/the-black-crowes-tickets/artist/734564",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/blackcrowes"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/TBlackCrowes"
                                    }
                                ],
                                "lastfm": [
                                    {
                                        "url": "https://www.last.fm/music/The+Black+Crowes"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/TheBlackCrowes"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "02ceff75-7363-493e-a78d-912dc86c7460"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.blackcrowes.com/"
                                    }
                                ]
                            },
                            "aliases": [
                                "black crows",
                                "black crowes",
                                "the black crows"
                            ],
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAeA",
                                        "name": "Rock"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7v6F1",
                                        "name": "Pop"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 50,
                                "mfx-nl": 2,
                                "mfx-de": 1,
                                "mfx-es": 4,
                                "ticketmaster": 43
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9171uef?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "name": "The Black Crowes Present: Shake Your Money Maker",
                "type": "event",
                "id": "G5vzZ4zs_yvhF",
                "test": false,
                "url": "https://www.axs.com/artists/104808/the-black-crowes-tickets",
                "locale": "en-us",
                "images": [
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RETINA_PORTRAIT_16_9.jpg",
                        "width": 640,
                        "height": 360,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RECOMENDATION_16_9.jpg",
                        "width": 100,
                        "height": 56,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                        "width": 2048,
                        "height": 1152,
                        "fallback": false
                    },
                    {
                        "ratio": "4_3",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_CUSTOM.jpg",
                        "width": 305,
                        "height": 225,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RETINA_PORTRAIT_3_2.jpg",
                        "width": 640,
                        "height": 427,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RETINA_LANDSCAPE_16_9.jpg",
                        "width": 1136,
                        "height": 639,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_EVENT_DETAIL_PAGE_16_9.jpg",
                        "width": 205,
                        "height": 115,
                        "fallback": false
                    },
                    {
                        "ratio": "16_9",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_TABLET_LANDSCAPE_16_9.jpg",
                        "width": 1024,
                        "height": 576,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_TABLET_LANDSCAPE_3_2.jpg",
                        "width": 1024,
                        "height": 683,
                        "fallback": false
                    },
                    {
                        "ratio": "3_2",
                        "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_ARTIST_PAGE_3_2.jpg",
                        "width": 305,
                        "height": 203,
                        "fallback": false
                    }
                ],
                "sales": {
                    "public": {
                        "startDateTime": "2019-12-18T17:00:00Z",
                        "startTBD": false,
                        "startTBA": false,
                        "endDateTime": "2021-08-31T01:30:00Z"
                    }
                },
                "dates": {
                    "start": {
                        "localDate": "2021-08-30",
                        "localTime": "19:30:00",
                        "dateTime": "2021-08-31T01:30:00Z",
                        "dateTBD": false,
                        "dateTBA": false,
                        "timeTBA": false,
                        "noSpecificTime": false
                    },
                    "timezone": "America/Denver",
                    "status": {
                        "code": "rescheduled"
                    },
                    "spanMultipleDays": false
                },
                "classifications": [
                    {
                        "primary": true,
                        "segment": {
                            "id": "KZFzniwnSyZfZ7v7nJ",
                            "name": "Music"
                        },
                        "genre": {
                            "id": "KnvZfZ7vAeA",
                            "name": "Rock"
                        },
                        "subGenre": {
                            "id": "KZazBEonSMnZfZ7v6F1",
                            "name": "Pop"
                        },
                        "type": {
                            "id": "KZAyXgnZfZ7v7nI",
                            "name": "Undefined"
                        },
                        "subType": {
                            "id": "KZFzBErXgnZfZ7v7lJ",
                            "name": "Undefined"
                        },
                        "family": false
                    }
                ],
                "promoter": {
                    "id": "653",
                    "name": "LIVE NATION MUSIC",
                    "description": "LIVE NATION MUSIC / NTL / USA"
                },
                "promoters": [
                    {
                        "id": "653",
                        "name": "LIVE NATION MUSIC",
                        "description": "LIVE NATION MUSIC / NTL / USA"
                    },
                    {
                        "id": "4576",
                        "name": "LIVE NATION 3PE EVENT",
                        "description": "LIVE NATION 3PE EVENT / NTL / USA"
                    }
                ],
                "accessibility": {},
                "ageRestrictions": {
                    "legalAgeEnforced": false
                },
                "_links": {
                    "self": {
                        "href": "/discovery/v2/events/G5vzZ4zs_yvhF?locale=en-us"
                    },
                    "attractions": [
                        {
                            "href": "/discovery/v2/attractions/K8vZ9171uef?locale=en-us"
                        }
                    ],
                    "venues": [
                        {
                            "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                        }
                    ]
                },
                "_embedded": {
                    "venues": [
                        {
                            "name": "Red Rocks Amphitheatre",
                            "type": "venue",
                            "id": "KovZpZAaeIvA",
                            "test": false,
                            "url": "https://www.ticketmaster.com/red-rocks-amphitheatre-tickets-morrison/venue/245763",
                            "locale": "en-us",
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dbimages/6176v.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                }
                            ],
                            "postalCode": "80465",
                            "timezone": "America/Denver",
                            "city": {
                                "name": "Morrison"
                            },
                            "state": {
                                "name": "Colorado",
                                "stateCode": "CO"
                            },
                            "country": {
                                "name": "United States Of America",
                                "countryCode": "US"
                            },
                            "address": {
                                "line1": "18300 W. Alameda Parkway"
                            },
                            "location": {
                                "longitude": "-105.208969",
                                "latitude": "39.66774"
                            },
                            "markets": [
                                {
                                    "name": "Denver and More",
                                    "id": "6"
                                }
                            ],
                            "dmas": [
                                {
                                    "id": 248
                                },
                                {
                                    "id": 254
                                },
                                {
                                    "id": 264
                                },
                                {
                                    "id": 285
                                },
                                {
                                    "id": 347
                                }
                            ],
                            "boxOfficeInfo": {
                                "phoneNumberDetail": "Administration: (720) 865-2494 INFORMATION ONLY Recorded Event Information: (720) 865-2494 All Advance Ticketing done through Ticketmaster.",
                                "openHoursDetail": "Gates open 1 1/2 hours prior to show time and the Box Office opens 2 hours prior to the gates. Box office is located on Red Rocks Park Road (Entrance #2 - Hwy 26/93 at Alameda, South .2 Miles).",
                                "acceptedPaymentDetail": "The box office accepts cash only.",
                                "willCallDetail": "Will call is located halfway up the Red Rocks Park Road (#2) entrance at the Box Office. Tickets may be picked up as early as 2 and a half hours prior to show time on the day of the show unless otherwise posted. Please note that for some Red Rocks shows, Rows 1-6 will be offered as Will Call Only."
                            },
                            "parkingDetail": "Parking is available on site. Price is included in the price of your ticket. Parking lots usually open 1/2 hour prior to door time. Come early to avoid traffic hassles and to get the best parking and best access to seating. Selected shows will have parking open earlier than the standard. Patrons are asked to follow directions of parking personnel and park as close as possible to other cars. **NOTE** NO OVERNIGHT CAMPING PERMITTED!! NOTE: Do not park on the Highway, at entrances to the Park, on private property, Alameda Parkway, or in the town of Morrison. Each of these areas is patrolled and you will be towed. Handicapped parking: Designated accessible parking for persons with disabilities is in two locations. Please check your tickets for the locations of your seats before parking. For access to the top of the amphitheatre, Row 70, parking is available in the Top Circle Lot. For access to the front row, Row 1, the parking is at the Upper South Lot. A valid, appropriate handicap placard or license plate is required to park in a space identified as reserved for persons with disabilities. All park entrances can access all parking lots.",
                            "accessibleSeatingDetail": "Access to Row 1 Accessible seating is via shuttle from Upper South Parking Lot. Access to Row 70 Accessible seating from the top Circle Lot. Please note that for some Red Rocks shows Accessible seating in Rows 1 and 2 will be Will Call only as the only method of delivery available. This information will be listed in the PLEASE NOTE portion on the Event Detail Page. HANDICAP PARKING MUST HAVE APPROVED A.D.A. CREDENTIALS.",
                            "generalInfo": {
                                "generalRule": "PERMITTED/PROHIBITED ITEMS Thank you for helping to keep Red Rocks a beautiful and peaceful place by respecting our unique natural resources. We ask that your activities do not negatively impact the enjoyment of others, or contribute to structural damage to the venue. • Access to the amphitheatre is subject to scheduled events. • Amplified music is not allowed; please limit the enjoyment of music to personal earphones. • Exercise equipment that obstructs access to stairs, benches and other areas that could cause damage to the venue or injury to others is not allowed. • Climbing or hanging on venue structures is prohibited. • No rock climbing or off trail use, violators are subject to arrest and prosecution. • Please refrain from using the Top Plaza for exercise activities. • Exercise Groups: o Friday, Saturday and Sunday: May not exceed 10 members o Monday through Thursday: May not exceed 20 members o Sunday 8am - 10am (April 1-Oct. 31), 9am - 11am (Nov. 1-March 31): Groups sizes are not restricted during this time. • Pets must be on a leash at all times. Please be responsible for cleaning up after your pet and yourself. • Commercial signage is not allowed. • By trademark law you may not reproduce the Red Rocks logo or represent any unauthorized affiliation with Red Rocks Amphitheatre or Park. • Absolutely no vending of food or merchandise in the amphitheatre or parking lots. • Setting up tables and booths is strictly prohibited. • The amphitheatre is monitored 24 hours per day, seven days per week by security personnel to provide assistance and enforcement of amphitheatre rules. Amphitheatre rules are subject to change. For General information call 720-865-2494 Concerts & Events - Permitted Items • Non-alcoholic beverages in factory sealed plastic containers, not to exceed 32 oz. (one quart) (some shows may require the removal of lids upon entering the amphitheatre.) • Empty plastic water bottles • Empty aluminum water bottles • Soft sided coolers, six-pack size (10\" long x 7\" wide x 7\" high) • Cloth bags, soft packs 12” x 17” x 12” (must fit under designated seat) • Food for personal consumption only. Food must be in a clear plastic bag. Maximum bag size one gallon (11\" x 11\") Fruit, vegetables must be sliced. • Binoculars • Blankets (max size 40\" x 60\") Blankets must not extend beyond your ticketed seating area • Seat cushions/soft side seat backs under 18” wide (no items with legs permitted) • Small, compact umbrellas (24\" maximum length) Ponchos preferred • Small, personal cameras (unless prohibited by show) • All personal possessions must fit under the patron’s designated seat (18\" x 12\") Concerts & Events - Prohibited Items • Non factory-sealed beverage/liquid filled containers (including thermoses, bota bags or wine skins) • Alcoholic beverages, marijuana or illegal drugs • Glass bottles or aluminum/steel cans • Laser pointers (will be confiscated & patron subject to ejection) • Hard sided coolers • Soft sided coolers larger than 10\" x 7\" x 7\" • Audio or video recording devices, GoPros, professional cameras or cameras with removable lenses, selfie poles, • Weapons or items construed as weapons (e.g., guns, knives, sticks, fireworks) • Totems of any type, make/model • Bullhorns or noisemakers • Aerosol cans (e.g., hairspray, sunscreen) • Framed backpacks • Strollers of any kind • Confetti • Tarps • Animals (except service dogs) • Skateboards or inline skates • Personal property that is a potential hazard to others (e.g., chains, wallet chains or jewelry with spiked edges) • Glow/LED Poi Sticks • Glass objects • Remote controlled flying devices or UAVs (unmanned aerial vehicles) • LED Gloves For your safety and the safety of others, guests and their possessions are subject to inspection as condition of admittance. Please have your bags open and available for inspection. Smoking is only permitted in designated areas along the outside rail of the outside stairs. Smoking is strictly prohibited in the seating area of the amphitheatre, including E cigarettes. Red Rocks Management reserves final decision on items brought into the venue. Re-entry is not permitted except in designated emergencies and severe weather conditions. Private vending (including tickets) is prohibited within the park and amphitheatre. Intoxicated patrons may be denied admittance to the Amphitheatre."
                            },
                            "upcomingEvents": {
                                "_total": 18,
                                "ticketmaster": 18
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/venues/KovZpZAaeIvA?locale=en-us"
                                }
                            }
                        }
                    ],
                    "attractions": [
                        {
                            "name": "THE BLACK CROWES",
                            "type": "attraction",
                            "id": "K8vZ9171uef",
                            "test": false,
                            "url": "https://www.ticketmaster.com/the-black-crowes-tickets/artist/734564",
                            "locale": "en-us",
                            "externalLinks": {
                                "youtube": [
                                    {
                                        "url": "https://www.youtube.com/user/blackcrowes"
                                    }
                                ],
                                "twitter": [
                                    {
                                        "url": "https://twitter.com/TBlackCrowes"
                                    }
                                ],
                                "lastfm": [
                                    {
                                        "url": "https://www.last.fm/music/The+Black+Crowes"
                                    }
                                ],
                                "facebook": [
                                    {
                                        "url": "https://www.facebook.com/TheBlackCrowes"
                                    }
                                ],
                                "musicbrainz": [
                                    {
                                        "id": "02ceff75-7363-493e-a78d-912dc86c7460"
                                    }
                                ],
                                "homepage": [
                                    {
                                        "url": "http://www.blackcrowes.com/"
                                    }
                                ]
                            },
                            "aliases": [
                                "black crows",
                                "black crowes",
                                "the black crows"
                            ],
                            "images": [
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RETINA_PORTRAIT_16_9.jpg",
                                    "width": 640,
                                    "height": 360,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RECOMENDATION_16_9.jpg",
                                    "width": 100,
                                    "height": 56,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_TABLET_LANDSCAPE_LARGE_16_9.jpg",
                                    "width": 2048,
                                    "height": 1152,
                                    "fallback": false
                                },
                                {
                                    "ratio": "4_3",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_CUSTOM.jpg",
                                    "width": 305,
                                    "height": 225,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RETINA_PORTRAIT_3_2.jpg",
                                    "width": 640,
                                    "height": 427,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_RETINA_LANDSCAPE_16_9.jpg",
                                    "width": 1136,
                                    "height": 639,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_EVENT_DETAIL_PAGE_16_9.jpg",
                                    "width": 205,
                                    "height": 115,
                                    "fallback": false
                                },
                                {
                                    "ratio": "16_9",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_TABLET_LANDSCAPE_16_9.jpg",
                                    "width": 1024,
                                    "height": 576,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_TABLET_LANDSCAPE_3_2.jpg",
                                    "width": 1024,
                                    "height": 683,
                                    "fallback": false
                                },
                                {
                                    "ratio": "3_2",
                                    "url": "https://s1.ticketm.net/dam/a/69a/3ba3615f-6b0e-425b-8aae-4f9e5ad4969a_1368521_ARTIST_PAGE_3_2.jpg",
                                    "width": 305,
                                    "height": 203,
                                    "fallback": false
                                }
                            ],
                            "classifications": [
                                {
                                    "primary": true,
                                    "segment": {
                                        "id": "KZFzniwnSyZfZ7v7nJ",
                                        "name": "Music"
                                    },
                                    "genre": {
                                        "id": "KnvZfZ7vAeA",
                                        "name": "Rock"
                                    },
                                    "subGenre": {
                                        "id": "KZazBEonSMnZfZ7v6F1",
                                        "name": "Pop"
                                    },
                                    "type": {
                                        "id": "KZAyXgnZfZ7v7nI",
                                        "name": "Undefined"
                                    },
                                    "subType": {
                                        "id": "KZFzBErXgnZfZ7v7lJ",
                                        "name": "Undefined"
                                    },
                                    "family": false
                                }
                            ],
                            "upcomingEvents": {
                                "_total": 50,
                                "mfx-nl": 2,
                                "mfx-de": 1,
                                "mfx-es": 4,
                                "ticketmaster": 43
                            },
                            "_links": {
                                "self": {
                                    "href": "/discovery/v2/attractions/K8vZ9171uef?locale=en-us"
                                }
                            }
                        }
                    ]
                }
            }
        ]
    },
    "_links": {
        "self": {
            "href": "/discovery/v2/events.json?city=Morrison&keyword=Red+Rocks"
        }
    },
    "page": {
        "size": 20,
        "totalElements": 18,
        "totalPages": 1,
        "number": 0
    }
}
end