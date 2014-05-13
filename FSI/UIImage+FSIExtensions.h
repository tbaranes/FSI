//
//  UIImage+FSI.h
//  FriendlyQuiz
//
//  Created by Tom Baranes on 04/11/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A delightful UIImage category
 */
@interface UIImage (FSIExtensions)

/** A way to create an UIImage fill by a color
 @param color the color which will fill the image
 @returns an image well settled following the color choose
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
