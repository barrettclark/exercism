"use strict";
var DNA = (function() {
  function DNA(strand) {
    this.hammingDistance = function(descendantStrand) {
      var difference = 0
      if (strand.length > descendantStrand.length) {
        strand = strand.substring(0, descendantStrand.length);
      }
      strand.split('').forEach(function(nucleotide, idx) {
        if (nucleotide !== descendantStrand.charAt(idx)) {
          difference += 1;
        }
      });
      return difference;
    }
  }

  return DNA;
})();

module.exports = DNA;