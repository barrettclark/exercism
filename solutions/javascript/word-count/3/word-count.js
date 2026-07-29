"use strict";
var Words = (function() {
  function Words(wordString) {
    var that = this;
    this.wordString = wordString;
    this.count = counts();

    function messageSplit() {
      return that.wordString.toLowerCase().match(/\b[a-z0-9]+\b/gi);
    }
    function counts() {
      var counts = messageSplit().
        reduce(function(collection, word) {
          collection[word] = (collection[word] || 0) + 1;
          return collection;
        }, {});
      return counts;
    }
  }
  return Words;
})();

module.exports = Words;