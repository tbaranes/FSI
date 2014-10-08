//
//  UILabel+FSITextFormatted.h
//  FSI
//
//  Created by BARANES, Tom on 08/10/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

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
