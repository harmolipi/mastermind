class Display
  def self.code_pegs(num)
    {
      '1' => "\e[41m  1  \e[0m ",
      '2' => "\e[42m  2  \e[0m ",
      '3' => "\e[43m  3  \e[0m ",
      '4' => "\e[44m  4  \e[0m ",
      '5' => "\e[45m  5  \e[0m ",
      '6' => "\e[46m  6  \e[0m "
    }[num]
  end

  def self.key_pegs(key)
    {
      'correct_position' => "\u25CF",
      'incorrect_position' => "\u25CB"
    }[key]
  end
end
