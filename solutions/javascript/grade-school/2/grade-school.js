"use strict";
var School = (function() {
  function School(schoolName) {
    var classRoster = {}
      , that = this;
    this.db = _db();

    this.add = function(studentName, gradeLevel) {
      if (_gradeLevelUndefined(gradeLevel)) {
        classRoster[gradeLevel] = [];
      }
      classRoster[gradeLevel].push(studentName);
    }

    this.grade = function(gradeLevel) {
      if (_gradeLevelUndefined(gradeLevel)) {
        return [];
      } else {
        return classRoster[gradeLevel];
      }
    }

    this.sort = function() {
      var sortedGrades = [];
      for (var grade in classRoster) { sortedGrades.push(grade); }
      return sortedGrades.sort().reduce(_sortRoster, {});
    }

    function _db() {
      return classRoster;
    }

    function _gradeLevelUndefined(gradeLevel) {
      return (typeof classRoster[gradeLevel] === 'undefined');
    }

    function _sortRoster(sortedRoster, gradeLevel) {
       sortedRoster[gradeLevel] = that.grade(gradeLevel).sort();
       return sortedRoster;
    }
  }

  return School;
})();

module.exports = School;