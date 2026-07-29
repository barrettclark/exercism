defmodule DNA do
  def hamming_distance(strand, descendant_strand) do
    zip(strand, descendant_strand) |> Enum.count(fn({x1, x2}) -> x2 && x1 != x2 end)
  end

  defp zip(strand, descendant_strand) do
    Enum.zip(strand, descendant_strand)
  end
end