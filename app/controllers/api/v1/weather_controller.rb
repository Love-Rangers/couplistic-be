class Api::V1::WeatherController < ApplicationController
  def show
    require 'pry'; binding.pry
    @weather = WeatherFacade.get_three_day_forecast
  end
end