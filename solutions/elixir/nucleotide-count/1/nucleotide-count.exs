defmodule DNA do
  # custom attribute to define the nucleotides
  @nucleotides [?A, ?C, ?G, ?T]

  def count('', _), do: 0
  def count(strand, nucleotide), do: Enum.count(strand, &1 == nucleotide)

  def nucleotide_counts(strand) do
    HashDict.new @nucleotides, &{&1, count(strand, &1)}
  end
end