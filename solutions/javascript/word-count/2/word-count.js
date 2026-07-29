"use strict";
var Words = (function() {
  function Words(wordString) {
    this.wordString = wordString.toLowerCase();
    this.count = this.counts();
  }
  Words.prototype.counts = function() {
    var counts = this.wordString.match(/\b[a-z0-9]+\b/gi).
      reduce(function(collection, word) {
        collection[word] = (collection[word] || 0) + 1;
        return collection;
      }, {});
    return counts;
  }
  return Words;
})();

module.exports = Words;