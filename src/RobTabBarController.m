//
//  RobTabBarController.m
//  App
//
//  Created by Robert Stein on 4/27/16.
//
//

#import "RobTabBarController.h"
#import "RobBonusViewController.h"

@interface RobTabBarController () <UITabBarControllerDelegate>

@end

@implementation RobTabBarController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		RobBonusViewController *bonusVC0 = [[RobBonusViewController alloc] init];
		RobBonusViewController *bonusVC1 = [[RobBonusViewController alloc] init];
		RobBonusViewController *bonusVC2 = [[RobBonusViewController alloc] init];
		RobBonusViewController *bonusVC3 = [[RobBonusViewController alloc] init];
		RobBonusViewController *bonusVC4 = [[RobBonusViewController alloc] init];
		
		NSArray<UIViewController *> *viewControllers = @[bonusVC0, bonusVC1, bonusVC2, bonusVC3, bonusVC4];
		[self setViewControllers:viewControllers];
		[self setDelegate:self];
	}
	return self;
}

#pragma mark - UITabBarControllerDelegate

@end
