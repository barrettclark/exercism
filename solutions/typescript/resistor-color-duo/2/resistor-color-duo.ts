const COLORS = [
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "green",
  "blue",
  "violet",
  "grey",
  "white",
];

function colorCode(color: string): number {
  return COLORS.indexOf(color);
}

export function decodedValue([tens, ones]: string[]): number {
  return colorCode(tens) * 10 + colorCode(ones);
}
