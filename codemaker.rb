# frozen_string_literal: true

# Methods for when the computer is guessing the code
class Codemaker
  def self.play
    @rounds = 12
    @previous_guess = []
    @previous_key = {}
    Logic.reset
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
    sleep(1)
    puts "\n\nRound #{round_number}:\n"
    @results = Logic.codemaker_guess(@code, @previous_guess, @previous_key)
    @guess = @results.slice(0..3)
    @previous_key = @results.slice(4)
    @previous_guess = @guess
    Logic.won?(@code, @guess)
  end

  def self.ending
    if Logic.won?(@code, @guess)
      puts "\n\nThe computer won!"
    else
      puts "\n\nThe computer lost!"
    end
  end
end
