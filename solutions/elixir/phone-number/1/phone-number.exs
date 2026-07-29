defmodule Phone do
  def number(formatted_phone_number) do
    normalize_phone_number(formatted_phone_number)
  end

  def area_code(unformatted_phone_number) do
    parse_phone_number(unformatted_phone_number) |> area
  end

  def pretty(unformatted_phone_number) do
    parse_phone_number(unformatted_phone_number) |> reformat_phone_number
  end

  defp normalize_phone_number(formatted_phone_number) do
    Regex.replace(%r/\D/, formatted_phone_number, "") |> verify_formatting
  end

  defp verify_formatting(unformatted_phone_number) do
    parse_phone_number(unformatted_phone_number) |> validated_phone_number
  end

  defp parse_phone_number(unformatted_phone_number) do
    Regex.named_captures(%r/\b1?(?<area_code>\d{3})(?<prefix>\d{3})(?<line_number>\d{4})\b/g, unformatted_phone_number)
  end

  defp validated_phone_number(nil), do: "0000000000"
  defp validated_phone_number(captures) do
    area(captures) <> prefix(captures) <> line(captures)
  end

  defp area(captures), do: Keyword.get(captures, :area_code)
  defp prefix(captures), do: Keyword.get(captures, :prefix)
  defp line(captures), do: Keyword.get(captures, :line_number)

  defp reformat_phone_number(captures) do
    "(" <> area(captures) <> ") " <> prefix(captures) <> "-" <> line(captures)
  end
end