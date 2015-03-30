//
//  UIApplication+FSIExtensions.h
//  FSI
//
//  Created by Tom Baranes on 26/03/15.
//  Copyright (c) 2015 Tom Baranes. All rights reserved.
//

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)

#import <UIKit/UIKit.h>

@interface UIApplication (FSIExtensions)

/**
 *  Device's status bar height
 *
 *  @return status bar height
 */
- (CGFloat)statusBarHeight;

@end

#endif