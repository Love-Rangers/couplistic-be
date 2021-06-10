require 'rails_helper'

RSpec.describe 'ticket master facade' do
  it 'can return a ticket master object', :vcr do
    keyword_query = "Red Rocks"
    city_query    = "Morrison"

      ticket_master = TicketMasterFacade.event_search(keyword_query, city_query)

      expect(ticket_master).to be_an(Array)

      expect(ticket_master[0]).to be_a(TicketMaster)

      expect(ticket_master[0].event_name).to be_a(String)
      expect(ticket_master[0].id).to be_a(String)
      expect(ticket_master[0].poster).to be_a(String)
      expect(ticket_master[0].start_time).to be_a(String)
      expect(ticket_master[0].url).to be_an(String)
      expect(ticket_master[0].venue.first).to be_a(String)
  end
end
