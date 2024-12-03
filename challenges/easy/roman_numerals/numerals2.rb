# This solution is much simpler than my first one!

class RomanNumeral
  NUMERALS = {
    'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_num = ''
    test_num = number

    until test_num == 0
      NUMERALS.each do |numeral, value|
        if test_num >= value
          roman_num << numeral
          test_num -= value
          break
        end
      end
    end
    roman_num
  end
  
  private
  
  attr_reader :number
end

p RomanNumeral.new(3474).to_roman
