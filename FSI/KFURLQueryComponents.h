//
//  KFURLQueryComponents.h
//  FSI
//
//  Created by Tom Baranes on 17/02/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XQueryComponents)

- (NSString *)stringByDecodingURLFormat;
- (NSString *)stringByEncodingURLFormat;
- (NSMutableDictionary *)dictionaryFromQueryComponents;

@end

@interface NSURL (XQueryComponents)

- (NSMutableDictionary *)queryComponents;

@end

@interface NSDictionary (XQueryComponents)

- (NSString *)stringFromQueryComponents;

@end