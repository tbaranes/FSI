//
// NSObject+FSIExtensions.h
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

/** A delightful NSObject category
 */
@interface NSObject (FSIExtensions)

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)

/** Create an object from a class
 @param aClass class to create
 @param nibName the name of nib, if a nib is linked
 @returns a NSDateFormatter with a basic date style
 */
+ (id)createObjectOfClass:(Class)aClass fromNibNamed:(NSString *)nibName;

#endif

@end