//
//  Hamming.m
//  Hamming
//
//  Created by Barrett Clark on 9/5/14.
//  Copyright (c) 2014 Barrett Clark. All rights reserved.
//

#import "Hamming.h"

@implementation Hamming

+ (int) compute:(NSString *)strand1 against:(NSString *)strand2 {
  int difference = 0;
  for (int i=0; i < [strand1 length]; i++) {
    NSString *nucleotide1 = [strand1 substringWithRange:NSMakeRange(i, 1)];
    if (i < [strand2 length]) {
      NSString *nucleotide2 = [strand2 substringWithRange:NSMakeRange(i, 1)];
      if (![nucleotide1 isEqualToString:nucleotide2]) { difference += 1; }
    }
  }
  return difference;
}

@end