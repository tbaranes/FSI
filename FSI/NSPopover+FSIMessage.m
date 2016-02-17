//
//  NSPopover+FSIMessage.m
//  FSI
//
//  Created by Tom Baranes on 31/08/15.
//  Copyright (c) 2016 Tom Baranes. All rights reserved.
//

#if (!TARGET_IPHONE_SIMULATOR && !TARGET_OS_IPHONE)

#import "NSPopover+FSIMessage.h"

@implementation NSPopover (FSIMessage)

+ (NSPopover *)showRelativeToRect:(NSRect)rect ofView:(NSView *)view preferredEdge:(NSRectEdge)edge string:(NSString *)string maxWidth:(CGFloat)width {
	return [NSPopover showRelativeToRect:rect ofView:view preferredEdge:edge string:string foregroundColor:[NSColor controlTextColor] font:[NSFont systemFontOfSize:[NSFont systemFontSize]] maxWidth:width];
}

+ (NSPopover *)showRelativeToRect:(NSRect)rect ofView:(NSView *)view preferredEdge:(NSRectEdge)edge string:(NSString *)string foregroundColor:(NSColor *)foregroundColor font:(NSFont *)font maxWidth:(CGFloat)width {
	
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: foregroundColor}];
	return [NSPopover showRelativeToRect:rect ofView:view preferredEdge:edge attributedString:attributedString maxWidth:width];
}

+ (NSPopover *)showRelativeToRect:(NSRect)rect ofView:(NSView *)view preferredEdge:(NSRectEdge)edge attributedString:(NSAttributedString *)attributedString maxWidth:(CGFloat)width {
	
	CGFloat padding = 5;
	
	NSRect containerRect = [attributedString boundingRectWithSize:NSMakeSize(width, 0) options:NSStringDrawingUsesLineFragmentOrigin];
	containerRect.size.width += padding * 2;
	
	NSSize size = containerRect.size;
	NSSize popoverSize = NSMakeSize(containerRect.size.width + (padding * 2), containerRect.size.height + (padding * 2));
	containerRect = NSMakeRect(0, 0, popoverSize.width, popoverSize.height);
	
	NSTextField *label = [[NSTextField alloc] initWithFrame:NSMakeRect(padding, padding, popoverSize.width, size.height)];
	[label setBezeled:NO];
	[label setDrawsBackground:NO];
	[label setEditable:NO];
	[label setSelectable:NO];
	label.backgroundColor = [NSColor yellowColor];
	label.alignment = NSCenterTextAlignment;
	[label setAttributedStringValue:attributedString];
	[[label cell] setLineBreakMode:NSLineBreakByTruncatingTail];
	
	NSViewController *controller = [[NSViewController alloc] init];
	NSView *containerView = [[NSView alloc] initWithFrame:containerRect];
	[containerView addSubview:label];
	[controller setView:containerView];
	
	NSPopover *popover = [[NSPopover alloc] init];
	[popover setContentSize:popoverSize];
	[popover setContentViewController:controller];
	[popover setAnimates:YES];
	[popover setBehavior:NSPopoverBehaviorTransient];
	[popover showRelativeToRect:rect ofView:view preferredEdge:edge];
	return popover;
}

@end

#endif