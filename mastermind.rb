# frozen_string_literal: true

require './game'
require './text'
require './logic'
require './codebreaker'
require './codemaker'
require './pins'
require './display'
require 'pry'

# Game.color

# 6.times { |num| puts Display.code_pegs(num.to_s) }

# puts Display.key_pegs('correct_position')
# puts Display.key_pegs('incorrect_position')

Game.new.play
