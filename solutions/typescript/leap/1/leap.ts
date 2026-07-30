export function isLeap(year: number): boolean {
  return isCentury(year) ? isExceptionalCentury(year) : isVanillaLeap(year);
}

function isYearDivisibleBy(year: number, n: number): boolean {
  return year % n === 0;
}

function isCentury(year: number): boolean {
  return isYearDivisibleBy(year, 100);
}

function isVanillaLeap(year: number): boolean {
  return isYearDivisibleBy(year, 4);
}

function isExceptionalCentury(year: number): boolean {
  return isYearDivisibleBy(year, 400);
}
