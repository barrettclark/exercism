"use strict";
var Anagram = (function() {
  function Anagram(word) {
    var self = this;
    this.word = word;
    this.match = function(words) {
      var matches = words.reduce(function(collection, candidateWord) {
        if (isAnagram(candidateWord)) { collection.push(candidateWord); }
        return collection;
      }, []);
      return matches;
    }
    function isAnagram(candidateWord) {
      return isSameLetters(candidateWord) && !isSameWord(candidateWord);
    }
    function isSameLetters(candidateWord) {
      return reorderLetters(candidateWord) === reorderLetters(self.word);
    }
    function isSameWord(candidateWord) {
      return candidateWord.toLowerCase() === self.word.toLowerCase();
    }
    function reorderLetters(word) {
      return word.toLowerCase().split("").sort().join();
    }
  }
  return Anagram;
})();

module.exports = Anagram;