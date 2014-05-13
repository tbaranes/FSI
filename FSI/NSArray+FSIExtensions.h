//
//  NSArray+FSIExtensions.h
//  Jukeboard
//
//  Created by Tom Baranes on 7/28/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A delightful NSArray category
 */
@interface NSArray (FSIExtensions)

/** Extract all numbers found in a NSString
 @param string the string to parse
 @returns array whith all numbers found
 */
+ (NSArray *)extractNumbersFromString:(NSString *)string;

@end
