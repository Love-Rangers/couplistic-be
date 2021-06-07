class Api::V1::WeatherController < ApplicationController
  def index
    weather = WeatherFacade.get_three_day_forecast(params[:q])
    
    render json: WeatherSerializer.new(weather)
  end
end
