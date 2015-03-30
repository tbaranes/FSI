//
// UIImage+FSI.m
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

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)

#import "UIImage+FSIExtensions.h"

@implementation UIImage (FSIExtensions)

#pragma mark - Screenshot

+ (UIImage *)screenshot {
	UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
	CGRect rect = [keyWindow bounds];
	UIGraphicsBeginImageContextWithOptions(rect.size,YES,0.0f);
	[keyWindow drawViewHierarchyInRect:rect afterScreenUpdates:YES];
	UIImage *capturedScreen = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return capturedScreen;
}

+ (UIImage *)screenshotOfView:(UIView *)viewToCapture {
	UIGraphicsBeginImageContextWithOptions(viewToCapture.bounds.size, NO, [UIScreen mainScreen].scale);
	[viewToCapture drawViewHierarchyInRect:viewToCapture.bounds afterScreenUpdates:YES];
	UIImage *capturedView = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return capturedView;
}

#pragma mark - Color

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

#endif