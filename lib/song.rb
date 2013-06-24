require './lib/song_lyrics'

class Song
  attr_accessor :title, :artist, :lyrics

  def initialize(artist, title)
    @artist = artist
    @title  = title
    @lyrics = SongLyrics.fetch(artist, title)
  end
end