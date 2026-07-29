//
//  Leap.swift
//  Leap
//
//  Created by Barrett Clark on 7/2/14.
//  Copyright (c) 2014 Barrett Clark. All rights reserved.
//

import Foundation

class Year {
  var calendarYear: Int = 0

  init(calendarYear: Int) {
    self.calendarYear = calendarYear
  }
  
  var isLeapYear: Bool {
    get {
      return isCentury() ? isExceptionalCentury() : isVanillaLeapYear()
    }
  }
  
  func isVanillaLeapYear() -> Bool { return self.calendarYear % 4 == 0 }
  func isCentury() -> Bool { return self.calendarYear % 100 == 0 }
  func isExceptionalCentury() -> Bool { return self.calendarYear % 400 == 0 }
}