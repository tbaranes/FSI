//
//  FSIHelper.m
//  FSI
//
//  Created by Tom Baranes on 5/24/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSIDeviceHelper.h"

@implementation FSIDeviceHelper

+ (NSString *)getDeviceVersion {
	return [[UIDevice currentDevice] systemVersion];
}

+ (NSString *)getApplicationVersion {
	return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

@end
