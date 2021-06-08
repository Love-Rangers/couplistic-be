require 'rails_helper'

RSpec.describe "GET '/api/v1/events" do
  it "Happy path: I can retrieve events for current calender month" do
    events = FactoryBot.create_list(:random_event, 5)
    event_1  = FactoryBot.create(:random_event, user_id: 1)
    event_2  = FactoryBot.create(:random_event, user_id: 1)
    event_3  = FactoryBot.create(
      :random_event, user_id: 1, 
      start_time: Faker::Date.in_date_period(month: 7)
    )

    get '/api/v1/events?user_id=1'

    body = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    
    expect(body).to be_a(Hash)
    expect(body[:data]).to be_an(Array)
    expect(body[:data].size).to eq(3)

    expect(body[:data][0]).to have_key :attributes
    expect(body[:data][0][:attributes]).to be_a(Hash)

    expect(body[:data][0][:attributes]).to have_key :name
    expect(body[:data][0][:attributes][:name]).to be_a(String) 

    expect(body[:data][0][:attributes]).to have_key :start_time
    expect(body[:data][0][:attributes][:start_time]).to be_a(String) 

    expect(body[:data][0][:attributes]).to have_key :location
    expect(body[:data][0][:attributes][:location]).to be_a(String) 

    expect(body[:data][0][:attributes]).to have_key :user_id
    expect(body[:data][0][:attributes][:user_id]).to be_a(Integer)
  end

  it "sad path: no user_id param" do
    get '/api/v1/events'
    
    expect(response.status).to eq(404)
  end
  
  it "sad path: user_id as a string" do
    get "/api/v1/events?user_id='1'"

    expect(response.status).to eq(204)
  end

  it "sad path: user_id as a does not exist" do
    get "/api/v1/events?user_id=123456"

    expect(response.status).to eq(204)
  end
end
