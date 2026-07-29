"use strict";
var Beer = (function() {
  function Beer(numberOfBottles) {
    var self = this;
    this.verse = function() {
      return self.bottleText() + ' of beer on the wall, '
             + self.bottleText().toLowerCase() + ' of beer.\n' + self.bottleAction();
    }
    this.bottleText = function() {
      var numberOfBottlesText = numberOfBottles + ' bottles';
      if (numberOfBottles === 1) {
        numberOfBottlesText = numberOfBottles + ' bottle';
      } else if (numberOfBottles === 0) {
        numberOfBottlesText = 'No more bottles';
      }
      return numberOfBottlesText;
    }
    this.bottleAction = function() {
      var nextBeer = self.nextBeer(), nextBottleAction = '';
      if (numberOfBottles > 1) {
        nextBottleAction = 'Take one down and pass it around';
      } else if (numberOfBottles === 1) {
        nextBottleAction = 'Take it down and pass it around';
      } else if(numberOfBottles === 0) {
        nextBottleAction = 'Go to the store and buy some more';
      }
      nextBottleAction += ', ' + nextBeer.bottleText().toLowerCase() + ' of beer on the wall.\n';
      return nextBottleAction;
    }
    this.nextBeer = function() {
      if (numberOfBottles === 0) {
        return new Beer(99);
      } else {
        return new Beer(numberOfBottles - 1);
      }
    }
  }

  Beer.verse = function(verseNumber) {
    var beer = new Beer(verseNumber);
    return beer.verse();
  }

  Beer.sing = function(startVerseNumber, endVerseNumber) {
    var song = [];
    if (typeof endVerseNumber === 'undefined') { endVerseNumber = 0; }
    for (var verseNumber = startVerseNumber; verseNumber >= endVerseNumber; verseNumber--) {
      song.push(Beer.verse(verseNumber));
    }
    return song.join("\n");
  }

  return Beer;
})();

module.exports = Beer;