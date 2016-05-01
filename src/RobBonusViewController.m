//
//  RobBonusViewController.m
//  App
//
//  Created by Robert Stein on 4/28/16.
//
//

#import "RobBonusViewCell.h"
#import "RobBonusViewController.h"
#import "RobBonusViewDataSource.h"
#import "RobBonusViewDelegate.h"
#import "RobBonusFlowLayout.h"

static NSString *const kRobBonusTabName = @"On Demand";

@interface RobBonusViewController ()

@end

@implementation RobBonusViewController

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
}

- (void)loadView {
	[super loadView];
	
	RobBonusViewDelegate *delegate = [[RobBonusViewDelegate alloc] init];
	RobBonusViewDataSource *dataSource = [[RobBonusViewDataSource alloc] init];
	
	UICollectionView *collectionView = [self collectionView];
	[collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[collectionView setDelegate:delegate];
	[collectionView setDataSource:dataSource];
	[collectionView setBackgroundColor:[UIColor clearColor]];
	[collectionView registerClass:[RobBonusViewCell class] forCellWithReuseIdentifier:kRobBonusViewCellReuseIdentifier];
}

- (void)viewWillAppear:(BOOL)animated {
	[[self collectionView] reloadData];
}

@end
