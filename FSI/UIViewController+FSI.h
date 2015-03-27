//
//  UIViewController+FSI.h
//  FSI
//
//  Created by Tom Baranes on 26/03/15.
//  Copyright (c) 2015 Tom Baranes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (FSI)

/**
 *  Check if the UIViewController is present as a modal or not
 *
 *  @return YES if it's a modal, no if not
 */
- (BOOL)isModal;

@end
