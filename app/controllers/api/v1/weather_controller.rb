class Api::V1::WeatherController < ApplicationController
  def show
<<<<<<< HEAD
    @weather = WeatherFacade.get_three_day_forecast
    require 'pry'; binding.pry
=======
    @weather = WeatherFacade.get_three_day_forecast(params[:q])
    render json: WeatherSerializer.new(items)
>>>>>>> de214692b3f4984ffbb635968f7259724425582d
  end
end
