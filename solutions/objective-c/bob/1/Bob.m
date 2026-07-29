//
//  Bob.m
//  Bob
//
//  Created by Barrett Clark on 7/1/14.
//  Copyright (c) 2014 Barrett Clark. All rights reserved.
//

#import "Bob.h"

@implementation Bob

- (NSString *) hey:(NSString *)input {
  if ([self isSilent:input]) {
    return @"Fine, be that way.";
  } else if ([self isShouting:input]) {
    return @"Woah, chill out!";
  } else if ([self isAsking:input]) {
    return @"Sure.";
  }
  return @"Whatever.";
}

- (bool) isShouting: (NSString *)input {
  return [[input uppercaseString] isEqualToString:input] &&
          ([input rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet] options:0].length > 0);
}

- (bool) isAsking: (NSString *)input {
  return [input hasSuffix:@"?"];
}

- (bool) isSilent: (NSString *)input {
  return [[input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""];
}

@end