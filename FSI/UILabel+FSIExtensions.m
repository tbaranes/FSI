//
//  UILabel+FSIExtensions.m
//  FSI
//
//  Created by Tom Baranes on 07/10/14.
//  Copyright (c) 2014 Tom Baranes. All rights reserved.
//

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)

#import "UILabel+FSIExtensions.h"

@implementation UILabel (FSIExtensions)

#pragma mark - Helper 

- (BOOL)isTruncated {
    
    CGSize perfectSize = [self.text boundingRectWithSize:CGSizeMake(floorf(CGRectGetWidth([self bounds])), MAXFLOAT)
                                                 options:NSStringDrawingUsesLineFragmentOrigin
                                              attributes:@{NSFontAttributeName : self.font}
                                                 context:nil].size;
    NSUInteger nbLinesNecessary = perfectSize.height / self.font.pointSize - 1;
    if (nbLinesNecessary > self.numberOfLines) {
        return YES;
    }
    return NO;
}

@end

#endif