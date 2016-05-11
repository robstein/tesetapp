//
//  RobWalkthroughViewController.m
//  App
//
//  Created by Robert Stein on 5/11/16.
//
//

#import "RobWalkthroughViewController.h"
#import "RobWalkthroughPageViewController.h"

@interface RobWalkthroughViewController () <RobPageViewControllerDelegate>

@end

@implementation RobWalkthroughViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	RobWalkthroughPageViewController *walkthroughPageViewController = (RobWalkthroughPageViewController *)[segue destinationViewController];
	[walkthroughPageViewController setWalkthroughDelegate:self];
}

#pragma mark - RobPageViewControllerDelegate methods

- (void)walkthroughPageViewController:(RobWalkthroughPageViewController *)pageViewController didUpdatePageCount:(NSInteger)count {
	[[self pageControl] setNumberOfPages:count];
}

- (void)walkthroughPageViewController:(RobWalkthroughPageViewController *)pageViewController didUpdatePageIndex:(NSInteger)index {
	[[self pageControl] setCurrentPage:index];
}

@end
