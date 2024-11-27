class Series
  attr_reader :string_number

  def initialize(number)
    @string_number = number
  end

  def slices(max_length)
    raise ArgumentError if max_length > string_number.size

    (0..string_number.size - max_length).map do |index|
      string_number.chars[index, max_length].map(&:to_i)
    end
  end
end