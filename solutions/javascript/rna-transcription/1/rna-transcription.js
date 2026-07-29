"use strict";
var DNA = (function() {
  function DNA(strand) {
    this.toRNA = function() {
      return strand.split('').map(transcribe).join('');
    }
  }
  function transcribe(nucleotide) {
    if (nucleotide === 'T') { return 'U'; } else { return nucleotide; }
  }

  return DNA;
})();

module.exports = DNA;