# frozen_string_literal: true

class Codemaker
  def self.play
    @rounds = 12
    @previous_guess = []
    @previous_key = {}
    @code = Text.codemaker_intro
    counter = 1
    Display.display_code(@code)
    puts "\n"
    @rounds.times do |i|
      counter = i + 1
      break if game_loop(i + 1)
    end
    Codemaker.ending

  end

  def self.game_loop(round_number)
    puts "\n\nRound #{round_number}:\n"
    @results = Logic.codemaker_guess(@code, @previous_guess, @previous_key)
    @guess = @results.slice(0..3)
    # p @guess
    @previous_key = @results.slice(4)
    # p @previous_key
    @previous_guess = @guess
    Logic.won?(@code, @guess)
    # puts "\n"
  end

  def self.ending
    if Logic.won?(@code, @guess)
      puts "\n\nThe computer won!"
    else
      puts "\n\nThe computer lost!"
    end
  end
end
