//
//  RobAppDelegate.m
//  App
//
//  Created by Robert Stein on 4/4/16.
//  Copyright © 2016 Rob Stein. All rights reserved.
//

#import "RobAppDelegate.h"
#import "RobTabBarController.h"

@interface RobAppDelegate () <NSURLSessionDelegate>

@end

@implementation RobAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	UIViewController *rootViewController = [[RobTabBarController alloc] init];
	
	UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[window setRootViewController:rootViewController];
	[window setBackgroundColor:[UIColor whiteColor]];
	[window makeKeyAndVisible];
	[self setWindow:window];
	return YES;
}

@end
