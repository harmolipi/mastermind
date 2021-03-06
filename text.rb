# frozen_string_literal: true

class Text
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
      puts "\nInvalid choice, please try again."
      retry
    end
    choice
  end

  def self.codebreaker_intro
    puts "Hey there, here's the code you need to guess:"
  end
end
