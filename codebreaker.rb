# frozen_string_literal: true

class Codebreaker
  @@rounds = 12
  @@guess = []

  def self.play
    # Text.codebreaker_intro
    @@code = Logic.generate_code
    Display.display_code(@@code)
    @@rounds.times do |i|
      break if game_loop(i + 1)
    end
    Codebreaker.ending
  end

  def self.game_loop(round_number)
    @@guess = Text.codebreaker_loop(round_number)
    Logic.codebreaker_guess(@@code, @@guess)
    return Logic.won?(@@code, @@guess)
  end

  def self.ending
    if Logic.won?(@@code, @@guess)
      puts "\n\nYou won! Well done!"
    else
      puts "\n\nSo sorry, you lose. Better luck next time!"
    end
  end
end
