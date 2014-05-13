//
//  UIButton+FSIExtensions.m
//  FSI
//
//  Created by Tom Baranes on 6/1/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import "UIButton+FSIExtensions.h"

@implementation UIButton (FSIExtensions)

+ (UIButton *)buttonWithImageView:(UIImageView *)imageView target:(id)target selector:(SEL)action
{
	UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[aButton setBackgroundImage:[imageView image] forState:UIControlStateNormal];
	[aButton setBackgroundImage:[imageView highlightedImage] forState:UIControlStateHighlighted];
	
	[aButton setFrame:CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height)];
	[aButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
	return aButton;
}

@end
