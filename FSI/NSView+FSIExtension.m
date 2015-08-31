//
//  NSView+FSIExtension.m
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

#if (!TARGET_IPHONE_SIMULATOR && !TARGET_OS_IPHONE)

#import "NSView+FSIExtension.h"

@implementation NSView (FSIExtension)

#pragma mark - Localizable

- (void)convertLocalizableStrings {
	NSArray *subviews = [self subviews];
	if ([subviews count] == 0) {
		return;
	}
	
	for (NSView *aLocalizableUIElement in subviews) {
		if ([aLocalizableUIElement isKindOfClass:[NSTextField class]]) {
			NSTextField *aLocalizable = (NSTextField *)aLocalizableUIElement;
			NSString *key = aLocalizable.stringValue;
			[aLocalizable setStringValue:NSLocalizedString(key, nil)];
			[aLocalizable setPlaceholderString:NSLocalizedString(aLocalizable.placeholderString, nil)];
		} else if ([aLocalizableUIElement isKindOfClass:[NSButton class]]) {
			NSButton *aLocalizable = (NSButton *)aLocalizableUIElement;
			NSString *key = aLocalizable.title;
			[aLocalizable setTitle:NSLocalizedString(key, nil)];
		} else if ([aLocalizableUIElement isKindOfClass:[NSTabViewItem class]]) {
			NSTabViewItem *aLocalizable = (NSTabViewItem *)aLocalizableUIElement;
			NSString *key = aLocalizable.label;
			[aLocalizable setLabel:NSLocalizedString(key, nil)];
		} else {
			[aLocalizableUIElement convertLocalizableStrings];
		}
	}
}

#pragma mark - Nib

+ (id)viewFromNib {
	NSNib *nib = [[NSNib alloc] initWithNibNamed:NSStringFromClass([self class]) bundle:nil];
	NSArray *topLevelObjects;
	if (![nib instantiateWithOwner:self topLevelObjects:&topLevelObjects]) {
		return nil;
	}
	
	for (NSObject *nibItem in topLevelObjects) {
		if ([nibItem isKindOfClass:[self class]]) {
			return nibItem;
		}
	}
	return nil;
}

@end

#endif