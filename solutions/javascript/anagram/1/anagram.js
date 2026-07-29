"use strict";
var Anagram = (function() {
  function Anagram(word) {
    var self = this;
    this.word = word;
    this.match = function(words) {
      var matches = words.reduce(function(collection, candidateWord) {
        if (testMatch(candidateWord)) { collection.push(candidateWord); }
        return collection;
      }, []);
      return matches;
    }
    function testMatch(candidateWord) {
      return reorderLetters(candidateWord) === reorderLetters(self.word);
    }
    function reorderLetters(word) {
      return word.split("").sort().join();
    }
  }
  return Anagram;
})();

module.exports = Anagram;