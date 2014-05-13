//
//  UIView+FSIExtensions.m
//  FSI
//
//  Created by Tom Baranes on 6/1/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "UIView+FSIExtensions.h"
#import "NSObject+FSIExtensions.h"

@implementation UIView (FSIExtensions)

+ (id)viewFromNib
{
	return [self createObjectOfClass:[self class] fromNibNamed:NSStringFromClass([self class])];
}

#pragma mark - Localizable

// Replace text in subviews with localized target
- (void)convertLocalizebleStrings {
    // Get the subviews of the view and return if they are empty
    NSArray *subviews = [self subviews];
    if ([subviews count] == 0) {
        return;
    }
    
    for (UIView *aLocalizableUIElement in subviews) {
        if ([aLocalizableUIElement isKindOfClass:[UILabel class]]) {
            UILabel *aLocalizable = (UILabel *)aLocalizableUIElement;
            NSString *key = aLocalizable.text;
            [aLocalizable setText:NSLocalizedString(key, nil)];
        } else if ([aLocalizableUIElement isKindOfClass:[UITextField class]]) {
            UITextField *aLocalizable = (UITextField *)aLocalizableUIElement;
            NSString *key = aLocalizable.placeholder;
            [aLocalizable setPlaceholder:NSLocalizedString(key, nil)];
        } else if ([aLocalizableUIElement isKindOfClass:[UITextView class]]) {
            UITextView *aLocalizable = (UITextView *)aLocalizableUIElement;
            NSString *key = aLocalizable.text;
            [aLocalizable setText:NSLocalizedString(key, nil)];
        } else if ([aLocalizableUIElement isKindOfClass:[UIButton class]]) {
            UIButton *aLocalizable = (UIButton *)aLocalizableUIElement;
            NSString *key = aLocalizable.titleLabel.text;
            [aLocalizable setTitle:NSLocalizedString(key, nil) forState:UIControlStateNormal];
        } else {
            [aLocalizableUIElement convertLocalizebleStrings];
        }
    }
}

#pragma mark - 360 Rotation

- (void)rotate360WithDuration:(CGFloat)aDuration repeatCount:(CGFloat)aRepeatCount {
	CAKeyframeAnimation *theAnimation = [CAKeyframeAnimation animation];
	theAnimation.values = [NSArray arrayWithObjects:
						   [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0,0,1)],
						   [NSValue valueWithCATransform3D:CATransform3DMakeRotation(3.13, 0,0,1)],
						   [NSValue valueWithCATransform3D:CATransform3DMakeRotation(6.26, 0,0,1)],
						   nil];
	theAnimation.cumulative = YES;
	theAnimation.duration = aDuration;
	theAnimation.repeatCount = aRepeatCount;
	theAnimation.removedOnCompletion = YES;
	[self.layer addAnimation:theAnimation forKey:@"transform"];
}

#pragma mark - Circle

- (void)setRoundedViewToDiameter:(float)newSize
{
    CGPoint saveCenter = self.center;
    CGRect newFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newSize, newSize);
    self.frame = newFrame;
    self.layer.cornerRadius = newSize / 2.0;
    self.center = saveCenter;
}

- (void)setRoundedViewToDiameter:(float)newSize withBorderColor:(UIColor *)color
{
    CGPoint saveCenter = self.center;
    CGRect newFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newSize, newSize);
    self.frame = newFrame;
    self.layer.cornerRadius = newSize / 2.0;
    self.center = saveCenter;
	
	[self.layer setBorderColor:color.CGColor];
	[self.layer setBorderWidth:2.0f];
}

@end
