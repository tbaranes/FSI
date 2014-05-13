//
//  UIAlertView+FSIExtensions.m
//  FSI
//
//  Created by Tom Baranes on 5/24/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import "UIAlertView+FSIExtensions.h"

@implementation UIAlertView (FSIExtensions)

/** A quick way to create and show an UIAlertView
 @param aTitle the title of the UIAlertView
 @param aMessage the title of the UIAlertView
 */
+ (void)showTitle:(NSString *)aTitle message:(NSString *)aMessage
{
	[UIAlertView showTitle:aTitle message:aMessage delegate:nil];
}

/** A quick way to create and show an UIAlertView with a delegate
 @param aTitle the title of the UIAlertView
 @param aMessage the title of the UIAlertView
 @param aDelegate delegeta of the UIAlertView
 */
+ (void)showTitle:(NSString *)aTitle message:(NSString *)aMessage delegate:(id<UIAlertViewDelegate>)aDelegate
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:aTitle message:aMessage delegate:aDelegate cancelButtonTitle:@"OK" otherButtonTitles: nil];
	[alert show];
}

@end
