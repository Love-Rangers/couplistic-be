class Api::V1::WeatherController < ApplicationController
  def index
    if params[:q].present?
      weather = WeatherFacade.get_three_day_forecast(params[:q])
      if weather == "No matching location found."
        render json: {}, status: 422
      else
        render json: WeatherSerializer.new(weather)
      end
    else
      render json: {}, status: 422
    end
  end
end