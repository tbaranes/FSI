//
// FSIHelper.m
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

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>
#endif

#include <sys/types.h>
#include <sys/sysctl.h>

#import "FSIDeviceHelper.h"

@implementation FSIDeviceHelper

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
+ (NSString *)getDeviceVersion {
	return [[UIDevice currentDevice] systemVersion];
}
#endif

+ (NSString *)getApplicationVersion {
	return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

#pragma mark - Device type

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)

+ (NSString *)getDeviceType {
	size_t size;
	sysctlbyname("hw.machine", NULL, &size, NULL, 0);
	char *model = malloc(size);
	sysctlbyname("hw.machine", model, &size, NULL, 0);
	NSString *sDeviceModel = [NSString stringWithCString:model encoding:NSUTF8StringEncoding];
	free(model);
	if ([sDeviceModel isEqual:@"i386"])      return @"Simulator";  //iPhone Simulator
	if ([sDeviceModel isEqual:@"iPhone1,1"]) return @"iPhone1G";   //iPhone 1G
	if ([sDeviceModel isEqual:@"iPhone1,2"]) return @"iPhone3G";   //iPhone 3G
	if ([sDeviceModel isEqual:@"iPhone2,1"]) return @"iPhone3GS";  //iPhone 3GS
	if ([sDeviceModel isEqual:@"iPhone3,1"]) return @"iPhone4 AT&T";  //iPhone 4 - AT&T
	if ([sDeviceModel isEqual:@"iPhone3,2"]) return @"iPhone4 Other";  //iPhone 4 - Other carrier
	if ([sDeviceModel isEqual:@"iPhone3,3"]) return @"iPhone4";    //iPhone 4 - Other carrier
	if ([sDeviceModel isEqual:@"iPhone4,1"]) return @"iPhone4S";   //iPhone 4S
	if ([sDeviceModel isEqual:@"iPhone5,1"]) return @"iPhone5";    //iPhone 5 (GSM)
	if ([sDeviceModel isEqual:@"iPod1,1"])   return @"iPod1stGen"; //iPod Touch 1G
	if ([sDeviceModel isEqual:@"iPod2,1"])   return @"iPod2ndGen"; //iPod Touch 2G
	if ([sDeviceModel isEqual:@"iPod3,1"])   return @"iPod3rdGen"; //iPod Touch 3G
	if ([sDeviceModel isEqual:@"iPod4,1"])   return @"iPod4thGen"; //iPod Touch 4G
	if ([sDeviceModel isEqual:@"iPad1,1"])   return @"iPadWiFi";   //iPad Wifi
	if ([sDeviceModel isEqual:@"iPad1,2"])   return @"iPad3G";     //iPad 3G
	if ([sDeviceModel isEqual:@"iPad2,1"])   return @"iPad2";      //iPad 2 (WiFi)
	if ([sDeviceModel isEqual:@"iPad2,2"])   return @"iPad2";      //iPad 2 (GSM)
	if ([sDeviceModel isEqual:@"iPad2,3"])   return @"iPad2";      //iPad 2 (CDMA)
	
	NSString *aux = [[sDeviceModel componentsSeparatedByString:@","] objectAtIndex:0];
	
	//If a newer version exist
	if ([aux rangeOfString:@"iPhone"].location!=NSNotFound) {
		int version = [[aux stringByReplacingOccurrencesOfString:@"iPhone" withString:@""] intValue];
		if (version == 3) return @"iPhone4";
			if (version >= 4) return @"iPhone4s";
		
	}
	if ([aux rangeOfString:@"iPod"].location!=NSNotFound) {
		int version = [[aux stringByReplacingOccurrencesOfString:@"iPod" withString:@""] intValue];
		if (version >=4) return @"iPod4thGen";
	}
	if ([aux rangeOfString:@"iPad"].location!=NSNotFound) {
		int version = [[aux stringByReplacingOccurrencesOfString:@"iPad" withString:@""] intValue];
		if (version ==1) return @"iPad3G";
		if (version >=2) return @"iPad2";
	}
	//If none was found, send the original string
	return sDeviceModel;
}

#endif
@end