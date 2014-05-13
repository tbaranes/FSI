//
//  NSDateFormatter+FSIExtensions.m
//  Jukeboard
//
//  Created by Tom Baranes on 6/16/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import "NSDateFormatter+FSIExtensions.h"

@implementation NSDateFormatter (FSIExtensions)

+ (NSDateFormatter *)reuseDateFormatter
{
	static NSString *kDateFormatter = @"kDateFormatter";
	
	NSMutableDictionary *threadDict = [[NSThread currentThread] threadDictionary];
	NSDateFormatter *dateFormatter = [threadDict objectForKey:kDateFormatter];
	[dateFormatter setDateStyle:NSDateFormatterShortStyle];
	if (!dateFormatter) {
		dateFormatter = [[NSDateFormatter alloc] init];
		[threadDict setObject:dateFormatter forKey:kDateFormatter];
	}
	return dateFormatter;
}

@end
