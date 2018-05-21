class InvalidCodonError < StandardError; end

class Translation
  PROTEINS_AND_CODONS = { Methionine: %w[AUG], Phenylalanine: %w[UUU UUC],
                          Leucine: %w[UUA UUG], Serine: %w[UCU UCC UCA UCG],
                          Tyrosine: %w[UAU UAC], Cysteine: %w[UGU UGC],
                          Tryptophan: %w[UGG], STOP: %w[UAA UAG UGA] }.freeze

  def self.of_codon(codon)
    PROTEINS_AND_CODONS.each do |protein, codons|
      return protein.to_s if codons.include?(codon)
    end

    raise InvalidCodonError, 'Invalid codon!'
  end

  def self.of_rna(strand)
    strand.scan(/.{3}/).each_with_object([]) do |codon, protein_strand|
      return protein_strand if stop?(codon)
      protein_strand << of_codon(codon)
    end
  end

  def self.stop?(codon)
    PROTEINS_AND_CODONS[:STOP].include?(codon)
  end
end
