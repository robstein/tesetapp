//
//  RobAppDelegate.m
//  App
//
//  Created by Robert Stein on 4/4/16.
//  Copyright © 2016 Rob Stein. All rights reserved.
//

#import "RobAppDelegate.h"
#import "RobViewController.h"
#import "RobTestObject.h"

@interface RobAppDelegate () <NSURLSessionDelegate>

@end

@implementation RobAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	//[self doTestThing];
	[self makeRequest];
	
	UIViewController *initialViewController = [[RobViewController alloc] init];
	
	UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[window setRootViewController:initialViewController];
	[window setBackgroundColor:[UIColor whiteColor]];
	[window makeKeyAndVisible];
	[self setWindow:window];
	return YES;
}

- (void)doTestThing {
	[RobTestObject doInterviewQuestion];
}

- (void)makeRequest {
	
}

@end
