//
//  UIAlertView+FSIExtensions.h
//  FSI
//
//  Created by Tom Baranes on 5/24/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A delightful UIAlertView category
 */
@interface UIAlertView (FSIExtensions)

+ (void)showTitle:(NSString *)aTitle message:(NSString *)aMessage;
+ (void)showTitle:(NSString *)aTitle message:(NSString *)aMessage delegate:(id<UIAlertViewDelegate>)aDelegate;

@end
