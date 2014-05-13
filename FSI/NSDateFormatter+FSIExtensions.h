//
//  NSDateFormatter+FSIExtensions.h
//  Jukeboard
//
//  Created by Tom Baranes on 6/16/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Usefull methods to use with NSDateFormatter
 */
@interface NSDateFormatter (FSIExtensions)

/** If the NSDateFormatter wasn't created yet, it will be created and stored to be reuse later
	If the NSDateFormatter has been already used, it will be reuse
 @returns a NSDateFormatter with a basic date style
 */
+ (NSDateFormatter *)reuseDateFormatter;

@end
