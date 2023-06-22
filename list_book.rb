require_relative 'book'
require_relative 'label'

class ListBook
    attr_reader :books, :labels

    def initialize
        @books = []
        @labels = []
        load_books
        load_labels
    end

    def list_labels
        @labels.empty? ? puts('No genre added') : @labels.each { |label| puts "Title: #{label.title}, Color: #{label.color}" }
        puts ''
    end

    def list_all_book
        if @books.empty?
          puts 'No book added'
        else
          @books.each do |book|
            puts "Publish date: #{book.publish_date}, Publisher: #{book.publisher}, Cover state: #{book.cover_state}"
          end
          puts ''
        end
    end

    def add_book
        puts 'Please, enter your the name of the book'
        title = gets.chomp
        puts 'Please, enter the color of the book'
        color = gets.chomp
        puts 'Please, enter the publish year of the book (YYYY-MM-DD): '
        publish_date = gets.chomp
        puts 'Please, enter the publisher of the book: '
        publisher = gets.chomp

        cover_state = stimulate_cover_state

        book = Book.new(publish_date, publisher, cover_state)
        label = Label.new(title, color)
        @books.push(book)
        @labels.push(label)
        puts 'Book added successfully'
        save_book
        save_labels
    end

    def stimulate_cover_state
        puts 'Please, Enter the cover state of the book'
        cover_state = gets.chomp.upcase
        return cover_state if %w[GOOD BAD].include?(cover_state)

        puts 'Invalid cover state, please enter GOOD or BAD'
    end

    def save_book
        books = @books.map { |book| { id: book.id, publish_date: book.publish_date, publisher: book.publisher, cover_state: book.cover_state} }
        dir_path = File.dirname('data/book.json')
        FileUtils.mkdir_p(dir_path)
        File.write('data/book.json', JSON.pretty_generate(books))
    end

    def save_labels
        labels = @labels.map { |label| { title: label.title, color: label.color, } }
        dir_path = File.dirname('data/labels.json')
        FileUtils.mkdir_p(dir_path)
        File.write('data/labels.json', JSON.pretty_generate(labels))
    end

    def load_books
        if File.exist?('data/book.json')
          data = File.read('data/book.json')
          books = JSON.parse(data)
          @books = books.map { |book| Book.new(book['publish_date'], book['publisher'], book['cover_state']) }
          puts 'Books loaded successfully'
        else
          puts 'No data file found'
        end
    end

    def load_labels
        if File.exist?('data/labels.json')
          data = File.read('data/labels.json')
          labels = JSON.parse(data)
          @labels = labels.map { |label| Label.new(label['title'], label['color']) }
          puts 'Labels loaded successfully'
        else
          puts 'No data file found'
        end
    end
end