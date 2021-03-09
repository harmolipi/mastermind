# frozen_string_literal: true

class Text
  INVALID_ENTRY = "\n Invalid choice, please try again."

  def self.intro_text
    puts 'Welcome to Mastermind!'
    puts 'To play this game, simply... well, you know what to do.'
  end

  def self.game_type
    begin
      print "\nPress 1 to play as Codebreaker, or 2 to play as Codemaker: "
      choice = gets.chomp
      raise unless Logic.check_game_type(choice)
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
      raise unless Logic.check_codebreaker_guess(guess)
    rescue StandardError
      puts INVALID_ENTRY
      retry
    end

    guess.split('')
  end
end
