//
//  UIButton+FSIExtensions.h
//  FSI
//
//  Created by Tom Baranes on 6/1/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A delightful UIButton category
 */
@interface UIButton (FSIExtensions)

/** A way to create an UIButton well settled in order to reduce the goal to do it
 @param imageView UIButton's image
 @param target target of the UIButton
 @param action selector of the UIButton
 @returns a UIButton well settled
 */
+ (UIButton *)buttonWithImageView:(UIImageView *)imageView target:(id)target selector:(SEL)action;

@end
