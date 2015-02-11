//
//  NSUserDefaults+KFExtension.m
//  FSI
//
//  Created by Tom Baranes on 21/01/15.
//  Copyright (c) 2015 Recisio. All rights reserved.
//

#import "NSUserDefaults+FSIExtension.h"

@implementation NSUserDefaults (FSIExtension)

- (void)resetUserDefaults {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	NSDictionary *dict = [userDefaults dictionaryRepresentation];
	for (id key in dict) {
		[userDefaults removeObjectForKey:key];
	}
	[userDefaults synchronize];
}

@end
