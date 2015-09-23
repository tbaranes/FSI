//
//  UIDevice+FSIExtension.m
//  FSI
//
//  Created by Tom Baranes on 04/12/14.
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

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE) && !TARGET_OS_TV

#import "UIDevice+FSIExtension.h"

@implementation UIDevice (FSIExtension)

- (void)forcedDeviceOrientation:(UIDeviceOrientation)newOrientation {
	NSNumber *value = [NSNumber numberWithInt:newOrientation];
	[[UIDevice currentDevice] setValue:value forKey:@"orientation"];
}

@end

#endif