class Api::V1::EventsController < ApplicationController
  def index
    if params[:user_id]
      unless Event.where(user_id: params[:user_id]).empty?
        user_events = Event.where(user_id: params[:user_id])

        render json: UserEventSerializer.new(user_events)
      else
        render json: {data: 'user_id does not exist'}, status: 204
      end
    else
      render json: {data: 'Not found'}, status: 404
    end
  end
  
  def create
    event = Event.new(event_params)

    if event.save
      
      render json: EventSerializer.new(Event.with_user_id(params[:user_id]))
    else


    end
  end
end
