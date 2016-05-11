//
//  RobWalkthroughPageViewController.h
//  App
//
//  Created by Robert Stein on 5/3/16.
//
//	This was going to be objcified swift code from ariok/BWWalkthrough but I stopped
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RobWalkthroughAnimationType) {
	RobWalkthroughAnimationTypeLinear,
	RobWalkthroughAnimationTypeCurve,
	RobWalkthroughAnimationTypeZoom,
	RobWalkthroughAnimationTypeInOut
};

@interface RobWalkthroughPageViewController : UIViewController

@property (nonatomic) RobWalkthroughAnimationType animationType;
@property (nonatomic, strong) NSString *staticTags; // A comma separated list of tags that you don't want to animate

@property (nonatomic) CGPoint speed;
@property (nonatomic) CGPoint speedVariance;
@property (nonatomic) BOOL animateAlpha;

@end
