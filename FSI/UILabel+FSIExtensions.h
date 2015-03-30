//
//  UILabel+FSIExtensions.h
//  FSI
//
//  Created by Tom Baranes on 07/10/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)

#import <UIKit/UIKit.h>

@interface UILabel (FSIExtensions)

/** Check if a label is truncated or not
 @return bool if or not it's truncated
 */
- (BOOL)isTruncated;

@end

#endif