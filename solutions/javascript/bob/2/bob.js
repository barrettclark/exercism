(function() {
  "use strict";
  var Bob = (function() {
    function Bob() {}

    Bob.prototype.hey = function(str) {
      var returnString = 'Whatever.';
      if (str === '') {
        returnString = 'Fine, be that way!';
      } else if (str === str.toUpperCase()) {
        returnString = 'Woah, chill out!';
      } else if (str.slice(-1) === '?') {
        returnString = 'Sure.';
      }
      return returnString;
    };

    return Bob;
  })();

  module.exports = Bob;
}).call(this);