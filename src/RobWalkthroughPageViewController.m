//
//  RobWalkthroughPageViewController.m
//  App
//
//  Created by Robert Stein on 5/10/16.
//
//

#import "RobWalkthroughPageViewController.h"

const NSInteger kRobWalkthroughPresentationCount = 4;

@interface RobWalkthroughPageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) NSArray<UIViewController *> *orderedViewControllers;
@property (nonatomic) NSInteger currentIndex;

@end

@implementation RobWalkthroughPageViewController

@synthesize orderedViewControllers = _orderedViewControllers;
@synthesize currentIndex = _currentIndex;

- (NSArray<UIViewController *> *)orderedViewControllers {
	if (_orderedViewControllers == nil) {
		_orderedViewControllers =  @[[self newViewControllerWithIdentifier:@"WalkthroughPage0"],
									 [self newViewControllerWithIdentifier:@"WalkthroughPage1"],
									 [self newViewControllerWithIdentifier:@"WalkthroughPage2"],
									 [self newViewControllerWithIdentifier:@"WalkthroughPage3"]];
	}
	return _orderedViewControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setDataSource:self];
	[self setDelegate:self];
	
	NSArray<UIViewController *> *orderedViewControllers = [self orderedViewControllers];
	UIViewController *firstViewController = [orderedViewControllers firstObject];
	if (firstViewController) {
		[self setViewControllers:@[firstViewController]
					   direction:UIPageViewControllerNavigationDirectionForward
						animated:YES
					  completion:nil];
	}
	
	if ([[self walkthroughDelegate] respondsToSelector:@selector(walkthroughPageViewController:didUpdatePageCount:)]) {
		[[self walkthroughDelegate] walkthroughPageViewController:self didUpdatePageCount:[orderedViewControllers count]];
	}
}

#pragma mark - UIPageViewControllerDataSource methods

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
	NSArray<UIViewController *> *orderedViewControllers = [self orderedViewControllers];
	NSInteger currentIndex = [orderedViewControllers indexOfObject:viewController];
	if (currentIndex == NSNotFound) {
		return nil;
	}
	
	NSInteger previousIndex = currentIndex - 1;
	if (previousIndex < 0) {
		return nil;
	}
	
	if (previousIndex + 1 >= [orderedViewControllers count]) { // check for off by one error here
		return nil;
	}
	
	return [orderedViewControllers objectAtIndex:previousIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
	NSArray<UIViewController *> *orderedViewControllers = [self orderedViewControllers];
	NSInteger currentIndex = [orderedViewControllers indexOfObject:viewController];
	if (currentIndex == NSNotFound) {
		return nil;
	}
	
	NSInteger nextIndex = currentIndex + 1;
	if (nextIndex >= [orderedViewControllers count]) {
		return nil;
	}
	
	return [orderedViewControllers objectAtIndex:nextIndex];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
	return kRobWalkthroughPresentationCount;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
	return 0;
}

#pragma mark - UIPageViewControllerDelegate methods

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {	
	UIViewController *firstViewController = [[self viewControllers] firstObject];
	if (firstViewController) {
		NSInteger index = [[self orderedViewControllers] indexOfObject:firstViewController];
		if ([[self walkthroughDelegate] respondsToSelector:@selector(walkthroughPageViewController:didUpdatePageIndex:)]) {
			[[self walkthroughDelegate] walkthroughPageViewController:self didUpdatePageIndex:index];
		}
	}
}

#pragma mark - Helper methods

- (UIViewController *)newViewControllerWithIdentifier:(NSString *)identifier {
	UIStoryboard *walkthroughStoryboard = [UIStoryboard storyboardWithName:@"Walkthrough"
																	bundle:[NSBundle mainBundle]];
	return [walkthroughStoryboard instantiateViewControllerWithIdentifier:identifier];
}

@end
