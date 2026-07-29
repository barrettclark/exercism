defmodule Words do
  def count(phrase), do: normalize_words(phrase) |> count_unique

  defp normalize_words(phrase), do: Regex.scan(%r/\w+/, String.downcase(phrase))

  defp count_unique(collection), do: count_unique(HashDict.new, collection)
  defp count_unique(hash, [head|tail]) do
    hash = HashDict.update(hash, head, 1, fn val -> val + 1 end)
    count_unique hash, tail
  end
  defp count_unique(hash, []), do: hash
end