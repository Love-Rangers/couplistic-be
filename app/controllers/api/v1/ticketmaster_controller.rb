class Api::V1::TicketmasterController < ApplicationController
  def index
    event_poros = TicketMasterFacade.event_search(params[:keyword], params[:city])
    render json: EventSerializer.new(event_poros)
  end
end
