//
//  UIApplication+FSIExtensions.m
//  FSI
//
//  Created by Tom Baranes on 26/03/15.
//  Copyright (c) 2015 Tom Baranes. All rights reserved.
//

#import "UIApplication+FSIExtensions.h"

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)

@implementation UIApplication (FSIExtensions)

- (CGFloat)statusBarHeight {
	return MIN([UIApplication sharedApplication].statusBarFrame.size.height, [UIApplication sharedApplication].statusBarFrame.size.width);
}

@end

#endif