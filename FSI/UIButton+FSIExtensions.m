//
// UIButton+FSIExtensions.m
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

#import "UIButton+FSIExtensions.h"

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)

@implementation UIButton (FSIExtensions)

+ (UIButton *)buttonWithImageView:(UIImageView *)imageView target:(id)target selector:(SEL)action
{
	UIButton *aButton = [UIButton buttonWithType:UIButtonTypeSystem];
	[aButton setBackgroundImage:[imageView image] forState:UIControlStateNormal];
	[aButton setBackgroundImage:[imageView highlightedImage] forState:UIControlStateHighlighted];
	
	[aButton setFrame:CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height)];
	[aButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
	return aButton;
}

+ (UIButton *)buttonWithTitle:(NSString *)title target:(id)target action:(SEL)action {
	UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
	[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[button setTitle:title forState:UIControlStateNormal];
	[button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
	[button sizeToFit];
	return button;
}

@end

#endif