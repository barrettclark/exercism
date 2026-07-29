"use strict";
var Anagram = (function() {
  function Anagram(word) {
    this.match = function(words) {
      return words.filter(isAnagram);
    }

    function isAnagram(candidateWord) {
      return hasSameLetters(candidateWord) && !isSameWord(candidateWord);
    }
    function hasSameLetters(candidateWord) {
      return reorderLetters(candidateWord) === reorderLetters(word);
    }
    function isSameWord(candidateWord) {
      return candidateWord.toLowerCase() === word.toLowerCase();
    }
    function reorderLetters(word) {
      return word.toLowerCase().split("").sort().join();
    }
  }
  return Anagram;
})();

module.exports = Anagram;