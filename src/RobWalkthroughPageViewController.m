//
//  RobWalkthroughPageViewController.m
//  App
//
//  Created by Robert Stein on 5/3/16.
//
//

#import "RobWalkthroughPageViewController.h"
#import "RobWalkthroughViewController.h"

@interface RobWalkthroughPageViewController () <RobWalkthroughPage>

@property (nonatomic, strong) NSMutableArray<NSValue *> *subsWeights;
@property (nonatomic, strong) NSArray<NSNumber *> *notAnimatableViews;

@end

@implementation RobWalkthroughPageViewController

@synthesize animationType = _animationType;
@synthesize speed = _speed;
@synthesize speedVariance = _speedVariance;
@synthesize animateAlpha = _animateAlpha;

@synthesize subsWeights = _subsWeights;
@synthesize notAnimatableViews = _notAnimatableViews;

- (void)setStaticTags:(NSString *)staticTags {
	NSArray<NSString *> *strArray = [staticTags componentsSeparatedByString:@","];
	NSMutableArray<NSNumber *> *numArray = [[NSMutableArray alloc] initWithCapacity:[strArray count]];
	int i = 0;
	for (NSString *str in strArray) {
		numArray[i] = [NSNumber numberWithInteger:[str integerValue]];
	}
	_notAnimatableViews = [numArray copy];
}

- (NSString *)staticTags {
	NSString *tags = @"";
	for (NSNumber *num in _notAnimatableViews) {
		tags = [tags stringByAppendingString:[NSString stringWithFormat:@"%@,", [num stringValue]]];
	}
	return [tags substringToIndex:[tags length]-1];
}


- (void)viewDidLoad {
	[super viewDidLoad];
	[[[self view] layer] setMasksToBounds:YES];
	
	_subsWeights = [[NSMutableArray alloc] init];
	NSArray<UIView *> *subviews = [[self view] subviews];
	for (UIView *view in subviews) {
		_speed.x += _speedVariance.x;
		_speed.y += _speedVariance.y;
		if (![_notAnimatableViews containsObject:[NSNumber numberWithInteger:[view tag]]]) {
			[[self subsWeights] addObject:[NSValue valueWithCGPoint:_speed]];
		}
	}
}

#pragma mark - RobWalkthroughPage protocol methods

- (void)walkthroughDidScroll:(CGFloat)position offset:(CGFloat)offset {
	for (NSInteger i = 0; i < _subsWeights.count; i++) {
		// Perform Transition/Scale/Rotate animations
		switch (_animationType) {
			case RobWalkthroughAnimationTypeLinear:
				[self animationLinear:i offset:offset];
			case RobWalkthroughAnimationTypeCurve:
				[self animationZoom:i offset:offset];
			case RobWalkthroughAnimationTypeZoom:
				[self animationCurve:i offset:offset];
			case RobWalkthroughAnimationTypeInOut:
				[self animationInOut:i offset:offset];
				break;
		}
		
		// Animate alpha
		if (_animateAlpha) {
			[self animationAlpha:i offset:offset];
		}
	}
}


#pragma mark - Animation helpers

- (void)animationAlpha:(NSInteger)index offset:(CGFloat)offset {
	UIView *cView = [[[self view] subviews] objectAtIndex:index];
	if (offset > 1.0) {
		offset = 1.0 + (1.0 - offset);
	}
	[cView setAlpha:offset];
}

- (void)animationCurve:(NSInteger)index offset:(CGFloat)offset {
	CGFloat x = (1.0 - offset) * 10;
	CATransform3D transform = CATransform3DTranslate(CATransform3DIdentity, (pow(x, 3) - (x * 25)) * [_subsWeights[index] CGPointValue].x, (pow(x,3) - (x * 20)) * [_subsWeights[index] CGPointValue].y, 0 );
	[self applyTransform:index transform:transform];
}

- (void)animationZoom:(NSInteger)index offset:(CGFloat)offset {
	if(offset > 1.0){
		offset = 1.0 + (1.0 - offset);
	}
	CGFloat scale = (1.0 - offset);
	CATransform3D transform = CATransform3DScale(CATransform3DIdentity, 1 - scale , 1 - scale, 1.0);
	[self applyTransform:index transform:transform];
}

- (void)animationLinear:(NSInteger)index offset:(CGFloat)offset {
	CGFloat mx = (1.0 - offset) * 100;
	CATransform3D transform = CATransform3DTranslate(CATransform3DIdentity, mx * [_subsWeights[index] CGPointValue].x, mx * [_subsWeights[index] CGPointValue].y, 0);
	[self applyTransform:index transform:transform];
}

- (void)animationInOut:(NSInteger)index offset:(CGFloat)offset {
	if(offset > 1.0){
		offset = 1.0 + (1.0 - offset);
	}
	CATransform3D transform = CATransform3DTranslate(CATransform3DIdentity, (1.0 - offset) * [_subsWeights[index] CGPointValue].x * 100, (1.0 - offset) * [_subsWeights[index] CGPointValue].y * 100, 0);
	[self applyTransform:index transform:transform];
}

- (void)applyTransform:(NSInteger)index transform:(CATransform3D)transform {
	UIView *subview = [[[self view] subviews] objectAtIndex:index];
	if (![_notAnimatableViews containsObject:[NSNumber numberWithInteger:[subview tag]]]) {
		[[subview layer] setTransform:transform];
	}
}

@end
