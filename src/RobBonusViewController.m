//
//  RobBonusViewController.m
//  App
//
//  Created by Robert Stein on 4/28/16.
//
//

#import "RobBonusItem.h"
#import "RobBonusModel.h"
#import "RobBonusViewCell.h"
#import "RobBonusViewController.h"
#import "RobBonusFlowLayout.h"
#import "RobTypes.h"

static NSString *const kRobBonusViewCellReuseIdentifier = @"kRobBonusViewCellReuseIdentifier";
static NSString *const kRobBonusTabName = @"On Demand";
static const NSInteger kRobBonusViewNumberOfSections = 3;

const CGFloat kRobBonusViewCellWidth = 160.f;
const CGFloat kRobBonusViewCellHeight = 88.f;
const CGFloat kRobBonusMinimumLineSpacing = 8.f;
const CGFloat kRobBonusMinimumInteritemSpacing = 8.f;

@interface RobBonusViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) RobBonusModel *model;

@end

@implementation RobBonusViewController

@synthesize model = _model;

- (instancetype)init {
	RobBonusFlowLayout *layout = [[RobBonusFlowLayout alloc] init];
	if (self = [self initWithCollectionViewLayout:layout]) {
	}
	return self;
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
	if (self = [super initWithCollectionViewLayout:layout]) {
		[self commonInit];
	}
	return self;
}

- (void)commonInit {
	[self setTitle:kRobBonusTabName];
	[self setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0]];
	
	_model = [RobBonusModel mockModel];
}

- (void)loadView {
	[super loadView];
	
	UICollectionView *collectionView = [self collectionView];
	[collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[collectionView setDelegate:self];
	[collectionView setDataSource:self];
	[collectionView setBackgroundColor:[UIColor clearColor]];
	[collectionView registerClass:[RobBonusViewCell class] forCellWithReuseIdentifier:kRobBonusViewCellReuseIdentifier];
}

- (void)viewWillAppear:(BOOL)animated {
	[[self collectionView] reloadData];
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

#pragma mark - UICollectionViewDelegate methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	
}

#pragma mark - UICollectionViewDelegateFlowLayout methods

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return CGSizeMake(kRobBonusViewCellWidth, kRobBonusViewCellHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
	return UIEdgeInsetsMake(10., 10., 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
	return kRobBonusMinimumLineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
	return kRobBonusMinimumInteritemSpacing;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
	return CGSizeMake([[self collectionView] frame].size.width, 12.);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
	return CGSizeZero;
}

@end
