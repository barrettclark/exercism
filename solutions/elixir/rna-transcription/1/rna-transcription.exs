defmodule DNA do
  # If we get Thymidine, replace it with Uracil
  def to_rna(nucleotide), do: Regex.replace(%r/T/, nucleotide, "U")
end