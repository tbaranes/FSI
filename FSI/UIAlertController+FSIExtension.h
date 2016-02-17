//
//  UIAlertController+FSIExtension.h
//  FSI
//
//  Created by Tom Baranes on 17/02/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE

#import <UIKit/UIKit.h>

@interface UIAlertController (FSIExtension)

/** A quick way to create and show an UIAlertController
 @param aTitle the title of the UIAlertView
 @param aMessage the title of the UIAlertView
 */
+ (void)showAlertControllerWithTitle:(NSString *)title message:(NSString *)message;

@end

#endif