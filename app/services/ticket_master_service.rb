class TicketMasterService < BaseService
  class << self
    def event_search_db(keyword_query, city_query)
      response = conn("https://app.ticketmaster.com/").get("discovery/v2/events.json") do |f|
        f.params[:apikey]  = ENV['ticketm_key']
        f.params[:keyword] = keyword_query
        f.params[:city]    = city_query
      end
      format_json(response)[:_embedded][:events][0..4]
    end
  end
end
