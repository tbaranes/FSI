//
// FSIHelper.h
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

/** A class which makes easier to get some general information about the device
 */
@interface FSIDeviceHelper : NSObject

/** Shortcut to get the application version
 @returns a string representing the application version
 */
+ (NSString *)getApplicationVersion;

/** Shortcut to get the device version
 @returns a string representing the device version
 */
+ (NSString *)getDeviceVersion;

@end
