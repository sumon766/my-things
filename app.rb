require_relative 'list_music'
require_relative 'music_album'
require_relative 'genre'

class App
    def initialize
        @music = ListMusic.new
    end

    def select_option(option)
        case option
        when '1'
            @music.list_music_albums
        end
    end
    
    def add_items(option)
        case option
        when '2'
            @music.add_music_album
        end
    end
end
