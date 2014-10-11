//
//  NSString+Levenshtein.h
//  FSI
//
//  Created by Tom Baranes on 11/10/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Levenshtein)

// calculate the smallest distance between all words in stringA and stringB
- (CGFloat)compareWithString:(NSString *)stringB matchGain:(NSInteger)gain missingCost:(NSInteger)cost;

// calculate the distance between two string treating them each as a single word
- (NSInteger)compareWithWord:(NSString *)stringB matchGain:(NSInteger)gain missingCost:(NSInteger)cost;

@end
