require 'rails_helper'

RSpec.describe 'ticket master service' do
  it 'can return a ticket master json' do
    fixture_json = File.read('spec/fixtures/morrison_search.json')
    
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

    json = TicketMasterService.event_search_db(keyword_query, city_query)
    
    expect(json).to be_an(Array)
    
    expect(json[0]).to have_key :name
    expect(json[0][:name]).to be_a(String)

    expect(json[0]).to have_key :url
    expect(json[0][:url]).to be_a(String)
    
    expect(json[0]).to have_key :images
    expect(json[0][:images]).to be_an(Array)

    expect(json[0][:images][0]).to have_key :url
    expect(json[0][:images][0][:url]).to be_a(String)

    expect(json[0]).to have_key :sales
    expect(json[0][:sales]).to have_key :public

    expect(json[0][:sales][:public]).to have_key :startDateTime
    expect(json[0][:sales][:public][:startDateTime]).to be_a(String)


    expect(json[0]).to have_key :_embedded
    expect(json[0][:_embedded]).to have_key :venues
    expect(json[0][:_embedded][:venues]).to be_an(Array)
    expect(json[0][:_embedded][:venues][0]).to have_key :name
    expect(json[0][:_embedded][:venues][0][:name]).to be_a(String)

    expect(json[0]).to have_key :id
    expect(json[0][:id]).to be_a(String)
  end
end
