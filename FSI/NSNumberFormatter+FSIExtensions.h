//
//  NSNumberFormatter+FSIExtensions.h
//  Jukeboard
//
//  Created by Tom Baranes on 6/14/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A delightful NSNumberFormatter category
 */
@interface NSNumberFormatter (FSIExtensions)

/** If the NSNumberFormatter wasn't created yet, it will be created and stored to be reuse later
 If the NSNumberFormatter has been already used, it will be reuse
 @returns a NSNumberFormatter with a basic date style
 */
+ (NSNumberFormatter *)reuseNumberFormatter;

@end
