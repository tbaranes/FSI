//
//  NSNumberFormatter+FSIExtensions.m
//  Jukeboard
//
//  Created by Tom Baranes on 6/14/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import "NSNumberFormatter+FSIExtensions.h"

/** Usefull methods to use with NSNumberFormatter
 */
@implementation NSNumberFormatter (FSIExtensions)

/** If the NSNumberFormatter wasn't created yet, it will be created and stored to be reuse later
 If the NSNumberFormatter has been already used, it will be reuse
 @returns a NSDateFormatter with a basic date style
 */
+ (NSNumberFormatter *)reuseNumberFormatter
{
	static NSString *kNumberFormatter = @"kNumberFormatter";
	
	NSMutableDictionary *threadDict = [[NSThread currentThread] threadDictionary];
	NSNumberFormatter *numberFormatter = [threadDict objectForKey:kNumberFormatter];
	if (!numberFormatter) {
		numberFormatter = [[NSNumberFormatter alloc] init];
		[threadDict setObject:numberFormatter forKey:kNumberFormatter];
	}
	return numberFormatter;
}

@end
