require 'rails_helper'

RSpec.describe 'spotify facade' do
  it "returns a spotify object", :vcr do

    spotify = SpotifyFacade.get_last_song

    expect(spotify).to be_a Spotify

    expect(spotify.song_name).to be_an Array
    expect(spotify.song_name[0]).to be_a String

    expect(spotify.artist).to be_an Array
    expect(spotify.artist[0]).to be_a String
  end
end
