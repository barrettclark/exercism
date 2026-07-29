"use strict";
exports.compute = function(strand1, strand2) {
  var strand1Nucleotides = strand1.split("")
    , strand2Nucleotides = strand2.split("")
    ;
  return strand1Nucleotides.reduce(function(distance, nucleotide, index) {
    var nucleotide2 = strand2Nucleotides[index];
    if (nucleotide2 && nucleotide2 !== nucleotide) { distance += 1; }
    return distance;
  }, 0);
}