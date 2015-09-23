//
//  UILabel+FSITextFormatted.m
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

#import "UILabel+FSITextFormatted.h"

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE) && !TARGET_OS_TV

@implementation UILabel (FSITextFormatted)

#pragma mark - Text color

- (void)setTextColor:(UIColor *)textColor range:(NSRange)range {
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString: self.attributedText];
    [text addAttribute: NSForegroundColorAttributeName
                 value: textColor
                 range: range];    
    [self setAttributedText: text];
}


- (void)setTextColor:(UIColor *)textColor afterOccurenceOfString:(NSString *)separator {
    NSRange range = [self.text rangeOfString:separator];
    if (range.location != NSNotFound) {
        range.location++;
        range.length = self.text.length - range.location;
        [self setTextColor:textColor range:range];
    }
}


- (void)setTextColor:(UIColor *)color textToColorize:(NSString *)textToColorize {
    NSString *text = self.text;
    NSUInteger count = 0, length = [text length];
    NSRange range = NSMakeRange(0, length);
    while (range.location != NSNotFound) {
        range = [text rangeOfString:textToColorize options:0 range:range];
        if (range.location != NSNotFound) {
            [self setTextColor:color range:NSMakeRange(range.location, [textToColorize length])];
            range = NSMakeRange(range.location + range.length, length - (range.location + range.length));
            count++;
            break;
        }
    }
}

#pragma mark - Strike

- (void)setTextStrikeInRange:(NSRange)range {
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString: self.attributedText];
    [text addAttribute:NSStrikethroughStyleAttributeName
                 value:@1
                 range:range];
    [self setAttributedText: text];
}

- (void)setTextStrikeAfterOccurenceOfString:(NSString *)separator {
    NSRange range = [self.text rangeOfString:separator];
    if (range.location != NSNotFound) {
        range.location++;
        range.length = self.text.length - range.location;
        [self setTextStrikeInRange:range];
    }
}

#pragma mark - Underline

- (void)setTextUnderlineInRange:(NSRange)range {
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    [attributeString addAttribute:NSUnderlineStyleAttributeName
                            value:[NSNumber numberWithInt:1]
                            range:range];
    [self setAttributedText:attributeString];
}

@end

#endif