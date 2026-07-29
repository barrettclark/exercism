defmodule Phone do
  def number(formatted) do
    normalize(formatted)
  end

  def area_code(unformatted) do
    parse(unformatted) |> _area_code
  end

  def pretty(unformatted) do
    parse(unformatted) |> _pretty
  end

  defp normalize(formatted) do
    Regex.replace(%r/\D/, formatted, "") |> verify
  end

  defp verify(unformatted) do
    parse(unformatted) |> validated_phone_number
  end

  defp phone_pattern, do: %r/\b1?(\d{3})(\d{3})(\d{4})\b/
  defp parse(unformatted) do
    Regex.scan(phone_pattern, unformatted) |> Enum.first
  end

  defp validated_phone_number(nil), do: "0000000000"
  defp validated_phone_number([_, area, prefix, line]) do
    area <> prefix <> line
  end

  defp _area_code([_, area, _, _]), do: area
  defp _pretty([_, area, prefix, line]) do
    "(#{area}) #{prefix}-#{line}"
  end
end