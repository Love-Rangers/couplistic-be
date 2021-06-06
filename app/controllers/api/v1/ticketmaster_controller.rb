class Api::V1::TicketmasterController < ApplicationController
  def index
    keyword_query = "Red Rocks"
    city_query    = "Morrison"

    event_poros   = TicketMasterFacade.event_search(keyword_query, city_query)

    render json: EventSerializer.new(event_poros)
  end
end