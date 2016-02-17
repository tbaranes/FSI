//
//  NSFileManager+FSIExtension.m
//  FSI
//
//  Created by Tom Baranes on 19/01/15.
//  Copyright (c) 2016 Tom Baranes. All rights reserved.
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

#import "NSFileManager+FSIExtension.h"
#import "FSILogger.h"

@implementation NSFileManager (FSIExtension)

#pragma mark - Helper

- (NSURL *)defaultAppURL {
#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
	// On iOS the Documents directory isn't user-visible, so put files there
	//	NSURL *defaultURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
	NSURL *defaultURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
#else
	// On OS X it is, so put files in Application Support. If we aren't running
	// in a sandbox, put it in a subdirectory based on the bundle identifier
	// to avoid accidentally sharing files between applications
	NSURL *defaultURL = [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] firstObject];
	if (![[NSProcessInfo processInfo] environment][@"APP_SANDBOX_CONTAINER_ID"]) {
		NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
		if ([identifier length] == 0) {
			identifier = [[[NSBundle mainBundle] executablePath] lastPathComponent];
		}
		defaultURL = [defaultURL URLByAppendingPathComponent:identifier isDirectory:YES];
	}
#endif
	return defaultURL;
}

#pragma mark - Create

- (void)createDirectoryIfNotExistingForPath:(NSString *)path {
	BOOL isDir;
	BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
	if (!fileExists || !isDir) {
		NSError *error = nil;
		if (![[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error]) {
			FSILogD(@"%@", error);
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
