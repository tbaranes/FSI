//
//  NSPopover+FSIMessage.h
//  FSI
//
//  Created by Tom Baranes on 31/08/15.
//  Copyright (c) 2016 Tom Baranes. All rights reserved.
//

#if (!TARGET_IPHONE_SIMULATOR && !TARGET_OS_IPHONE)

#import <Cocoa/Cocoa.h>

@interface NSPopover (FSIMessage)

+ (NSPopover *)showRelativeToRect:(NSRect)rect ofView:(NSView *)view preferredEdge:(NSRectEdge)edge string:(NSString *)string maxWidth:(CGFloat)width;

+ (NSPopover *)showRelativeToRect:(NSRect)rect ofView:(NSView *)view preferredEdge:(NSRectEdge)edge string:(NSString *)string foregroundColor:(NSColor *)foregroundColor font:(NSFont *)font maxWidth:(CGFloat)width;

+ (NSPopover *)showRelativeToRect:(NSRect)rect ofView:(NSView *)view preferredEdge:(NSRectEdge)edge attributedString:(NSAttributedString *)attributedString maxWidth:(CGFloat)width;

@end

#endif