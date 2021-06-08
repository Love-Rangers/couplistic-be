class Api::V1::EventsController < ApplicationController
  def create
    event = Event.new(event_params)

    if event.save
      
      render json: EventSerializer.new(Event.with_user_id(params[:user_id]))
    else


    end
    require "pry"; binding.pry
  end
end
