defmodule Words do
  def count(phrase), do: normalize_words(phrase) |> count_words

  defp normalize_words(phrase), do: Regex.scan(%r/\w+/, String.downcase(phrase))

  defp count_words(words) do
    Enum.reduce words, HashDict.new, fn word, acc -> HashDict.update(acc, word, 1, fn val -> val + 1 end) end
  end
end