//
// NSArray+FSIExtensions.m
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


#import "NSArray+FSIExtensions.h"

@implementation NSArray (FSIExtensions)

+ (NSArray *)extractNumbersFromString:(NSString *)string {
	
	NSMutableArray *numbers = [[NSMutableArray alloc] init];
	NSString *numberString;
	NSScanner *scanner = [NSScanner scannerWithString:string];
	NSCharacterSet *filter = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
	while ([scanner isAtEnd] == NO) {
		numberString = @"";
		[scanner scanUpToCharactersFromSet:filter intoString:NULL];
		if ([scanner scanCharactersFromSet:filter intoString:&numberString]) {
			[numbers addObject:[NSNumber numberWithInt:[numberString intValue]]];
		}
	}

	NSArray *array = [[NSArray alloc] initWithArray:numbers];
	return array;
}

- (void)test {
	[NSArray extractNumbersFromString:@""];
}

#pragma mark - Mutability

- (NSArray *)arrayByAddingObject:(id)object {
	NSMutableArray *mutableArray = [self mutableCopy];
	[mutableArray addObject:object];
	return [mutableArray copy];
}

- (NSArray *)arrayByInsertingObject:(id)object atIndex:(NSInteger)idx {
	if (idx > [self count]) {
		return self;
	}
	
	NSMutableArray *mutableArray = [self mutableCopy];
	[mutableArray insertObject:object atIndex:idx];
	return [mutableArray copy];
}

- (NSArray *)arrayByReplacingObjectAtIndex:(NSInteger)idx withObject:(id)object {
	if (!object || idx >= [self count]) {
		return self;
	}
	
	NSMutableArray *mutableArray = [self mutableCopy];
	[mutableArray replaceObjectAtIndex:idx withObject:object];
	return [mutableArray copy];
}

- (NSArray *)arrayByRemovingObject:(id)object {
	NSMutableArray *mutableArray = [self mutableCopy];
	[mutableArray removeObject:object];
	return [mutableArray copy];
}

- (NSArray *)arrayByRemovingObjectAtIndex:(NSInteger)idx {
	if (idx >= [self count]) {
		return self;
	}
	
	NSMutableArray *mutableArray = [self mutableCopy];
	[mutableArray removeObjectAtIndex:idx];
	return [mutableArray copy];
}

- (NSArray *)arrayByMovingObjectAtIndex:(NSInteger)atIndex toIndex:(NSInteger)toIndex {
	if (toIndex >= [self count]) {
		return self;
	}
	
	id obj = [self objectAtIndex:atIndex];
	NSMutableArray *mutableArray = [self mutableCopy];
	[mutableArray removeObjectAtIndex:atIndex];
	[mutableArray insertObject:obj atIndex:toIndex];
	return [mutableArray copy];
}

@end
