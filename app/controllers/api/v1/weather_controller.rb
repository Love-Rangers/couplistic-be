class Api::V1::WeatherController < ApplicationController
  def show
    @weather = WeatherFacade.get_three_day_forecast
    require 'pry'; binding.pry
  end
end