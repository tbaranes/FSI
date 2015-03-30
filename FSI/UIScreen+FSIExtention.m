//
//  UIScreen+FSIExtention.m
//  FSI
//
//  Created by Tom Baranes on 08/12/14.
//  Copyright (c) 2014 Recisio. All rights reserved.
//

#import "UIScreen+FSIExtention.h"

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)

@implementation UIScreen (FSIExtention)

#pragma mark - 

+ (CGSize)screenSize {
	CGSize screenSize = [UIScreen mainScreen].bounds.size;
	if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
		return CGSizeMake(screenSize.height, screenSize.width);
	}
	return screenSize;
}

+ (CGRect)screenBounds {
	CGSize sreenSize = [self screenSize];
	return CGRectMake(0, 0, sreenSize.width, sreenSize.height);
}

@end

#endif