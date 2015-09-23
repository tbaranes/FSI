//
// FSI.h
//
// Copyright (c) 2014 Tom Baranes
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

#import <Foundation/Foundation.h>

#ifdef __OBJC__

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
	#if !TARGET_OS_TV
		#import "UIImage+FSIExtensions.h"
		#import "UITextField+FSIExtensions.h"
		#import "UIAlertView+FSIExtensions.h"
		#import "UIButton+FSIExtensions.h"
		#import "UIView+FSIExtensions.h"
		#import "UIView+Borders.h"
		#import "UIScrollView+FSIExtensions.h"
		#import "UILabel+FSIExtensions.h"
		#import "UILabel+FSITextFormatted.h"
		#import "UIDevice+FSIExtension.h"
		#import "UIApplication+FSIExtensions.h"
		#import "UIScreen+FSIExtention.h"
	#endif

	#import "FSILogger.h"
	#import "NSObject+FSIExtensions.h"
	#import "UIColor+FSIExtensions.h"
	#import "UIImage+ImageEffects.h"
	#import "FSIDeviceHelper.h"
	#import "UIViewController+FSI.h"
	#import "UICollectionView+FSIExtension.h"

#else
	#import "NSView+FSIExtension.h"
	#import "NSImage+FSIExtension.h"
	#import "NSPopover+FSIMessage.h"
#endif

#import "NSString+FSIExtensions.h"
#import "NSNumberFormatter+FSIExtensions.h"
#import "NSDateFormatter+FSIExtensions.h"
#import "NSArray+FSIExtensions.h"
#import "NSString+Levenshtein.h"
#import "NSUserDefaults+FSIExtension.h"
#import "NSFileManager+FSIExtension.h"
#import "NSData+AESCrypt.h"
#import "NSNotificationCenter+FSIExtension.h"

#endif
