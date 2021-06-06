class Api::V1::WeatherController < ApplicationController
  def show
    @weather = WeatherFacade.get_three_day_forecast(params[:q])
    render json: WeatherSerializer.new(items)
  end
end
