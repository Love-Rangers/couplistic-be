require 'rails_helper'

RSpec.describe 'ticketmaster object' do
  it 'abstracts and encapsulates ticketmaster data that can be read' do
    ticket_master = TicketMaster.new(ticket_master_poro_data[:_embedded][:events][0])

    expect(ticket_master).to be_a(TicketMaster)

    expect(ticket_master.event_name).to eq("STS9: Red Rocks 2021 (Sky World)")
    expect(ticket_master.url).to eq("https://www.axs.com/events/391667/sts9-7-23-21-tickets")
    expect(ticket_master.poster).to eq("https://s1.ticketm.net/dam/a/fee/c22def20-7669-41a3-8942-998014dd2fee_285011_RETINA_LANDSCAPE_16_9.jpg")
    expect(ticket_master.start_time).to eq("2020-02-21T17:00:00Z")
    expect(ticket_master.venue).to eq("Red Rocks Amphitheatre")
  end
end