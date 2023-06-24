require_relative 'list_music'
require_relative 'music_album'
require_relative 'genre'
require_relative 'list_book'
require_relative 'book'
require_relative 'list_game'

class App
  def initialize
    @music = ListMusic.new
    @book = ListBook.new
    @game = ListGame.new
  end

  def select_option(option)
    case option
    when '1'
      @book.list_all_book
    when '2'
      @book.list_labels
    when '3'
      @music.list_music_albums
    when '4'
      @music.list_genres
    when '5'
      @game.list_all_game
    when '6'
      @game.list_authors
    end
  end

  def add_items(option)
    case option
    when '7'
      @book.add_book
    when '8'
      @music.add_music_album
    when '9'
      @game.add_game
    end
  end
end
