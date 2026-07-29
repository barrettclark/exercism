"use strict";
var Words = (function() {
  function Words(wordString) {
    var _wordString = wordString.toLowerCase();
    var counts = _wordString.match(/\b[a-z0-9]+\b/gi).
      reduce(function(collection, word) {
        collection[word] = (collection[word] || 0) + 1;
        return collection;
      }, {});
    this.count = counts;
  }
  return Words;
})();

module.exports = Words;