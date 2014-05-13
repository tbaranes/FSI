//
//  FSIReachibility.h
//  FSI
//
//  Created by Tom Baranes on 5/16/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A usefull class relative of the network management
 */
@interface FSIReachibility : NSObject

/** Way to know if the user has a connectivity or not
 @returns BOOL following the connectivity state
 */
+ (BOOL)hasConnectivity;

@end
