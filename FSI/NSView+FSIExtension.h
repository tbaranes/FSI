//
//  NSView+FSIExtension.h
//  FSI
//
//  Created by Tom Baranes on 01/04/15.
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

#import <Cocoa/Cocoa.h>

@interface NSView (FSIExtension)

/**
 *  Translate all the UI componants from a xib. Use the title/... contents as the localizable key
 */
- (void)convertLocalizebleStrings;

/**
 *  Return a NSView initialized from its xib. Supposing the NSView class has the same name as its xib
 *
 *  @return The NSView well initialized
 */
+ (id)viewFromNib;

@end
