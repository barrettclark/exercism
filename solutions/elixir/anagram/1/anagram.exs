defmodule Anagram do
  def match(word, list) do
    Enum.filter(list, fn(candidate_word) -> is_anagram(word, candidate_word) end)
  end

  def is_anagram(word, candidate_word) do
    has_same_letters(word, candidate_word) && !is_same_word(word, candidate_word)
  end

  def has_same_letters(word, candidate_word) do
    word_letters(word) == word_letters(candidate_word)
  end
  defp word_letters(word) do
    :lists.sort String.codepoints word |> String.downcase
  end

  def is_same_word(word, candidate_word) do
    String.downcase(word) == String.downcase(candidate_word)
  end
end