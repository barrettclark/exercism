"use strict";
var Robot = (function() {
  function Robot() {
    this.name = "";
    this.reset = function() { this.name = _generateName(); };
    this.reset();

    function _generateName() {
      var name = "";
      for (var i = 0; i <= 5; i++) {
        if (i <= 1) {
          name += _randomString();
        } else {
          name += _randomNumber();
        }
      }
      return name;
    }

    function _randomString(){
      var rnd = Math.floor(Math.random() * 62);
      if (rnd < 10) {
        return rnd;                          // 0-9
      } else if (rnd < 36) {
        return String.fromCharCode(rnd+55);  // A-Z
      } else {
        return String.fromCharCode(rnd+61);  // a-z
      }
    }

    function _randomNumber() {
      return Math.floor(Math.random() * 10);
    }
  }
  return Robot;
})();

module.exports = Robot;