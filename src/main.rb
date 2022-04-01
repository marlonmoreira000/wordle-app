# IMPORTS
require "tty-prompt"
require "colorize"
require "./game"

begin
    # MAIN PROGRAM
    program_running = true
    word = "trump".upcase
    game = Game.new(word)
    Game.print_welcome_screen

    # keep running the app until the user selects 'Quit'
    while program_running
        menu_selection = Game.main_menu_selection
        case menu_selection

        when "Play Game"
            game.run

        when "Help"
            puts "rules page"

        when "Quit"
            program_running = false

        else
            puts "no mans land.".red
        end
    end

# Handle error is someone exits the program using ctrl+c
rescue TTY::Reader::InputInterrupt => e
    puts ""
    puts "Error (#{e.message.red}): program unexpectedly exited".red
end
