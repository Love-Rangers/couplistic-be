# class Spotify
#   attr_reader   :songs,
#                 :artist,
#                 :song_name
#
#   def initialize(spotify_data)
#     @songs = spotify_data[:items]
#   end
#
#   def artist
#     @songs.map do |song|
#       song[:track][:artists].map do |artist|
#         artist[:name]
#       end
#     end.flatten
#   end
#
#   def song_name
#     @songs.map do |song|
#       song[:track][:name]
#     end
#   end
# end
