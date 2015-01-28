//
//  NSFileManager+KFExtension.m
//  FSI
//
//  Created by Tom Baranes on 19/01/15.
//  Copyright (c) 2015 Recisio. All rights reserved.
//

#import "NSFileManager+KFExtension.h"

@implementation NSFileManager (KFExtension)

- (void)clearTmpDirectory {
	NSArray* tmpDirectory = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:NSTemporaryDirectory() error:NULL];
	for (NSString *file in tmpDirectory) {
		[[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@%@", NSTemporaryDirectory(), file] error:NULL];
	}
}

@end
