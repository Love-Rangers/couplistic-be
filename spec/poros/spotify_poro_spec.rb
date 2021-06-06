require 'rails_helper'

RSpec.describe "spotify service" do
    it "returns song data" do

      spotify = Spotify.new(spotify_poro)
      expect(spotify).to be_a(Spotify)
      expect(spotify.artist).to be_an(Array)
      expect(spotify.artist.first).to eq("Deftones")
      expect(spotify.song_name).to be_an(Array)
      expect(spotify.song_name.first).to eq("Change (In the House of Flies)")
  end
end
