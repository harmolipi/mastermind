# frozen_string_literal: true

# Basic code for initiating gameplay
class Game
  def initialize
    @mode = ''
  end

  def play
    Text.intro_text
    if Text.game_type == '1'
      Codebreaker.play
    else
      Codemaker.play
    end
  end
end
