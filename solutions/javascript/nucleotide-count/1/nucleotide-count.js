(function() {
  "use strict";
  var DNA = (function() {
    function DNA(sequence) {
      var sequence = sequence
          , self = this
          , nucleotides = ['A', 'C', 'G', 'T', 'U']
          , dna = nucleotides.filter(dnaFilter)
          , rna = nucleotides.filter(rnaFilter)
          ;

      this.nucleotideCounts = _nucleotideCounts();

      this.count = function(nucleobase) {
        if (nucleotides.indexOf(nucleobase) < 0) {
          throw "Invalid Nucleotide";
        } else {
          return _count(nucleobase);
        }
      }

      function _count(nucleobase) {
        var re = new RegExp(nucleobase, 'g');
        if (re.test(sequence)) {
          return sequence.match(re).length;
        } else {
          return 0;
        }
      }
      function _nucleotideCounts() {
        return dna.reduce(function(collection, nucleobase) {
          collection[nucleobase] = _count(nucleobase);
          return collection;
        }, {});
      }

      function dnaFilter(nucleobase) {
        if (nucleobase !== 'U') { return nucleobase; }
      }
      function rnaFilter(nucleobase) {
        if (nucleobase !== 'T') { return nucleobase; }
      }
    }

    return DNA;
  })();

  module.exports = DNA;
}).call(this);