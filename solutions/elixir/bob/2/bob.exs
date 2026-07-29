defmodule Teenager do
  def hey(str) do
    cond do
      is_nothing?(str) -> "Fine. Be that way!"
      is_yelling?(str) -> "Woah, chill out!"
      is_asking?(str)  -> "Sure."
      true             -> "Whatever."
    end
  end

  defp is_yelling?(str), do: String.upcase(str) == str
  defp is_asking?(str),  do: String.last(str) == "?"
  defp is_nothing?(str) when str == nil, do: true
  defp is_nothing?(str), do: String.strip(str) == ""
end