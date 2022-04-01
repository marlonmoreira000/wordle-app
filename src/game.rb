require "colorize"
require "tty-font"

# this class represents a game of wordle
class Game
    def initialize(word)
        @guesses = {guess_1: "", guess_2: "", guess_3: "", guess_4: "", guess_5: ""}
        @word = word.upcase
    end

    # CLASS METHODS
    # print welcome screen when user opens app
    def self.print_welcome_screen
        font = TTY::Font.new("3d")
        puts ""
        title = font.write("wordle").yellow
        puts title
    end

    # get the main menu selection from user
    def self.main_menu_selection
        prompt = TTY::Prompt.new
        puts ""
        menu_selection = prompt.select("MAIN MENU".bold, ["Play Game", "Help", "Quit"])
        return menu_selection
    end

    # template for printing output messages to user
    def self.print_msg(msg_string)
        puts ""
        puts "#{'>>'.red} #{msg_string}"
    end

    # INSTANCE METHODS
    # run the program
    def run
        print_matrix(@guesses, @word)
        guess_is_correct = false
        @guesses.each do |key, val|
            # get guess and make sure its a valid string
            guess_is_valid = false
            while guess_is_valid == false
                puts ""
                puts "Guess a word..."
                print ">> "
                guess = gets.strip.upcase
                # check if guess is valid
                if (guess.length == 5) && (guess.chars.all? { |i| i.match?(/[[:alpha:]]/) })
                    guess_is_valid = true
                else
                    Game.print_msg("Invalid guess. Needs to be a 5 letter word containing only letters.")
                end
            end
            # put the guess into @guesses instance variable (hash)
            @guesses[key] = guess
            # print matrix using guesses hash
            print_matrix(@guesses, @word)
            # check if the guess is correct
            if guess == @word
                guess_is_correct = true
                break
            end
        end
        puts ""
        if guess_is_correct
            puts "YOU WON!".green
        else
            puts "YOU LOST!".red
        end
    end

    # prints guess matrix to screen
    def print_matrix(guesses_hash, word)
        puts ""
        guesses_hash.each do |key, guess|
            guess_colorized = colorize_guess(guess, word)
            if guess == ""
                puts "*---*---*---*---*---*"
                puts "|   |   |   |   |   |"
            else
                puts "*---*---*---*---*---*"
                # save letters as individual variables
                l1 = guess_colorized[0]
                l2 = guess_colorized[1]
                l3 = guess_colorized[2]
                l4 = guess_colorized[3]
                l5 = guess_colorized[4]
                puts "| #{l1} | #{l2} | #{l3} | #{l4} | #{l5} |"
            end
        end
        puts "*---*---*---*---*---*"
    end

    # colors each letter red/green/yellow according to game rules
    def colorize_guess(guess, word)
        letter_arr = []
        word_split = word.split("")
        guess.split("").each_with_index do |letter, index|
            if !word_split.include?(letter)
                letter_arr << letter.colorize(:red)
            elsif ((word_split.include?(letter)) and (letter == word[index]))
                letter_arr << letter.colorize(:green)
            else
                letter_arr << letter.colorize(:yellow)
            end
        end
        return letter_arr
    end
end
