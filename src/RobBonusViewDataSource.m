//
//  RobBonusViewDataSource.m
//  App
//
//  Created by Robert Stein on 4/28/16.
//
//

#import "RobBonusItem.h"
#import "RobBonusViewDataSource.h"
#import "RobBonusViewCell.h"
#import "RobBonusModel.h"
#import "RobTypes.h"

NSInteger const kRobBonusViewNumberOfSections = 3;

@implementation RobBonusViewDataSource

@synthesize model = _model;

- (instancetype)init {
	if (self = [super init]) {
		_model = [RobBonusModel mockModel];
	}
	return self;
}

#pragma mark - UICollectionViewDataSource methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return kRobBonusViewNumberOfSections;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	RobBonusSection collectionSection = (RobBonusSection)section;
	switch (collectionSection) {
		case RobBonusSectionFeatured:
			return [[[self model] featuredItems] count];
		case RobBonusSectionBonus:
			return [[[self model] bonusItems] count];
		case RobBonusSectionUpAndComing:
			return [[[self model] upAndComingItems] count];
	}
}

- (RobBonusViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	RobBonusViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kRobBonusViewCellReuseIdentifier forIndexPath:indexPath];
	RobBonusItem *item = nil;
	RobBonusSection collectionSection = (RobBonusSection)[indexPath section];
	NSInteger row = [indexPath item];
	switch (collectionSection) {
		case RobBonusSectionFeatured:
			item = [[[self model] featuredItems] objectAtIndex:row];
			[cell setTitle:[item title]];
			break;
		case RobBonusSectionBonus:
			item = [[[self model] bonusItems] objectAtIndex:row];
			[cell setTitle:[item title]];
			break;
		case RobBonusSectionUpAndComing:
			item = [[[self model] upAndComingItems] objectAtIndex:row];
			[cell setTitle:[item title]];
			break;
	}
	return cell;
}

@end
