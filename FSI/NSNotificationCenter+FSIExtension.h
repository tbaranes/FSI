//
//  NSNotificationCenter+FSIExtension.h
//  FSI
//
//  Created by Tom Baranes on 23/03/15.
//  Copyright (c) 2015 Tom Baranes. All rights reserved.
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

@interface NSNotificationCenter (FSIExtension)

/**
 *  Post notification in a specific thread
 *
 *  @param aName    Notification name
 *  @param anObject object
 *  @param queue    queue where the notification will be post
 */
- (void)postNotificationName:(NSString *)aName object:(id)anObject queue:(dispatch_queue_t)queue;

@end
