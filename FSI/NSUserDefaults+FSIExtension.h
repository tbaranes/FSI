//
//  NSUserDefaults+KFExtension.h
//  FSI
//
//  Created by Tom Baranes on 21/01/15.
//  Copyright (c) 2015 Recisio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (FSIExtension)

/** Remove all the applications key/value stored in the userDefaults
 */
- (void)resetUserDefaults;

@end
