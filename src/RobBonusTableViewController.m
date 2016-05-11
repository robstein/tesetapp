//
//  RobBonusTableViewController.m
//  App
//
//  Created by Robert Stein on 5/2/16.
//
//

#import "RobBonusTableViewController.h"
#import "RobBonusTableViewCell.h"
#import "RobBonusModel.h"
#import "RobTypes.h"

static NSString *const kRobBonusTabName = @"On Demand";
static const NSInteger kRobBonusViewNumberOfSections = 3;
static NSString *const kRobBonusViewCellReuseIdentifier = @"kRobBonusViewCellReuseIdentifier";

@interface RobBonusTableViewController ()

@property (nonatomic, strong) RobBonusModel *model;

@end

@implementation RobBonusTableViewController

@synthesize model = _model;

- (instancetype)init {
	if (self = [self initWithStyle:UITableViewStyleGrouped]) {
	}
	return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
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
	
	UITableView *tableView = [self tableView];
	[tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[tableView setDelegate:self];
	[tableView setDataSource:self];
	[tableView setBackgroundColor:[UIColor clearColor]];
	[tableView registerClass:[RobBonusTableViewCell class] forCellReuseIdentifier:kRobBonusViewCellReuseIdentifier];
	[tableView setRowHeight:400.f];
	[tableView setSeparatorColor:[UIColor greenColor]];
	[tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
	[tableView setSectionHeaderHeight:20.f];
	[tableView setTableHeaderView:nil];
	[tableView setAllowsSelection:NO];

}

- (void)viewWillAppear:(BOOL)animated {
	[[self tableView] reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return kRobBonusViewNumberOfSections;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	RobBonusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kRobBonusViewCellReuseIdentifier forIndexPath:indexPath];
	
	RobBonusSection collectionSection = (RobBonusSection)[indexPath section];
	switch (collectionSection) {
		case RobBonusSectionFeatured:
			[cell setBonusItems:[[self model] featuredItems]];
			break;
		case RobBonusSectionBonus:
			[cell setBonusItems:[[self model] bonusItems]];
			break;
		case RobBonusSectionUpAndComing:
			[cell setBonusItems:[[self model] upAndComingItems]];
			break;
	}
	
	return cell;
}

#pragma mark - UITableViewDelegate

@end
