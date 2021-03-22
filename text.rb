# frozen_string_literal: true

# Text outputs and inputs
class Text
  INVALID_ENTRY = "\n Invalid choice, please try again."
  ANSWER_PATTERN = /^[12]$/.freeze
  GUESS_PATTERN = /^\d{4}$/.freeze
  PLAY_AGAIN_PATTERN = /^[yn]$/.freeze

  def self.intro_text
    puts "\nWelcome to Mastermind!"
    puts "\nAs Codebreaker, try to guess the secret code."
    puts "A solid circle (\u25CF) means a digit is in the right position."
    puts "A hollow circle (\u25CB) means a digit is correct, but in the wrong position."
    puts "\nAs Codemaker, you make the code, and the computer tries to crack it!"
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

  def self.codemaker_intro
    puts "\nIn this mode, the computer will try to guess your code."
    begin
      print "\nPlease enter your code (four digits 1-6): "
      code = gets.chomp
      raise unless Logic.check_input(code, GUESS_PATTERN)
    rescue StandardError
      puts INVALID_ENTRY
      retry
    end
    code.split('')
  end

  def self.codemaker_loop(round, guess, key)
    puts "\n\nRound ##{round}:"
    puts "\n Computer guess: "
    Display.display_code(guess)
    Display.display_key(key)
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

  def self.ending(code, guess, counter, codebreaker)
    if codebreaker
      if Logic.won?(code, guess)
        plural = counter == 1 ? "turn" : "turns"
        puts "\n\nYou won in #{counter} #{plural}! Well done!"
      else
        puts "\n\nSo sorry, you lose. Better luck next time!"
      end
    else
      if Logic.won?(code, guess)
        plural = counter == 1 ? "turn" : "turns"
        puts "\n\nThe computer won in #{counter} #{plural}!"
      else
        puts "\n\n The computer lost. Better luck next time, computer!"
      end
    end
  end
end
