require_relative 'author'
require_relative 'game'
require 'json'
require 'fileutils'

class ListGame
    attr_accessor :games, :authors

    def initialize
        @games = []
        @authors = []
        load_games
        load_authors
    end
    
    def list_all_game
        if @games.empty?
          puts 'No game added'
        else
          @games.each do |game|
            puts "Publish date: #{game.publish_date}, Title: #{game.title}, Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at}"
          end
          puts ''
        end
    end

    def list_authors
        if @authors.empty?
          puts('No author added')
        else
          @authors.each { |author| puts "First name: #{author.first_name}, Last name: #{author.last_name}" }
        end
        puts ''
    end

    def add_game
        puts 'Please, enter the title of your game'
        title = gets.chomp
        puts 'Please, enter the publishing date of the game (YYYY-MM-DD): '
        publish_date = gets.chomp
        puts 'Please, enter the last played at (YYYY-MM-DD): '
        last_played_at = gets.chomp
        
        multiplayer = stimulate_multiplayer

        puts 'Enter the first name of the author'
        first_name = gets.chomp
        puts 'Enter the last name of the author'
        last_name = gets.chomp
    
        game = Game.new(title, publish_date, last_played_at, multiplayer)
        author = Author.new(first_name, last_name)
        @games.push(game)
        @authors.push(author)
        puts 'Game added successfully'
        save_game
        save_authors
    end

    def stimulate_multiplayer
        puts 'Is it multiplayer (Y/N): '
        multiplayer = gets.chomp.upcase
        return multiplayer if %w[Y N].include?(multiplayer)

        puts 'Invalid multiplayer, please enter Y or N'
    end

    def save_game
        games = @games.map do |game|
          {
            id: game.id,
            publish_date: game.publish_date,
            last_played_at: game.last_played_at,
            multiplayer: game.multiplayer
          }
        end
    
        dir_path = File.dirname('data/game.json')
        FileUtils.mkdir_p(dir_path)
        File.write('data/game.json', JSON.pretty_generate(games))
    end

    def save_authors
        authors = @authors.map { |author| { first_name: author.first_name, last_name: author.last_name } }
        dir_path = File.dirname('data/author.json')
        FileUtils.mkdir_p(dir_path)
        File.write('data/author.json', JSON.pretty_generate(authors))
    end

    def load_games
        if File.exist?('data/game.json')
          data = File.read('data/game.json')
          games = JSON.parse(data)
          @games = games.map { |game| Game.new(game['title'], game['publish_date'], game['last_played_at'], game['multiplayer']) }
          puts 'Games loaded successfully'
        else
          puts 'No data file found'
        end
    end

    def load_authors
        if File.exist?('data/author.json')
          data = File.read('data/author.json')
          authors = JSON.parse(data)
          @authors = authors.map { |author| Author.new(author['first_name'], author['last_name']) }
          puts 'Authors loaded successfully'
        else
          puts 'No data file found'
        end
    end
end    