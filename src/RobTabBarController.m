//
//  RobTabBarController.m
//  App
//
//  Created by Robert Stein on 4/27/16.
//
//

#import "RobTabBarController.h"
#import "RobBonusTableViewController.h"

@interface RobTabBarController () <UITabBarControllerDelegate>

@end

@implementation RobTabBarController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		RobBonusTableViewController *bonusVC0 = [[RobBonusTableViewController alloc] init];
		RobBonusTableViewController *bonusVC1 = [[RobBonusTableViewController alloc] init];
		RobBonusTableViewController *bonusVC2 = [[RobBonusTableViewController alloc] init];
		RobBonusTableViewController *bonusVC3 = [[RobBonusTableViewController alloc] init];
		RobBonusTableViewController *bonusVC4 = [[RobBonusTableViewController alloc] init];
		
		NSArray<UIViewController *> *viewControllers = @[bonusVC0, bonusVC1, bonusVC2, bonusVC3, bonusVC4];
		[self setViewControllers:viewControllers];
		[self setDelegate:self];
	}
	return self;
}

#pragma mark - UITabBarControllerDelegate

@end
