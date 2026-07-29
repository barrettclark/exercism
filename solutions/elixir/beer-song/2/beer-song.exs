defmodule Beer do
  def verse(verse_number), do: first_line(verse_number) <> second_line(verse_number)

  def sing(start_verse_number, finish_verse_number // 0) do
    Enum.map_join(start_verse_number..finish_verse_number, "\n", verse &1) <> "\n"
  end

  defp first_line(verse_number) do
    txt = bottle_text(verse_number)
    "#{txt} of beer on the wall, #{String.downcase(txt)} of beer.\n"
  end

  defp second_line(0) do
    "Go to the store and buy some more, #{next_verse_number(0)} bottles of beer on the wall.\n"
  end
  defp second_line(verse_number) do
    text = next_verse_number(verse_number) |> bottle_text |> String.downcase
    "Take #{take_text(verse_number)} down and pass it around, #{text} of beer on the wall.\n"
  end

  defp next_verse_number(0), do: 99
  defp next_verse_number(verse_number), do: verse_number - 1

  defp bottle_text(0), do: "No more bottles"
  defp bottle_text(1), do: "1 bottle"
  defp bottle_text(bottle_count), do: "#{bottle_count} bottles"

  defp take_text(1), do: "it"
  defp take_text(_), do: "one"
end