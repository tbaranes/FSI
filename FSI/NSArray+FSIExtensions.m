//
//  NSArray+FSIExtensions.m
//  Jukeboard
//
//  Created by Tom Baranes on 7/28/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import "NSArray+FSIExtensions.h"

@implementation NSArray (FSIExtensions)

+ (NSArray *)extractNumbersFromString:(NSString *)string {
	
	NSMutableArray *numbers = [[NSMutableArray alloc] init];
	NSString *numberString;
	NSScanner *scanner = [NSScanner scannerWithString:string];
	NSCharacterSet *filter = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
	while ([scanner isAtEnd] == NO) {
		numberString = @"";
		[scanner scanUpToCharactersFromSet:filter intoString:NULL];
		if ([scanner scanCharactersFromSet:filter intoString:&numberString]) {
			[numbers addObject:[NSNumber numberWithInt:[numberString intValue]]];
		}
	}

	NSArray *array = [[NSArray alloc] initWithArray:numbers];
	return array;
}

- (void)test {
	[NSArray extractNumbersFromString:@""];
}

@end
