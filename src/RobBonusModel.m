//
//  RobBonusModel.m
//  App
//
//  Created by Robert Stein on 4/29/16.
//
//

#import "RobBonusModel.h"
#import "RobBonusItem.h"

@implementation RobBonusModel

@synthesize topItems = _topItems;
@synthesize featuredItems = _featuredItems;
@synthesize bonusItems = _bonusItems;
@synthesize upAndComingItems = _upAndComingItems;

+ (RobBonusModel *)mockModel {
	return nil;
}

- (instancetype)initWithTopItems:(NSArray<RobBonusItem *> *)topItems featuredItems:(NSArray<RobBonusItem *> *)featuredItems bonusItems:(NSArray<RobBonusItem *> *)bonusItems upAndComingItems:(NSArray<RobBonusItem *> *)upAndComingItems {
	if (self = [super init]) {
		_topItems = topItems;
		_featuredItems = featuredItems;
		_bonusItems = bonusItems;
		_upAndComingItems = upAndComingItems;
	}
	return self;
}

@end
