//
//  RobViewController.m
//  App
//
//  Created by Robert Stein on 6/24/16.
//
//

#import "RobViewController.h"
#import "RobView.h"

@implementation RobViewController

- (void)loadView {
	[super loadView];

	RobView *robView = [[RobView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	UIView *view = [self view];
	[view addSubview:robView];
}

@end
