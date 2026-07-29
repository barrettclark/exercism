//
//  Bob.swift
//  Bob
//
//  Created by Barrett Clark on 9/5/14.
//  Copyright (c) 2014 Barrett Clark. All rights reserved.
//

import Foundation

class Bob: NSObject {
  class func hey(input: String) -> String {
    let phrase = Conversation(phrase: input)
    if (phrase.isSilent()) {
      return "Fine, be that way."
    } else if (phrase.isShouting()) {
      return "Woah, chill out!"
    } else if (phrase.isAsking()) {
      return "Sure."
    }
    return "Whatever."
  }
}

class Conversation: NSObject {
  var phrase: NSString
  init(phrase: NSString) {
    self.phrase = phrase
    super.init()
  }

  func isShouting() -> Bool {
    let characterSet = NSCharacterSet.uppercaseLetterCharacterSet()
    let rangeOfCharacters = phrase.rangeOfCharacterFromSet(characterSet)
    
    return phrase == phrase.uppercaseString && rangeOfCharacters.location != NSNotFound
  }
  func isAsking() -> Bool {
    return phrase.hasSuffix("?")
  }
  func isSilent() -> Bool {
    let trimmedPhrase = phrase.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    return trimmedPhrase == ""
  }
}