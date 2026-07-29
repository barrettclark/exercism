defmodule Teenager do
  def hey(message) do
    cond do
      nothing?(message) -> "Fine. Be that way!"
      yelling?(message) -> "Woah, chill out!"
      asking?(message)  -> "Sure."
      true                -> "Whatever."
    end
  end

  defp yelling?(message), do: String.upcase(message) == message
  defp asking?(message),  do: String.ends_with?(message, "?")
  defp nothing?(message), do: String.strip(message) == ""
end