//
//  UICollectionView+FSIExtension.h
//  FSI
//
//  Created by Tom Baranes on 31/08/15.
//  Copyright (c) 2016 Tom Baranes. All rights reserved.
//

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE

#import <UIKit/UIKit.h>

@interface UICollectionView (FSIExtension)

- (CGFloat)spaceBetweenCellsToFitCollectionViewWidthInSection:(NSInteger)section;

@end

#endif