class SpotifyService < BaseService

  def self.get_last_song_db
    response = conn('https://api.spotify.com').get('/v1/me/player/recently-played') do |f|
      f.headers['Authorization'] = "Bearer #{ENV['spotify_key']}"
    end
    format_json(response)
  end
end