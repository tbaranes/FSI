//
// NSString+FSIExtensions.h
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

#import <Foundation/Foundation.h>

/** A delightful NSString category
 */
@interface NSString (FSIExtensions)

/** Check the content of the NSString
 @returns if the string is empty YES, else NO
 */
- (BOOL)isEmpty;

/** Check if an email is valid
 @returns if the email is valid YES, else NO
 */
- (BOOL)isEmailValid;

#pragma mark - Substrings

/** Check if a string contains a specific substring (use right method following iOS version)
 @returns BOOL following if the substring is found or not
 */
- (BOOL)containsSubstring:(NSString *)aString;

/** Search and find range of a substring in the string
 @returns NSRange range of the string to find
 */
- (NSRange)rangeInStringForText:(NSString *)textToFind;

#pragma mark - Locale

/** Create an NSString composed of a price and his locale symbol
 @param price price to put in the string
 @returns the string created
 */
+ (NSString *)stringWithLocaleCurrencyAndPrice:(CGFloat)price;

#pragma mark - HTML

/** Create an NSString without HTML tags
 @param text text to strip
 @returns the string created
*/
+ (NSString *)stringByStrippingHTMLInText:(NSString *)text;

@end
