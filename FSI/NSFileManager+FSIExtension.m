//
//  NSFileManager+KFExtension.m
//  FSI
//
//  Created by Tom Baranes on 19/01/15.
//  Copyright (c) 2015 Recisio. All rights reserved.
//

#import "NSFileManager+FSIExtension.h"

@implementation NSFileManager (FSIExtension)

#pragma mark - Create

- (void)createDirectoryIfNotExistingForPath:(NSString *)path {
	BOOL isDir;
	BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
	if (!fileExists || !isDir) {
		NSError *error = nil;
		if (![[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error]) {
			NSLog(@"%@", error);
		}
	}
}

#pragma mark - Delete

- (void)clearTmpDirectory {
	NSArray* tmpDirectory = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:NSTemporaryDirectory() error:NULL];
	for (NSString *file in tmpDirectory) {
		[[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@%@", NSTemporaryDirectory(), file] error:NULL];
	}
}

- (void)deleteAllFilesInDocumentDirectory {
	NSArray *directoryContents = [self contentsOfDirectoryAtPath:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] error:NULL];
	for (NSString *path in directoryContents) {
		NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:path];
		[[NSFileManager defaultManager] removeItemAtPath:fullPath error:nil];
	}
}

#pragma mark - Get

- (NSArray *)contentOfDocumentURL:(NSURL *)URL sortByDateAscending:(BOOL)ascending {
	NSArray *directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:URL
															  includingPropertiesForKeys:@[NSURLContentModificationDateKey]
																				 options:NSDirectoryEnumerationSkipsHiddenFiles
																				   error:nil];
	
	NSArray *sortedContent = [directoryContent sortedArrayUsingComparator:^(NSURL *file1, NSURL *file2) {
		NSDate *file1Date;
		[file1 getResourceValue:&file1Date forKey:NSURLContentModificationDateKey error:nil];
		NSDate *file2Date;
		[file2 getResourceValue:&file2Date forKey:NSURLContentModificationDateKey error:nil];
		if (ascending) {
			return [file1Date compare:file2Date];
		}
		return [file2Date compare:file1Date];
	}];
	return sortedContent;
}

@end
