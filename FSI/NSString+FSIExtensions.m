//
// NSString+FSIExtensions.m
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

#import "NSString+FSIExtensions.h"
#import "NSNumberFormatter+FSIExtensions.h"

@implementation NSString (FSIExtensions)

#pragma mark - 

- (BOOL)isEmpty {
	if (self && [self length] > 0 && ![self isEqualToString:@""]) {
		return NO;
	}
	return YES;
}

- (BOOL)isEmailValid
{
	BOOL stricterFilter = YES; // Thread http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
	NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
	NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
	return [emailTest evaluateWithObject:self];
}

#pragma mark - Substrings

- (BOOL)containsSubstring:(NSString *)aString {
#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        return [self containsString:aString];
    }
#endif
    return [self rangeOfString:aString].location != NSNotFound;
}

- (NSRange)rangeInStringForText:(NSString *)textToFind {
    NSUInteger count = 0, length = [self length];
    NSRange range = NSMakeRange(0, length);
    while (range.location != NSNotFound) {
        range = [self rangeOfString:textToFind options:0 range:range];
        if (range.location != NSNotFound) {
            range = NSMakeRange(range.location + range.length, length - (range.location + range.length));
            count++;
            break;
        }
    }
    return range;
}

#pragma mark - Currency

+ (NSString *)stringWithLocaleCurrencyAndPrice:(CGFloat)price {
	NSNumberFormatter *currencyFormatter = [NSNumberFormatter reuseNumberFormatter];
	[currencyFormatter setLocale:[NSLocale currentLocale]];
	[currencyFormatter setMaximumFractionDigits:2];
	[currencyFormatter setMinimumFractionDigits:2];
	[currencyFormatter setAlwaysShowsDecimalSeparator:YES];
	[currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
	
	NSNumber *someAmount = [NSNumber numberWithFloat:price];
	return [currencyFormatter stringFromNumber:someAmount];
}

#pragma mark - HTML

+ (NSString *)stringByStrippingHTMLInText:(NSString *)text {
    NSRange r;
    while ((r = [text rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound) {
        text = [text stringByReplacingCharactersInRange:r withString:@""];
    }
    return text;
}


@end
