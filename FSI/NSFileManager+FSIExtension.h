//
//  NSFileManager+FSIExtension.h
//  FSI
//
//  Created by Tom Baranes on 19/01/15.
//  Copyright (c) 2015 Recisio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (FSIExtension)

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
