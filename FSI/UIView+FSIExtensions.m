//
// UIView+FSIExtensions.m
//
// Copyright (c) 2013 Tom Baranes
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import <QuartzCore/QuartzCore.h>

#import "UIView+FSIExtensions.h"
#import "NSObject+FSIExtensions.h"

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)

@implementation UIView (FSIExtensions)

#pragma mark - Helper

+ (id)viewFromNib
{
	return [self createObjectOfClass:[self class] fromNibNamed:NSStringFromClass([self class])];
}

- (CGFloat)totalSubviewsHeightWithBottomMargin:(CGFloat)bottomMargin {
    NSInteger height = 0;
    for (UIView *view in self.subviews){
        if (height < view.frame.origin.y + view.frame.size.height) {
            height = view.frame.origin.y + view.frame.size.height;
        }
    }
    return height + bottomMargin;
}

- (void)shadowWithColor:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius andOpacity:(CGFloat)oppacity {
    [self.layer setShadowOffset:offset];
    [self.layer setShadowRadius:radius];
    [self.layer setShadowOpacity:oppacity];
    [self.layer setShadowColor:color.CGColor];
}

#pragma mark - Borders

- (void)bordersWithWidth:(CGFloat)width andColor:(UIColor *)color {
    [self.layer setBorderWidth:width];
    [self.layer setBorderColor:color.CGColor];
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

#pragma mark - Helper

- (UIViewController *)parentViewController {
	UIResponder *responder = self;
	while ([responder isKindOfClass:[UIView class]]) {
		responder = [responder nextResponder];
	}
	return (UIViewController *)responder;
}

@end

#endif