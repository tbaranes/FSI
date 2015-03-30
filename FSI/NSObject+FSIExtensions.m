//
// NSObject+FSIExtensions.m
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

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>
#endif

#import "NSObject+FSIExtensions.h"

@implementation NSObject (FSIExtensions)

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)

+ (id)createObjectOfClass:(Class)aClass fromNibNamed:(NSString *)nibName
{
	NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
	id object = nil;
	for (NSObject *nibItem in nibContents) {
		if ([nibItem class] == aClass) {
			object = nibItem;
			break;
		}
	}
	return object;
}

#endif

@end
