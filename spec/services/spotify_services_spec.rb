require 'rails_helper'

RSpec.describe "spotify service" do
    it "returns song data", :vcr do
      data = SpotifyService.get_last_song_db

      expect(data).to be_a Hash
      expect(data).to have_key :items
      expect(data[:items]).to be_an Array

      expect(data[:items].first).to be_a Hash
      expect(data[:items].first).to have_key :track

      expect(data[:items].first[:track]).to be_a Hash
      expect(data[:items].first[:track]).to have_key :artists
      expect(data[:items].first[:track][:artists]).to be_an Array
      expect(data[:items].first[:track][:artists].first).to be_a Hash
      expect(data[:items].first[:track][:artists].first).to have_key :name
      expect(data[:items].first[:track][:artists].first[:name]).to be_a String

      expect(data[:items].first[:track]).to have_key :name
      expect(data[:items].first[:track][:name]).to be_a String
  end
end
