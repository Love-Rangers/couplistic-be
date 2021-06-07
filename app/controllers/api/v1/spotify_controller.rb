class Api::V1::SpotifyController < ApplicationController
  def show
    song = SpotifyFacade.get_last_song
    render json: SpotifySerializer.new(song)
  end
end
