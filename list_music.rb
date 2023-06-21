require_relative 'music_album'
require_relative 'genre'

class ListMusic
  attr_accessor :albums, :genre

  def initialize
    @albums = []
    @genres = []
  end

  def list_genres
    @genres.empty? ? puts('No genre added') : @genres.each { |genre| puts "Genre: #{genre.name}" }
    puts ''
  end

  def list_music_albums
    if @albums.empty?
      puts 'No music added'
    else
      @albums.each do |album|
        puts "Publish date: #{album.publish_date}, On spotify: #{album.on_spotify}"
      end
      puts ''
    end
  end

  def add_music_album
    puts 'Publlish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    on_spotify = spotify_availability

    music_album = MusicAlbum.new(on_spotify, publish_date)
    @albums << music_album
    puts 'Album created successfully'

    puts 'Add the genre if the album'
    name = gets.chomp
    @genres << Genre.new(name)
    puts "#{name} gnere created successfully"
  end

  def spotify_availability
    loop do
      puts 'Is it on Spotify? (Y/N): '
      input = gets.chomp.downcase
      return input == 't' if %w[t f].include?(input)
    end
  end
end
