require 'rails_helper'

RSpec.describe "spotify service" do
  describe "spotify request" do
    it "returns song data" do

        data = SpotifyService.get_last_song_db
        expect(data[:items]).to be_an Array
        expect(data[:items].first).to be_a Hash
    end
  end
end