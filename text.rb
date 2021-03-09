# frozen_string_literal: true

class Text
  INVALID_ENTRY = "\n Invalid choice, please try again."
  ANSWER_PATTERN = /^[12]$/.freeze
  GUESS_PATTERN = /^\d{4}$/.freeze
  PLAY_AGAIN_PATTERN = /^[yn]$/.freeze

  def self.intro_text
    puts "\nWelcome to Mastermind!"
    puts 'To play this game, simply... well, you know what to do.'
  end

  def self.game_type
    begin
      print "\nPress 1 to play as Codebreaker, or 2 to play as Codemaker: "
      choice = gets.chomp
      raise unless Logic.check_input(choice, ANSWER_PATTERN)
    rescue StandardError
      puts INVALID_ENTRY
      retry
    end
    choice
  end

  def self.codebreaker_intro
    puts "Hey there, here's the code you need to guess:"
  end

  def self.codebreaker_loop(round)
    puts "\n\nRound ##{round}:"

    begin
      print "\nGuess the code: "
      guess = gets.chomp
      # raise unless Logic.check_codebreaker_guess(guess)
      raise unless Logic.check_input(guess, GUESS_PATTERN)
    rescue StandardError
      puts INVALID_ENTRY
      retry
    end

    guess.split('')
  end

  def self.play_again?
    begin
      print "\nWould you like to play again? (y/n) "
      again = gets.chomp.downcase
      raise unless Logic.check_input(again, PLAY_AGAIN_PATTERN)
    rescue StandardError
      puts INVALID_ENTRY
      retry
    end
    again == 'y'
  end

  def self.ending(code, guess, counter)
    if Logic.won?(code, guess)
      plural = counter == 1 ? "turn" : "turns"
      puts "\n\nYou won in #{counter} #{plural}! Well done!"
    else
      puts "\n\nSo sorry, you lose. Better luck next time!"
    end
  end
end
