//
//  NSString+FSIExtensions.m
//  Jukeboard
//
//  Created by Tom Baranes on 6/12/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import "NSString+FSIExtensions.h"

@implementation NSString (FSIExtensions)

- (BOOL)isEmpty {
	if (self && [self length] > 0 && ![self isEqualToString:@""]) {
		return NO;
	}
	return YES;
}

- (BOOL)isEmailValid
{
	BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
	NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
	NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
	return [emailTest evaluateWithObject:self];
}

@end
