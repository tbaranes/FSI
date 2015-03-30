//
// UITextField+FSIExtensions.m
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

#import "UITextField+FSIExtensions.h"

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)

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

#endif