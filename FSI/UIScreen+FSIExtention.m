//
//  UIScreen+FSIExtention.m
//  FSI
//
//  Created by Tom Baranes on 08/12/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
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

#import "UIScreen+FSIExtention.h"

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)

@implementation UIScreen (FSIExtention)

#pragma mark - 

+ (CGSize)screenSize {
	CGSize screenSize = [UIScreen mainScreen].bounds.size;
	if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
		return CGSizeMake(screenSize.height, screenSize.width);
	}
	return screenSize;
}

+ (CGRect)screenBounds {
	CGSize sreenSize = [self screenSize];
	return CGRectMake(0, 0, sreenSize.width, sreenSize.height);
}

@end

#endif