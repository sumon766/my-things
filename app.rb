require_relative 'list_music'
require_relative 'music_album'
require_relative 'genre'
require_relative 'list_book'
require_relative 'book'

class App
  def initialize
    @music = ListMusic.new
    @book = ListBook.new
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
    end
  end

  def add_items(option)
    case option
    when '5'
      @book.add_book
    when '6'
      @music.add_music_album
    end
  end
end
