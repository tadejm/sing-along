require 'sinatra'
require './lib/song'

get '/' do
end

get '/lyrics' do
  logger.info "Params: #{params}"

  artist, title = params['artist'], params['title']
  Song.new(artist, title).lyrics
end