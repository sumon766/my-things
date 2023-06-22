require_relative 'music_album'
require_relative 'genre'
require 'json'
require 'fileutils'
require 'securerandom'

class ListMusic
  attr_accessor :albums, :genre

  def initialize
    @albums = []
    @genres = []
    load_albums
    load_genres
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
    puts "#{name} genre created successfully"
    save_album
    save_genres
  end

  def spotify_availability
    loop do
      puts 'Is it on Spotify? (Y/N): '
      input = gets.chomp.downcase
      return input == 'y' if %w[y n].include?(input)

      puts 'Invalid input. Please enter either y or n.'
    end
  end

  def save_album
    albums = @albums.map { |album| { id: album.id, publish_date: album.publish_date, on_spotify: album.on_spotify } }
    dir_path = File.dirname('data/music.json')
    FileUtils.mkdir_p(dir_path)
    File.write('data/music.json', JSON.pretty_generate(albums))
  end

  def save_genres
    genres = @genres.map { |genre| { name: genre.name } }
    dir_path = File.dirname('data/genres.json')
    FileUtils.mkdir_p(dir_path)
    File.write('data/genres.json', JSON.pretty_generate(genres))
  end

  def load_albums
    if File.exist?('data/music.json')
      data = File.read('data/music.json')
      albums = JSON.parse(data)
      @albums = albums.map { |album| MusicAlbum.new(album['on_spotify'], album['publish_date'], album['id']) }
      puts 'Albums loaded successfully'
    else
      puts 'No data file found'
    end
  end

  def load_genres
    if File.exist?('data/genres.json')
      data = File.read('data/genres.json')
      genres = JSON.parse(data)
      @genres = genres.map { |genre| Genre.new(genre['name']) }
      puts 'Genres loaded successfully'
    else
      puts 'No data file found'
    end
  end
end
