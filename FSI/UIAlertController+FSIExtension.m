//
//  UIAlertController+FSIExtension.m
//  FSI
//
//  Created by Tom Baranes on 17/02/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE

#import "UIAlertController+FSIExtension.h"

@implementation UIAlertController (FSIExtension)

+ (void)showAlertControllerWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

@end

#endif