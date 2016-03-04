//
//  KFURLQueryComponents
//  FSI
//
//  Created by Tom Baranes on 17/02/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#import "KFURLQueryComponents.h"

@implementation NSString (XQueryComponents)

- (NSString *)stringByDecodingURLFormat {
    NSString *result = [self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}

- (NSString *)stringByEncodingURLFormat {
    NSString *result = [self stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}

- (NSMutableDictionary *)dictionaryFromQueryComponents {
    NSMutableDictionary *queryComponents = [NSMutableDictionary dictionary];
    for (NSString *keyValuePairString in [self componentsSeparatedByString:@"&"]) {
        NSArray *keyValuePairArray = [keyValuePairString componentsSeparatedByString:@"="];
        if ([keyValuePairArray count] < 2) continue; // Verify that there is at least one key, and at least one value.  Ignore extra = signs
        NSString *key = [[keyValuePairArray objectAtIndex:0] stringByDecodingURLFormat];
        NSString *value = [[keyValuePairArray objectAtIndex:1] stringByDecodingURLFormat];
        NSMutableArray *results = [queryComponents objectForKey:key]; // URL spec says that multiple values are allowed per key
        if(!results) { // First object
            results = [NSMutableArray arrayWithCapacity:1];
            [queryComponents setObject:results forKey:key];
        }
        [results addObject:value];
    }
    return queryComponents;
}

@end

@implementation NSURL (XQueryComponents)

- (NSMutableDictionary *)queryComponents {
    return [[self query] dictionaryFromQueryComponents];
}

@end

@implementation NSDictionary (XQueryComponents)

- (NSString *)stringFromQueryComponents {
    NSString *result = nil;
    for (__strong NSString *key in [self allKeys]) {
        key = [key stringByEncodingURLFormat];
        NSArray *allValues = [self objectForKey:key];
        if ([allValues isKindOfClass:[NSArray class]]) {
            for(__strong NSString *value in allValues) {
                value = [[value description] stringByEncodingURLFormat];
                if (!result) {
                    result = [NSString stringWithFormat:@"%@=%@",key,value];
                } else {
                    result = [result stringByAppendingFormat:@"&%@=%@",key,value];
                }
            }
        } else {
            NSString *value = [[allValues description] stringByEncodingURLFormat];
            if(!result)
                result = [NSString stringWithFormat:@"%@=%@",key,value];
            else
                result = [result stringByAppendingFormat:@"&%@=%@",key,value];
        }
    }
    return result;
}

@end