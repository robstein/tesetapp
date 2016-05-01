//
//  RobBonusViewDelegate.m
//  App
//
//  Created by Robert Stein on 4/28/16.
//
//

#import "RobBonusViewDelegate.h"

const CGFloat kRobBonusViewCellWidth = 186.f;
const CGFloat kRobBonusViewCellHeight = 40.f;
const CGFloat kRobBonusCellSpacing = 8.f;

@implementation RobBonusViewDelegate

#pragma mark - UICollectionViewDelegate methods

// animate the cell user tapped on
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

}

#pragma mark - UICollectionViewDelegateFlowLayout methods

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return CGSizeMake(kRobBonusViewCellWidth, kRobBonusViewCellHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
	return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
	return kRobBonusCellSpacing;
}

@end
