//
//  UITextField+FSIExtensions.h
//  FriendlyQuiz
//
//  Created by Tom Baranes on 04/11/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A delightful UITextField category
 */
@interface UITextField (FSIExtensions)

/** Set a left image in the UIButton in order to reduce the code to do that
 @param image the left image
 */
- (void)addLeftImage:(UIImage *)image;

/** Open the keyboard and go up the rest of the view with an animation
 @param view the view to move once the keyboard open
 @param movedUp if the keyboard will be opened or closed
 @param y the new y position of the view
 */
- (void)openKeyboardWithAnimationForView:(UIView *)view directionUp:(BOOL)movedUp newY:(NSInteger)y;

@end
