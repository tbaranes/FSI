//
// UIButton+FSIExtensions.h
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

/** A delightful UIButton category
 */
@interface UIButton (FSIExtensions)

/** Easy way to create an UIButton well settled in order to reduce the code to do it
 @param imageView UIButton's image
 @param target target of the UIButton
 @param action selector of the UIButton
 @returns a UIButton well settled
 */
+ (UIButton *)buttonWithImageView:(UIImageView *)imageView target:(id)target selector:(SEL)action;

/** Easy way to create an UIButton well settled in order to reduce the code to do it
 @param title UIButton's title
 @param target target of the UIButton
 @param action selector of the UIButton
 @returns a UIButton well settled
 */
+ (UIButton *)buttonWithTitle:(NSString *)title target:(id)target action:(SEL)action;

@end

#endif