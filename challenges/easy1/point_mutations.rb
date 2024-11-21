# Write a program that can calculate the Hamming Distance between two DNA strands

# Mutation:
  # mistake that occurs during the creation or copying of a nucleic acid, like DNA
  # ripple effect throughout cell
  # technically mistakes, but can sometimes be good (good attribute)
  #

# Point Mutation: simplest and most common type of mutation
# replaces one base with another at a single nucleotide.

# by counting the number of differences between two homologous DNA strands,
# we get the distance based on the number of point mutations that have occurred throughout their histories.

# Hamming Distance.

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^

# Here the distance is 7
# Hamming Distance is only computed for strands of the same length
# If the lengths are different, then you take the shorter strand and use that one.

# Problem:
  # create DNA class that has a strand of nuecleotides in an array or string
  # we can calculate the hamming distance between our strand and another strand by using an incrementing index
  # to count how many differences there are.
  # then we return a count.

# Rules:
  # Hamming Distance is the number of differences in the nucleotides collection at teh same point
  # every piece of DNA should have a strand of nucleotides.
  # Remember: the nucleotides are different at the same point.
  # Always base the iterating on the shorter strand if they are shorter.

# Examples on the tests page
  # GAGCCTACTAACGGGAT
  # CATCGTAATGACGGCCT
  # ^ ^ ^  ^ ^    ^^

  # Data Structures:
    # use an index to iterate through the shorter side.
    # if the element at the index of the ohter strand is different (different string), then add 1 to
      # differences count
    #

  # Algorithm:
    # DNA class
    # initialize Method
      # takes a string of nucleotides, or a strand as an instance variable
    # end

    # calculate_hamming_distance - other DNA strand as argument (string)
      # put both into array, take min and iterate through this.
         # sort by length
         # min and max

      # create differences variable set to 0
      # iterate with the index through each of the strings
        # if the element at the same index in each string is different, add 1 to differences
      # return differences at the end

      # getter method should be protected
    #

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    strands = [strand, other_strand].sort_by(&:size)
    short, long = strands[0], strands[-1]

    distance = 0

    (0...short.size).each do |index|
      distance += 1 if short[index] != long[index]
    end

    distance
  end

  protected

  attr_reader :strand
end

