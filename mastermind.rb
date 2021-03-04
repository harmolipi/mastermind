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

6.times {|num| puts Display.code_colors(num.to_s)}

Game.new.play
