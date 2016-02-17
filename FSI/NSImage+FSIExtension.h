//
//  NSImage+FSIExtension.h
//  FSI
//
//  Created by Tom Baranes on 15/04/15.
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

#if (!TARGET_IPHONE_SIMULATOR && !TARGET_OS_IPHONE)

#import <Cocoa/Cocoa.h>

@interface NSImage (FSIExtension)

/**
 *  Tint a NSImage
 *
 *  @param tint the tint color
 *
 *  @return the image tinted
 */
- (NSImage *)imageTintedWithColor:(NSColor *)tint;

/**
 *  Create a NSImage filled by a color
 *
 *  @param color color will be filled the image
 *  @param size  size of the image
 *
 *  @return the image created
 */
+ (NSImage *)imageWithColor:(NSColor *)color size:(CGSize)size;

@end

#endif