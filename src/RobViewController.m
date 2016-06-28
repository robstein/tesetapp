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

	UIView *view = [self view];
	CGSize screenSize = [[UIScreen mainScreen] bounds].size;
	
	for (int i = 0; i < 10; i++) {
		CGFloat diameter = arc4random_uniform(51) + 50; // diameter between 50 and 100
		CGFloat x = arc4random_uniform(screenSize.width - diameter); // x between 0 and screen width minus diameter
		CGFloat y = arc4random_uniform(screenSize.height - diameter); // x between 0 and screen width minus diameter
		CGRect robViewFrame = CGRectMake(x, y, diameter, diameter);
		RobView *robView = [[RobView alloc] initWithFrame:robViewFrame];
		[robView setBackgroundColor:[UIColor clearColor]];
		[view addSubview:robView];
	}
}

@end
