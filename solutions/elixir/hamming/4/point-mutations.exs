defmodule DNA do
  def hamming_distance(strand, descendant_strand) do
    List.zip([strand, descendant_strand]) |> Enum.count(&equal_pairs?/1)
  end

  defp equal_pairs?({x1, x2}), do: x1 != x2
end