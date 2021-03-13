# frozen_string_literal: true

class Codebreaker
  @@rounds = 12
  @@guess = []

  def self.play
    # Text.codebreaker_intro
    @codebreaker = true
    @@code = Logic.generate_code
    counter = 1
    # Display.display_code(@@code)
    @@rounds.times do |i|
      counter = i + 1
      break if game_loop(i + 1)
    end
    # Codebreaker.ending
    Text.ending(@@code, @@guess, counter, @codebreaker)
  end

  def self.game_loop(round_number)
    @@guess = Text.codebreaker_loop(round_number)
    Logic.codebreaker_guess(@@code, @@guess)
    Logic.won?(@@code, @@guess)
  end

  def self.ending
    if Logic.won?(@@code, @@guess)
      puts "\n\nYou won! Well done!"
    else
      puts "\n\nSo sorry, you lose. Better luck next time!"
    end
  end
end
