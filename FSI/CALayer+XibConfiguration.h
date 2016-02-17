//
//  CALayer+FSIExtension.h
//  FSI
//
//  Created by Tom Baranes on 17/02/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE

@interface CALayer (XibConfiguration)

// This assigns a CGColor to borderColor.
@property(nonatomic, assign) UIColor* borderUIColor;

@end

#endif