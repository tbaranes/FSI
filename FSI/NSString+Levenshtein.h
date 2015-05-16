//
//  NSString+Levenshtein.h
//  FSI
//
//  Created by Tom Baranes on 11/10/14.
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

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface NSString (Levenshtein)

// calculate the smallest distance between all words in stringA and stringB
- (CGFloat)compareWithString:(NSString *)stringB matchGain:(NSInteger)gain missingCost:(NSInteger)cost;

// calculate the distance between two string treating them each as a single word
- (NSInteger)compareWithWord:(NSString *)stringB matchGain:(NSInteger)gain missingCost:(NSInteger)cost;

@end
