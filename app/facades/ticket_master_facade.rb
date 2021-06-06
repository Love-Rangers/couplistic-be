class TicketMasterFacade
  class << self
    def event_search(keyword_query, city_query)
      TicketMasterService.event_search_db(keyword_query, city_query).map do |event_data|
        TicketMaster.new(event_data)
      end
    end
  end
end