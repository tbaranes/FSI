//
//  NSFileManager+FSIExtension.h
//  FSI
//
//  Created by Tom Baranes on 19/01/15.
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

#import <Foundation/Foundation.h>

@interface NSFileManager (FSIExtension)

/**
 *  Return the default application directory URL for iOS and OSX
 *
 *  @return url of the default directory
 */
- (NSURL *)defaultAppURL;

/** Clear the application's TMP directory
 */
- (void)clearTmpDirectory;

/**
 *  Create a directory at path if it's not existing
 *
 *  @param path path of directory to check/create
 */
- (void)createDirectoryIfNotExistingForPath:(NSString *)path;

/**
 *  Delete all files saved in NSDocumentDirectory
 */
- (void)deleteAllFilesInDocumentDirectory;

/**
 *  Get and return all the documents stored sorte by creation date
 *
 *  @param URL			Path of the directory to sort
 *  @param ascending    Ascending / descending
 *
 *  @return A list the directory contents sort by the date creation
 */
- (NSArray *)contentOfDocumentURL:(NSURL *)URL sortByDateAscending:(BOOL)ascending;

@end
