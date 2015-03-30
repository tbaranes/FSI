//
// UITextField+FSIExtensions.h
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

#endif