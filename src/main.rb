# IMPORTS
require "tty-prompt"
require "colorize"
require "./functions"

begin
    # MAIN PROGRAM
    program_running = true
    Functions.print_welcome_screen

    # keep running the app until the user selects 'Quit'
    while program_running
        menu_selection = Functions.main_menu_selection
        case menu_selection

        when "Play Game"
            puts "play game page"

        when "Help"
            puts "rules page"

        when "Quit"
            puts "quit page"

        else
            puts "no mans land."

        end
    end
# Handle error is someone exits the program using ctrl+c
rescue TTY::Reader::InputInterrupt => e
    puts ""
    puts "Error (#{e.message.red}): program unexpectedly exited".red
end
