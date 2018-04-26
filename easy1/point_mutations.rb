class DNA
  def initialize(strand)
    @strand1 = strand
  end

  def hamming_distance(strand2)
    distances = strand1.chars.map.with_index do |char, idx|
      char == strand2[idx] || strand2[idx].nil? ? 0 : 1
    end
    distances.reduce(0, :+)
  end

  private

  attr_reader :strand1
end
