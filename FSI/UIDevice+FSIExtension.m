//
//  UIDevice+FSIExtension.m
//  FSI
//
//  Created by Tom Baranes on 04/12/14.
//  Copyright (c) 2014 Recisio. All rights reserved.
//

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)

#import "UIDevice+FSIExtension.h"

@implementation UIDevice (FSIExtension)

- (void)forcedDeviceOrientation:(UIDeviceOrientation)newOrientation {
	NSNumber *value = [NSNumber numberWithInt:newOrientation];
	[[UIDevice currentDevice] setValue:value forKey:@"orientation"];
}

@end

#endif