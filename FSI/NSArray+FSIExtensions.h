//
// NSArray+FSIExtensions.h
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

#import <Foundation/Foundation.h>

/** A delightful NSArray category
 */
@interface NSArray (FSIExtensions)

/** Extract all numbers found in a NSString
 @param string the string to parse
 @returns array whith all numbers found
 */
+ (NSArray *)extractNumbersFromString:(NSString *)string;

- (NSArray *)arrayByRemovingObject:(id)object;
- (NSArray *)arrayByInsertingObject:(id)object atIndex:(NSInteger)idx;
- (NSArray *)arrayByAddingObject:(id)object;
- (NSArray *)arrayByRemovingObjectAtIndex:(NSInteger)idx;
- (NSArray *)arrayByReplacingObjectAtIndex:(NSInteger)idx withObject:(id)object;
- (NSArray *)arrayByMovingObjectAtIndex:(NSInteger)atIndex toIndex:(NSInteger)toIndex;

@end
