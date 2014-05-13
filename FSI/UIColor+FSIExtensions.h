//
//  UIColor+FSIExtensions.h
//  Jukeboard
//
//  Created by Tom Baranes on 6/15/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A delightful UIColor category
 */
@interface UIColor (FSIExtensions)

/** A way to create an UICollor from a hex value
 @param hexString hex value
 @returns a UIColor well settled following the hex value
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end
