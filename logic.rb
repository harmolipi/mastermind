# frozen_string_literal: true

class Logic
  def self.check_input(text, pattern)
    text.match?(pattern)
  end

  def self.generate_code
    # move this to logic class
    code_array = []
    4.times do
      code_array << rand(1..6).to_s
    end
    # code_array.each { |num| print Display.code_pegs(num) }
    code_array
  end

  def self.codebreaker_guess(code, guess)
    keys = []
    already_matched = []
    clues = { 'correct_position' => 0, 'incorrect_position' => 0 }
    # binding.pry

    puts "\n"
    Display.display_code(guess)

    # return if Logic.won?(code, guess)

    code.each_index do |index|
      if code[index] == guess[index]
        keys << index
        clues['correct_position'] += 1
      end
    end

    # return if clues['correct_position'] == 4

    diff = [0, 1, 2, 3].difference(keys)

    # make another array of indices we don't want to check and maybe with each iteration check that it's not one of those indices
    if diff.empty? && clues['correct_position'] != 4
      guess.each do |guess_num|
        code.each_with_index do |code_num, index|
          if !already_matched.include?(index) && guess_num == code_num
            clues['incorrect_position'] += 1
            already_matched << index
            break
          end
        end
      end

    elsif clues['correct_position'] != 4
      diff.each do |guess_index|
        diff.each do |code_index|
          if !already_matched.include?(code_index) && code[code_index] == guess[guess_index]
            clues['incorrect_position'] += 1
            already_matched << code_index
            break
          end
        end
      end
    end

    # Guess: 2 1 2 3
    # Code:  2 2 3 2
    # KEYS: [0]
    # Diff: [1, 2, 3]
    # result: correct position: 1; incorrect_position: 2
    # Unless diff empty, diff.each { |i| code[diff] ... }

    # puts "\n"
    # Display.display_code(guess)
    Display.display_key(clues)
    return if Logic.won?(code, guess)
  end

  def self.won?(code, guess)
    code.eql?(guess)
  end
end
