# TODO
# 
# sort duplicate letters from yellow to red


# gems
require 'colorize'

# get a secret word
word = "trump".upcase

# keep track of guesses
guesses = {
    guess_1: "",
    guess_2: "",
    guess_3: "",
    guess_4: "",
    guess_5: "",
}


def print_matrix(guesses_hash, word)
    # def colorize_letter(letter, input)
    #     # if letter is not in word, return red
    #     word_split = input.split("")
    #     if !word_split.include?(letter)
    #         return letter.colorize(:red)
    #     else
    #         return letter.colorize(:green)
    #     end
    # end

    def colorize_guess(guess, word)
        arr = []
        word_split = word.split("")
        guess.split("").each_with_index do |letter, index|
            if !word_split.include?(letter)
                arr << letter.colorize(:red)
            elsif ((word_split.include?(letter)) and (letter == word[index]))
                arr << letter.colorize(:green)
            else
                arr << letter.colorize(:yellow)
            end
        end
        return arr
    end

    guesses_hash.each do |key, guess|
        guess_colorized = colorize_guess(guess, word)
        if guess == ""
            puts "*---*---*---*---*---*"
            puts "|   |   |   |   |   |"
        else
            puts "*---*---*---*---*---*"
            puts "| #{guess_colorized[0]} | #{guess_colorized[1]} | #{guess_colorized[2]} | #{guess_colorized[3]} | #{guess_colorized[4]} |"
        end
    end
    puts "*---*---*---*---*---*"
end


guess_is_correct = false

# run game
guesses.each do |key, val|
    # initialise variables
    guess_is_valid = false

    # get guess
    while guess_is_valid == false
        puts "What's your guess?"
        print ">> "
        guess = gets.strip.upcase
        # check if guess is valid
        if guess.length == 5
            guess_is_valid = true
        else
            puts "Invalid guess. Needs to be a 5 letter word"
        end
    end

    guesses[key] = guess
    print_matrix(guesses, word)

    # check if guess is correct
    if guess == word
        guess_is_correct = true
        break
    end
end

if guess_is_correct
    puts "YOU WON!"
else
    puts "YOU LOST!"
end