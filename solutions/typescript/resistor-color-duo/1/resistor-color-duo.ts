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

function colorCode(color: string): string {
  return COLORS.indexOf(color).toString();
}

export function decodedValue(colors: string[]): number {
  const duo = colors.slice(0, 2);
  const decodedStr = duo.reduce((acc, curr) => {
    return acc + colorCode(curr);
  }, "");
  return Number(decodedStr);
}
