class Api::V1::SpotifyController < ApplicationController
  def show
    @song = SpotifyFacade.get_last_song
  end
end