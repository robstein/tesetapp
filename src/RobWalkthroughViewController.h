//
//  RobWalkthroughViewController.h
//  App
//
//  Created by Robert Stein on 5/3/16.
//
//

#import <UIKit/UIKit.h>

@protocol RobWalkthroughViewControllerDelegate <NSObject>

- (void)walkthroughCloseButtonPressed;
- (void)walkthroughNextButtonPressed;
- (void)walkthroughPrevButtonPressed;
- (void)walkthroughPageDidChange:(NSInteger)pageNumber;

@end

@protocol RobWalkthroughPage <NSObject>

- (void)walkthroughDidScroll:(CGFloat)position offset:(CGFloat)offset;

@end

@interface RobWalkthroughViewController : UIViewController

@property (nonatomic, weak) id<RobWalkthroughViewControllerDelegate> delegate;

@end
