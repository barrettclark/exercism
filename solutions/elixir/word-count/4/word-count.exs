defmodule Words do
  def count(phrase), do: normalize_words(phrase) |> count_words

  # returns a list of the lowercased words (without punctuation)
  defp normalize_words(phrase) do
    Regex.scan(%r/\w+/, String.downcase(phrase)) |> List.concat
  end

  # count the occurrences of words in the phrase
  defp count_words(words), do: Enum.reduce(words, HashDict.new, count(&1, &2))

  # helper function to increment a counter
  defp increment(current_value), do: current_value + 1

  # helper function to update the HashDict of counts
  defp count(word, acc), do: HashDict.update(acc, word, 1, increment(&1))
end