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

const UNITS = ["", "kilo", "mega", "giga"];

function colorCode(color: string): number {
  return COLORS.indexOf(color);
}

export function decodedResistorValue([
  tens,
  ones,
  magnitude,
]: string[]): string {
  let value =
    (colorCode(tens) * 10 + colorCode(ones)) *
    Math.pow(10, colorCode(magnitude));
  let unitIndex = 0;
  while (value >= 1000 && unitIndex < UNITS.length - 1) {
    value /= 1000;
    unitIndex++;
  }
  return value + " " + UNITS[unitIndex] + "ohms";
}
