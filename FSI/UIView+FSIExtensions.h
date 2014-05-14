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

#import <UIKit/UIKit.h>

@interface UIView (FSIExtensions)

/** Create an UIview from with its xib
 @returns the view well settled
 */
+ (id)viewFromNib;

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

@end
