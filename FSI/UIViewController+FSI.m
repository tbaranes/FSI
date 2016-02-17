//
//  UIViewController+FSI.m
//  FSI
//
//  Created by Tom Baranes on 26/03/15.
//  Copyright (c) 2016 Tom Baranes. All rights reserved.
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

#import "UIViewController+FSI.h"

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)

@implementation UIViewController (FSI)

- (BOOL)isModal {
	return self.presentingViewController.presentedViewController == self
	|| self.navigationController.presentingViewController.presentedViewController == self.navigationController
	|| [self.tabBarController.presentingViewController isKindOfClass:[UITabBarController class]];
}


@end

#endif