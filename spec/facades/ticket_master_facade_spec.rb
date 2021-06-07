require 'rails_helper'

RSpec.describe 'ticket master facade' do
  it 'can return a ticket master object' do
    fixture_json = File.read('spec/fixtures/morrison_search.json')
    search_details = "morrison_search"
    
    keyword_query = "Red Rocks"
    city_query    = "Morrison"

    stub_request(:get, "https://app.ticketmaster.com/discovery/v2/events.json?keyword=#{keyword_query}&city=#{city_query}&apikey=z8O2gWzfs5rYS1KeUK0dGJ3J9tKI07Rw").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.4.2'
          }).
        to_return(status: 200, body: fixture_json, headers: {})

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
