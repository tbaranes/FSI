//
//  NSObject+FSIExtensions.m
//  FSI
//
//  Created by Tom Baranes on 6/1/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NSObject+FSIExtensions.h"

@implementation NSObject (FSIExtensions)

+ (id)createObjectOfClass:(Class)aClass fromNibNamed:(NSString *)nibName
{
	NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
	id object = nil;
	for (NSObject *nibItem in nibContents) {
		if ([nibItem class] == aClass) {
			object = nibItem;
			break;
		}
	}
	return object;
}

@end
