//
//  UICollectionView+FSIExtension.m
//  FSI
//
//  Created by Tom Baranes on 31/08/15.
//  Copyright (c) 2016 Tom Baranes. All rights reserved.
//

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE

#import "UICollectionView+FSIExtension.h"

@implementation UICollectionView (FSIExtension)

- (CGFloat)spaceBetweenCellsToFitCollectionViewWidthInSection:(NSInteger)section {
	CGFloat cellWidth = ((UICollectionViewFlowLayout *)self.collectionViewLayout).itemSize.width;
	NSInteger cellCount = [self numberOfItemsInSection:section];
	
	CGFloat finalWidth = floorf(CGRectGetWidth([self bounds]));
	CGFloat inset = (finalWidth - cellCount * cellWidth) / (cellCount + 1);
	inset = MAX(inset, 0.0);
	return inset;
}

@end

#endif