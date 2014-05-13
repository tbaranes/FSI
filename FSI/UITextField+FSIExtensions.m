//
//  UITextField+FSIExtensions.m
//  FriendlyQuiz
//
//  Created by Tom Baranes on 04/11/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import "UITextField+FSIExtensions.h"

@implementation UITextField (FSIExtensions)

- (void)addLeftImage:(UIImage *)image {
	UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
	[self setLeftView:imageView];
	[self setLeftViewMode:UITextFieldViewModeAlways];
}

- (void)openKeyboardWithAnimationForView:(UIView *)view directionUp:(BOOL)movedUp newY:(NSInteger)y {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    CGRect resizeFrame = [view frame];
    resizeFrame.origin.y += movedUp ? -y : y;
    [view setFrame:resizeFrame];
    [UIView commitAnimations];
}

@end

