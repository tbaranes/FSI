//
//  UIView+FSIExtensions.h
//  FSI
//
//  Created by Tom Baranes on 6/1/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

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
