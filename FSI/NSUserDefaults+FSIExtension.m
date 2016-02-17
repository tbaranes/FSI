//
//  NSUserDefaults+FSIExtension.m
//  FSI
//
//  Created by Tom Baranes on 21/01/15.
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

#import "NSUserDefaults+FSIExtension.h"

@implementation NSUserDefaults (FSIExtension)

#pragma mark - Helper

- (BOOL)containsKey:(NSString *)key {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	return [[[userDefaults dictionaryRepresentation] allKeys] containsObject:key];
}

#pragma mark - Delete

- (void)resetUserDefaults {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	NSDictionary *dict = [userDefaults dictionaryRepresentation];
	for (id key in dict) {
		[userDefaults removeObjectForKey:key];
	}
	[userDefaults synchronize];
}

@end
