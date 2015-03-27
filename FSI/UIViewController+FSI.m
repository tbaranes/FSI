//
//  UIViewController+FSI.m
//  FSI
//
//  Created by Tom Baranes on 26/03/15.
//  Copyright (c) 2015 Tom Baranes. All rights reserved.
//

#import "UIViewController+FSI.h"

@implementation UIViewController (FSI)

- (BOOL)isModal {
	return self.presentingViewController.presentedViewController == self
	|| self.navigationController.presentingViewController.presentedViewController == self.navigationController
	|| [self.tabBarController.presentingViewController isKindOfClass:[UITabBarController class]];
}

@end
