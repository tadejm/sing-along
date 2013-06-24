require 'lyricfy'

class SongLyrics
  def initialize(artist, title)
    @artist, @title = artist, title
  end

  def self.fetch(artist, title)
    new(artist, title).fetch
  end

  def fetch
    return unless valid?

    fetcher = Lyricfy::Fetcher.new
    song = fetcher.search @artist, @title
    song.nil?? 'No lyrics found' : song.body
  end

  def valid?
    title_valid? && artist_valid?
  end

  private

  def title_valid?
    !(@title.nil? or @title == '')
  end

  def artist_valid?
    !(@artist.nil? or @artist == '')
  end
end