# Input: names that have to be unscrambled from rot13 encryption
# Output: unscrambled names

# Rules:
  # The encryption uses ROT13, which replaces a letter with the 13th letter after it in the latin alphabet.
  # a-z
  # The same rule is used to decode it: take the 13th letter after this letter.
  # Keep the casing the same: If it's upcase, keep it upcase. If it's downcase, keep it downcase.

# Examples:
  # aha => nun
  # balk => onyx
  # barf => ones
  # Nqn Ybirynpr
  # Tenpr Ubccre
  # Nqryr Tbyqfgvar

# Data Structures:
  # Create an array of all the letters + 13.
  # have to account for upcase and downcase
  # Then iterate through it 13 times after each letter and add to a return string.
  # always add a space if it's space.
  # How do I know to take the 13th next one? Index

# Algorithm:
  # Create a constant decoder that has all the letters of the alphb + the first 13 afterwards.
  # Create an upcase version

  # in the method, iterate through each character in the string.
  # if the character is uppercase, find the index for this character in the uppercase constant
    # add 13 to the index, add this character to the new string
  # same for downcase
  # else, simply add the character -- means empty space
  # return the string

LOWER_DECODERS = ('a'..'z').to_a + ('a'..'m').to_a
UPPER_DECODERS = LOWER_DECODERS.map(&:upcase)
ALL_DECODERS = LOWER_DECODERS + UPPER_DECODERS


def decode_rot13(encrypted_name)
  name = ''

  encrypted_name.each_char do |char|
    if char.match?(/[a-zA-Z]/)
      index = ALL_DECODERS.index(char) + 13
      name << ALL_DECODERS[index]

    else
      name << char
    end
  end
  name
end

p decode_rot13('aha')
p decode_rot13('envy')
p decode_rot13('Nqn Ybirynpr')
p decode_rot13('Tenpr Ubccre')
p decode_rot13('Nqryr Tbyqfgvar')
p decode_rot13('Nyna Ghevat')
p decode_rot13('Puneyrf Onoontr')
p decode_rot13('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p decode_rot13('Wbua Ngnanfbss')
p decode_rot13('Ybvf Unvog')
p decode_rot13('Pynhqr Funaaba')
p decode_rot13('Fgrir Wbof')
p decode_rot13('Ovyy Tngrf')
p decode_rot13('Gvz Orearef-Yrr')
p decode_rot13('Fgrir Jbmavnx')
p decode_rot13('Xbaenq Mhfr')
p decode_rot13('Fve Nagbal Ubner')
p decode_rot13('Zneiva Zvafxl')
p decode_rot13('Lhxvuveb Zngfhzbgb')
p decode_rot13('Unllvz Fybavzfxv')
p decode_rot13('Tregehqr Oynapu')