//
//  FSILogger.h
//  FSI
//
//  Created by Tom Baranes on 5/17/13.
//  Copyright (c) 2013 Tom Baranes. All rights reserved.
//

#import <UIKit/UIKit.h>

#define FSILogLevelError @"Error"
#define FSILogLevelWarning @"Warning"
#define FSILogLevelDebug @"Debug"

#if defined(Debug) || defined(DEBUG)

// Log with *Debug* level
	#define FSILogD(fmt,...) [FSILogger logLevel:FSILogLevelDebug file:__FILE__ lineNumber:__LINE__ format:(fmt),##__VA_ARGS__]

// Log with *Error* level
	#define FSILogE(fmt,...) [FSILogger logLevel:FSILogLevelError file:__FILE__ lineNumber:__LINE__ format:(fmt),##__VA_ARGS__]

// Log with *Warning* level
	#define FSILogW(fmt,...) [FSILogger logLevel:FSILogLevelError file:__FILE__ lineNumber:__LINE__ format:(fmt),##__VA_ARGS__]

// Legacy. Log with *Debug* level
	#define FSILog(fmt,...) [FSILogger logLevel:FSILogLevelDebug file:__FILE__ lineNumber:__LINE__ format:(fmt),##__VA_ARGS__]

#else
	#define FSILogD(...)
	#define FSILogE(...)
	#define FSILogW(...)
	#define FSILog(...)
#endif

@interface FSILogger : NSObject

+ (void)enableLog:(BOOL)logIsEnabled;
+ (void)enableLogToFile;
+ (void)resetFile;
+ (void)synchronizeLogFile;

+ (NSString *)logFilePath;

+ (void)logLevel:(NSString *)level file:(const char *)sourceFile lineNumber:(int)lineNumber format:(NSString *)format, ...;

@end
