class SpotifyFacade
  def self.get_last_song
    song = SpotifyService.get_last_song_db
    
    Spotify.new(song)
  end
end