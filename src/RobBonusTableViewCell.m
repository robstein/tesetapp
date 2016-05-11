//
//  RobBonusTableViewCell.m
//  App
//
//  Created by Robert Stein on 5/2/16.
//
//  TODO: this view
//

#import "RobBonusTableViewCell.h"
#import "RobBonusViewCell.h"
#import "RobBonusItem.h"
#import "RobBonusFlowLayout.h"

static NSString *const kRobBonusCollectionViewCellReuseIdentifier = @"kRobBonusCollectionViewCellReuseIdentifier";
const CGFloat kRobBonusViewCellWidth = 160.f;
const CGFloat kRobBonusViewCellHeight = 88.f;
const CGFloat kRobBonusMinimumLineSpacing = 8.f;
const CGFloat kRobBonusMinimumInteritemSpacing = 8.f;

@interface RobBonusTableViewCell () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic) BOOL didSetupConstraints;

@end

@implementation RobBonusTableViewCell

@synthesize bonusItems = _bonusItems;
@synthesize collectionView = _collectionView;
@synthesize didSetupConstraints = _didSetupConstraints;

- (void)setBonusItems:(NSArray<RobBonusItem *> *)bonusItems {
	_bonusItems = bonusItems;
	[[self collectionView] reloadData];
	[self setNeedsUpdateConstraints];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		[self initializeSubviews];
		[self configureSubviews];
		[self addSubviewsToContentView];
		
		[self setBackgroundColor:[UIColor grayColor]];
	}
	return self;
}

- (void)initializeSubviews {
	_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[RobBonusFlowLayout alloc] init]];
}

- (void)configureSubviews {
	[_collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
	
	[_collectionView setDelegate:self];
	
	[_collectionView setDataSource:self];
	
	[_collectionView registerClass:[RobBonusViewCell class] forCellWithReuseIdentifier:kRobBonusCollectionViewCellReuseIdentifier];
	
	[_collectionView setBackgroundColor:[UIColor clearColor]];
}

- (void)addSubviewsToContentView {
	UIView *contentView = [self contentView];
	[contentView addSubview:_collectionView];
}

- (BOOL)requiresConstraintBasedLayout {
	return YES;
}

- (void)updateConstraints {
	[super updateConstraints];
	if (![self didSetupConstraints]) {
		
		if (_collectionView != nil) {
			NSDictionary *subviews = NSDictionaryOfVariableBindings(_collectionView);
			NSArray<NSLayoutConstraint *> *constraints = [[NSArray alloc] init];
			constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_collectionView]|" options:0 metrics:nil views:subviews]];
			constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_collectionView]|" options:0 metrics:nil views:subviews]];
			[[self contentView] addConstraints:constraints];
		}
		
		_didSetupConstraints = YES;
	}
}

#pragma mark - UICollectionViewDataSource methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return [[self bonusItems] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	RobBonusViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kRobBonusCollectionViewCellReuseIdentifier forIndexPath:indexPath];
	NSInteger row = [indexPath item];
	RobBonusItem *bonusItem = [[self bonusItems] objectAtIndex:row];
	NSString *title = [bonusItem title];
	[cell setTitle:title];
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
