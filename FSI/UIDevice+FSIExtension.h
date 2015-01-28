//
//  UIDevice+KFExtension.h
//  FSI
//
//  Created by Tom Baranes on 04/12/14.
//  Copyright (c) 2014 Recisio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (FSIExtension)

// Force the device to change its orientation
- (void)forcedDeviceOrientation:(UIDeviceOrientation)newOrientation;

@end
