require 'rails_helper'

RSpec.describe 'SpotifyFacades' do
  xit "returns an spotify objects" do

    spotify = SpotifyFacade.get_last_song
    expect(spotify).to be_a Spotify

    expect(spotify.songs).to be_an Array
    
    expect(spotify.song_name).to be_an Array
    expect(spotify.song_name[0]).to be_an String

    expect(spotify.artist).to be_an Array
    expect(spotify.artist[0]).to be_an String
  end
end