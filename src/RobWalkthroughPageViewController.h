//
//  RobWalkthroughPageViewController.h
//  App
//
//  Created by Robert Stein on 5/10/16.
//
//

#import <UIKit/UIKit.h>

@class RobWalkthroughPageViewController;

@protocol RobPageViewControllerDelegate <NSObject>

- (void)walkthroughPageViewController:(RobWalkthroughPageViewController *)pageViewController didUpdatePageCount:(NSInteger)count;
- (void)walkthroughPageViewController:(RobWalkthroughPageViewController *)pageViewController didUpdatePageIndex:(NSInteger)index;

@end

@interface RobWalkthroughPageViewController : UIPageViewController

@property (nonatomic, weak) id<RobPageViewControllerDelegate> walkthroughDelegate;

@end
