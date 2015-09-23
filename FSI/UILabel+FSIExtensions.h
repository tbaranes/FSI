//
//  UILabel+FSIExtensions.h
//  FSI
//
//  Created by Tom Baranes on 07/10/14.
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

#import <UIKit/UIKit.h>

@interface UILabel (FSIExtensions)

/** Check if a label is truncated or not
 @return bool if or not it's truncated
 */
- (BOOL)isTruncated;

@end

#endif