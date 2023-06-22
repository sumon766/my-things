require_relative 'app'
require_relative 'select_menu'

class Main
    puts 'Welcome to my things'

    def start
        new_app = App.new
        loop do
            select_menu
            option = gets.chomp
            if option == '3'
                puts 'Thank you for using this app. See you later'
                break
            else
                new_app.select_option(option)
                new_app.add_items(option)
            end
        end
    end
end

def main
    app = Main.new
    app.start
end

main