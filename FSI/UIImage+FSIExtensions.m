//
// UIImage+FSI.m
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

#import "UIImage+FSIExtensions.h"

@implementation UIImage (FSIExtensions)

#pragma mark - Screenshot

+ (UIImage *)screenshot {
	UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
	CGRect rect = [keyWindow bounds];
	UIGraphicsBeginImageContextWithOptions(rect.size,YES,0.0f);
	[keyWindow drawViewHierarchyInRect:rect afterScreenUpdates:YES];
	UIImage *capturedScreen = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return capturedScreen;
}

+ (UIImage *)screenshotOfView:(UIView *)viewToCapture {
	UIGraphicsBeginImageContextWithOptions(viewToCapture.bounds.size, NO, [UIScreen mainScreen].scale);
	[viewToCapture drawViewHierarchyInRect:viewToCapture.bounds afterScreenUpdates:YES];
	UIImage *capturedView = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return capturedView;
}

#pragma mark - Color

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - Blur effect

//- (UIImage *)blurImageWithBlur:(CGFloat)blur {
//	if (blur < 0.f || blur > 1.f) {
//		blur = 0.5f;
//	}
//	
//	int boxSize = (int)(blur * 50);
//	boxSize = boxSize - (boxSize % 2) + 1;
//	
//	CGImageRef img = self.CGImage;
//	vImage_Buffer inBuffer, outBuffer;
//	vImage_Error error;
//	void *pixelBuffer;
//	CGDataProviderRef inProvider = CGImageGetDataProvider(img);
//	CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
//	
//	inBuffer.width = CGImageGetWidth(img);
//	inBuffer.height = CGImageGetHeight(img);
//	inBuffer.rowBytes = CGImageGetBytesPerRow(img);
//	inBuffer.data = (void *)CFDataGetBytePtr(inBitmapData);
//	pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
//	if (pixelBuffer == NULL) {
//		NSLog(@"No pixelbuffer");
//	}
//	
//	outBuffer.data = pixelBuffer;
//	outBuffer.width = CGImageGetWidth(img);
//	outBuffer.height = CGImageGetHeight(img);
//	outBuffer.rowBytes = CGImageGetBytesPerRow(img);
//	
//	error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
//	if (error) {
//		NSLog(@"JFDepthView: error from convolution %ld", error);
//	}
//	
//	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//	CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
//											 outBuffer.width,
//											 outBuffer.height,
//											 8,
//											 outBuffer.rowBytes,
//											 colorSpace,
//											 (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
//	CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
//	UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
//	
//	CGContextRelease(ctx);
//	CGColorSpaceRelease(colorSpace);
//	free(pixelBuffer);
//	CFRelease(inBitmapData);
//	CGImageRelease(imageRef);
//	return returnImage;
//}

@end
