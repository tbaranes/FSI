//
//  UIScreen+FSIExtention.h
//  FSI
//
//  Created by Tom Baranes on 08/12/14.
//  Copyright (c) 2014 Recisio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (FSIExtention)

// Return the screen size, , used for the compatibility iOS7/8
+ (CGSize)screenSize;

// Return the screen bounds, used for the compatibility iOS7/8
+ (CGRect)screenBounds;

@end
