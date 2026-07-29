"use strict";
var isLeapYear = (function() {
  var theYear;
  function isLeapYear(year) {
    theYear = year;
    return isCentury() ? isLeapCentury() : divisibleByFour();
  }

  function divisibleByFour() { return theYear % 4 == 0; }
  function isCentury() { return theYear % 100 == 0; }
  function isLeapCentury() { return theYear % 400 == 0; }
  return isLeapYear;
})();

module.exports = isLeapYear;