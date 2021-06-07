class SpotifySerializer
  include FastJsonapi::ObjectSerializer
  attributes :artist, :song_name
end
