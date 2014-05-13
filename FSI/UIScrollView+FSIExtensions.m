//
//  UIScrollView+FSIExtensions.m
//  Jukeboard
//
//  Created by Tom Baranes on 7/24/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import "UIScrollView+FSIExtensions.h"

@implementation UIScrollView (FSIExtensions)

- (void)setContentSizeWithBottomMargin:(CGFloat)bottomMargin
{
	CGFloat scrollViewHeight = 0.0f;
	for (UIView *view in self.subviews){
		if (scrollViewHeight < view.frame.origin.y + view.frame.size.height) {
			scrollViewHeight = view.frame.origin.y + view.frame.size.height;	
		}
	}
	
	scrollViewHeight += bottomMargin;
	[self setContentSize:(CGSizeMake(CGRectGetWidth([self bounds]), scrollViewHeight))];
}

@end
