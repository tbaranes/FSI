//
//  NSString+FSIExtensions.h
//  Jukeboard
//
//  Created by Tom Baranes on 6/12/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

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

@end
