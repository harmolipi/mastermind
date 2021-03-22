# frozen_string_literal: true

require './game'
require './text'
require './logic'
require './codebreaker'
require './codemaker'
require './pins'
require './display'

replay = true

while replay
  Game.new.play
  replay = Text.play_again?
end
