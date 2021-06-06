class Api::V1::TicketmasterController < ApplicationController
  def index
    # keyword_query = "Red Rocks"
    # city_query    = "Morrison"

    event_poros = TicketMasterFacade.event_search(params[:keyword], params[:city])

    render json: EventSerializer.new(event_poros)
    # render json: TicketMasterFacade.event_search(params[:keyword], params[:city])

  end
end
