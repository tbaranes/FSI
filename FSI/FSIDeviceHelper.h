//
//  FSIHelper.h
//  FSI
//
//  Created by Tom Baranes on 5/24/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A class which makes easier to get some general information about the device
 */
@interface FSIDeviceHelper : NSObject

/** Shortcut to get the application version
 @returns a string representing the application version
 */
+ (NSString *)getApplicationVersion;

/** Shortcut to get the device version
 @returns a string representing the device version
 */
+ (NSString *)getDeviceVersion;

@end
