"use strict";
var Anagram = (function() {
  function Anagram(sourceWord) {
    var _sourceWord        = sourceWord.toLowerCase()
      , _sourceWordLetters = lettersInWord(sourceWord);

    this.match = function(words) {
      return words.filter(isAnagram);
    }

    function isAnagram(candidateWord) {
      return hasSameLetters(candidateWord) && !sameWord(candidateWord);
    }
    function hasSameLetters(candidateWord) {
      return lettersInWord(candidateWord) === _sourceWordLetters;
    }
    function sameWord(candidateWord) {
      return candidateWord.toLowerCase() === _sourceWord;
    }
    function lettersInWord(word) {
      return word.toLowerCase().split("").sort().join();
    }
  }
  return Anagram;
})();

module.exports = Anagram;