//
// NSNumberFormatter+FSIExtensions.m
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

#import "NSNumberFormatter+FSIExtensions.h"

/** Usefull methods to use with NSNumberFormatter
 */
@implementation NSNumberFormatter (FSIExtensions)

/** If the NSNumberFormatter wasn't created yet, it will be created and stored to be reuse later
 If the NSNumberFormatter has been already used, it will be reuse
 @returns a NSDateFormatter with a basic date style
 */
+ (NSNumberFormatter *)reuseNumberFormatter
{
	static NSString *kNumberFormatter = @"kNumberFormatter";
	
	NSMutableDictionary *threadDict = [[NSThread currentThread] threadDictionary];
	NSNumberFormatter *numberFormatter = [threadDict objectForKey:kNumberFormatter];
	if (!numberFormatter) {
		numberFormatter = [[NSNumberFormatter alloc] init];
		[threadDict setObject:numberFormatter forKey:kNumberFormatter];
	}
	return numberFormatter;
}

@end
