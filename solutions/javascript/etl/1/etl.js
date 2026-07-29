"use strict";
module.exports = function(input) {
  function transform(scoreValues) {
    var output = {};
    for (var pointValue in scoreValues) {
      var letters = scoreValues[pointValue];
      letters.forEach(function(letter) {
        output[letter.toLowerCase()] = parseInt(pointValue);
      });
    }
    return output;
  }
  return transform(input);
}