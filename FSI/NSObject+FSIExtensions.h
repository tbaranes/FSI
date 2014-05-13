//
//  NSObject+FSIExtensions.h
//  FSI
//
//  Created by Tom Baranes on 6/1/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A delightful NSObject category
 */
@interface NSObject (FSIExtensions)

/** Create an object from a class
 @param aClass class to create
 @param nibName the name of nib, if a nib is linked
 @returns a NSDateFormatter with a basic date style
 */
+ (id)createObjectOfClass:(Class)aClass fromNibNamed:(NSString *)nibName;

@end
