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

@end