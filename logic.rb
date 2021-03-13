# frozen_string_literal: true

class Logic
  def self.reset
    @background = 1
    @already_guessed = []
  end

  def self.check_input(text, pattern)
    text.match?(pattern)
  end

  def self.generate_code
    code_array = []
    4.times do
      code_array << rand(1..6).to_s
    end
    code_array
  end

  def self.codebreaker_guess(code, guess)
    keys = []
    already_matched = []
    @clues = { 'correct_position' => 0, 'incorrect_position' => 0 }

    puts "\n"
    Display.display_code(guess)

    code.each_index do |index|
      if code[index] == guess[index]
        keys << index
        @clues['correct_position'] += 1
      end
    end

    diff = [0, 1, 2, 3].difference(keys)

    if diff.empty? && @clues['correct_position'] != 4
      guess.each do |guess_num|
        code.each_with_index do |code_num, index|
          if !already_matched.include?(index) && guess_num == code_num
            @clues['incorrect_position'] += 1
            already_matched << index
            break
          end
        end
      end

    elsif @clues['correct_position'] != 4
      diff.each do |guess_index|
        diff.each do |code_index|
          if !already_matched.include?(code_index) && code[code_index] == guess[guess_index]
            @clues['incorrect_position'] += 1
            already_matched << code_index
            break
          end
        end
      end
    end

    Display.display_key(@clues)
    return if Logic.won?(code, guess)
  end

  def self.codemaker_guess(code, previous_guess, previous_key)
    guess = previous_guess
    @already_guessed << previous_guess.slice(0..3)
    @keep = previous_key['correct_position'] + previous_key['incorrect_position'] unless previous_key.empty?

    if previous_guess.empty?
      guess = [@background.to_s, @background.to_s, @background.to_s, @background.to_s]
    elsif @keep == 4
      until !@already_guessed.include?(guess)
        guess.shuffle!
      end
    else
      (0...(4-@keep)).each do |i|
        guess[i] = @background.to_s
      end
    end

    @background += 1

    Logic.codebreaker_guess(code, guess)

    guess << @clues
    guess
  end

  def self.won?(code, guess)
    code.eql?(guess)
  end
end
