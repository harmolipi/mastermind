# frozen_string_literal: true

class Codebreaker
  def self.play
    Text.codebreaker_intro
    Codebreaker.generate_code
  end

  def self.generate_code
    code_array = []
    4.times do
      code_array << rand(1..6).to_s
    end
    code_array.each { |num| print Display.code_pegs(num) }
  end
end
