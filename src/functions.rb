require "tty-font"
require "colorize"
require "tty-prompt"

# this module contains functions used in the wordle app
module Functions
    # get the main menu selection from user
    def self.main_menu_selection
        prompt = TTY::Prompt.new
        puts ""
        menu_selection = prompt.select("MAIN MENU".bold, ["Play Game", "Help", "Quit"])
        return menu_selection
    end

    # generic functions for printing messages for user feedback
    def self.print_msg(msg_string)
        puts "#{'>>'.red} #{msg_string}"
    end

    # print welcome screen when user opens app
    def self.print_welcome_screen
        font = TTY::Font.new(:doom)
        puts ""
        title = font.write("Wordle.").yellow
        puts title
    end
end
