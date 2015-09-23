//
// UIView+FSIExtensions.h
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

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE) && !TARGET_OS_TV

#import <UIKit/UIKit.h>

@interface UIView (FSIExtensions)

/** Create an UIview from with its xib
 @returns the view well settled
 */
+ (id)viewFromNib;

/** Add a shadow following attributes passed
 */
- (void)shadowWithColor:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius andOpacity:(CGFloat)oppacity;

/** Set border in UIView layer, not drawing
 */
- (void)bordersWithWidth:(CGFloat)width andColor:(UIColor *)color;

/** Calculate the view's height following the subviews
 @returns the height
 */
- (CGFloat)totalSubviewsHeightWithBottomMargin:(CGFloat)bottomMargin;

/** Convert every UI components text by the localizable matching
	The UI components text must be the key matching in the localizable files
 */
- (void)convertLocalizebleStrings;

/** Launch a 360 rotation animation
 @param aDuration duration of the animation
 @param aRepeatCount how many times the rotation will be done
 */
- (void)rotate360WithDuration:(CGFloat)aDuration repeatCount:(CGFloat)aRepeatCount;

/** Transform the view in a round view following the diameter asked. Usefull for round image
 @param newSize round diameter
 */
- (void)setRoundedViewToDiameter:(float)newSize;

/** Create a round view following the diameter asked. Usefull for round image
 @param newSize round diameter
 @param color put a border with the color asked
 */
- (void)setRoundedViewToDiameter:(float)newSize withBorderColor:(UIColor *)color;

/** Search and return the parent view controller
 @returns parentController of the view if found
 */
- (UIViewController *)parentViewController;
@end

#endif