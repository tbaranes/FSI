//
// FSILogger.h
//
// Copyright (c) 2013 Tom Baranes
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
