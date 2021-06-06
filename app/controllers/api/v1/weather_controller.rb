class Api::V1::WeatherController < ApplicationController
  def place_search_request
    render json: WeatherFacade.get_three_day_forecast(params[:q])
  end
end
