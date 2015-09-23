//
//  UILabel+FSITextFormatted.h
//  FSI
//
//  Created by BARANES, Tom on 08/10/14.
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

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE) && !TARGET_OS_TV

#import <UIKit/UIKit.h>

@interface UILabel (FSITextFormatted)

#pragma mark - Custom color

/** Set a part of uilabel's text in a custom color
 @param textColor custom color
 @param range position of the text to colorize
 */
- (void)setTextColor:(UIColor *)textColor range:(NSRange)range;

/** Set a part of uilabel's text in a custom color
 @param textColor custom color
 @param separator colorize all the text after this occurence
 */
- (void)setTextColor:(UIColor *)textColor afterOccurenceOfString:(NSString *)separator;

/** Set a part of uilabel's text in a custom color
 @param textColor custom color
 @param textToColorize colorize this part of text only
 */
- (void)setTextColor:(UIColor *)color textToColorize:(NSString *)textToColorize;

#pragma mark - Strike

/** Set a part of uilabel's text in a custom color
 @param range position of the text to strike
 */
- (void)setTextStrikeInRange:(NSRange)range;

/** Set a part of uilabel's text in a custom color
 @param separator strike all the text after this occurence
 */
- (void)setTextStrikeAfterOccurenceOfString:(NSString *)separator;

#pragma mark - Underline

/** Underline the entire text of the label
  @param range position of the text to strike
 */
- (void)setTextUnderlineInRange:(NSRange)range;

@end

#endif