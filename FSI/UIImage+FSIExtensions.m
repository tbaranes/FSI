//
//  UIImage+FSI.m
//  FriendlyQuiz
//
//  Created by Tom Baranes on 04/11/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import "UIImage+FSIExtensions.h"

@implementation UIImage (FSIExtensions)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
