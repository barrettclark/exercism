"use strict";
var Phone = (function() {
  function Phone(rawPhoneNumber) {

    this.number = function() {
      var unformattedPhoneNumber = rawPhoneNumber.replace(/\W/g, '')
        , matches = unformattedPhoneNumber.match(/\b1?(\d{10})\b/);
      if (matches) {
        return matches[1];
      } else {
        return '0000000000';
      }
    }

    this.areaCode = function() {
      return this.number().substr(0, 3);
    }

    this.toString = function() {
      return this.number().replace(/(\d{3})(\d{3})(\d{4})/g, "($1) $2-$3");
    }

  }
  return Phone;
})();

module.exports = Phone;