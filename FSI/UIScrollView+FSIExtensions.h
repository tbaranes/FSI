//
//  UIScrollView+FSIExtensions.h
//  Jukeboard
//
//  Created by Tom Baranes on 7/24/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A delightful UIScrollView category
 */
@interface UIScrollView (FSIExtensions)

/** Set the good height of a UIScrollView following its content
 @param bottomMargin defined the bottom margin after the content
 */
- (void)setContentSizeWithBottomMargin:(CGFloat)bottomMargin;

@end
