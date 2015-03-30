//
// FSILogger.m
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
//
// Deeply inspired by: http://www.borkware.com/rants/agentm/mlog/

#import "FSILogger.h"

static BOOL __logIsEnabled = NO;
static BOOL shouldWriteToFile = NO;
static NSFileHandle *logFileHandle = nil;

@implementation FSILogger

#pragma mark - Logs

+ (void)enableLog:(BOOL)logIsEnabled
{
	__logIsEnabled = logIsEnabled;
}

#pragma mark - Getter LogFile

+ (NSString *)logFilePath
{
	NSString *result = nil;
	
	NSArray *dirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	if (dirs.count > 0)
		result = [NSString stringWithFormat:@"%@/%@", [dirs objectAtIndex:0], @"FSILog.txt"];
	return result;
}

#pragma mark - Manage LogFile

+ (void)enableLogToFile
{
	shouldWriteToFile = YES;
	NSString *logFileName = [self logFilePath];
	if (![[NSFileManager defaultManager] fileExistsAtPath:logFileName])
	{
		[[NSFileManager defaultManager] createFileAtPath:logFileName contents:nil attributes:nil];

		logFileHandle = [NSFileHandle fileHandleForUpdatingAtPath:logFileName];
		[logFileHandle seekToEndOfFile];
		
		NSMutableString *header = [[NSMutableString alloc] init];
		[header appendString:@"\n\n==============================\n"];
		[header appendFormat:@"= New session - Start date: %@\n", [NSDate date]];
		
#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
		[header appendFormat:@"= Device: MODEL %@ - iOS %@\n", [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion]];
#else
		[header appendFormat:@"= OSX %@\n", [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"]];
#endif
		
		[header appendFormat:@"= Application: DISPLAY NAME %@ - ID %@ - VERSION %@\n",
		 [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"],
		 [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"],
		 [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]];
		[header appendString:@"==============================\n\n"];
		[header appendString:@"==============================\n\n"];
		
		[logFileHandle writeData:[header dataUsingEncoding:NSUTF8StringEncoding]];
	}
}

+ (void)resetFile
{
	NSString *logFileName = [self logFilePath];	
	[[NSFileManager defaultManager] removeItemAtPath:logFileName error:nil];
	[[NSFileManager defaultManager] createFileAtPath:logFileName contents:nil attributes:nil];
}

+ (void) synchronizeLogFile
{
	[logFileHandle synchronizeFile];
}

# pragma mark - Manage Logs

+ (void)logLevel:(NSString *)level file:(const char *)sourceFile lineNumber:(int)lineNumber format:(NSString *)format, ...
{
	if (!__logIsEnabled)
		return;

	NSString *file = [[NSString alloc] initWithBytes:sourceFile length:strlen(sourceFile) encoding:NSUTF8StringEncoding];
	NSString *fileName = [file lastPathComponent];
	
	NSString *print = nil;
	va_list ap;
	va_start(ap, format);
	print = [[NSString alloc] initWithFormat:format arguments:ap];
	va_end(ap);

	NSString *logString = [NSString stringWithFormat:@"[FSILogger][%@] %@:%d %@", level, fileName, lineNumber, print];
	NSLog(@"%@", logString);

	if (shouldWriteToFile)
		[logFileHandle writeData:[[NSString stringWithFormat:@"%@\n", logString] dataUsingEncoding:NSUTF8StringEncoding]];
}

@end
