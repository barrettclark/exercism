defmodule Teenager do
  def hey(message) do
    cond do
      is_nothing(message) -> "Fine. Be that way!"
      is_yelling(message) -> "Woah, chill out!"
      is_asking(message)  -> "Sure."
      true                -> "Whatever."
    end
  end

  defp is_yelling(message), do: String.upcase(message) == message
  defp is_asking(message),  do: String.ends_with?(message, "?")
  defp is_nothing(message), do: String.strip(message) == ""
end