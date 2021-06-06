class Api::V1::TicketmasterController < ApplicationController
  def show 
    keyword_query = "Red Rocks"
    city_query    = "Morrison"

    conn = Faraday.new(url: "https://app.ticketmaster.com/") do |faraday|
      faraday.params[:apikey] = ENV['ticket_master_api_key']
    end

    response = conn.get("discovery/v2/events.json?keyword=#{keyword_query}&city=#{city_query}")
    
    data  = JSON.parse(response.body, symbolize_names: true)
    event = TicketMaster.new(data)
    json render: EventSerializer.new(event)
  end
end