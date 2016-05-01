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
	NSArray<RobBonusItem *> * topItems = @[
										   [[RobBonusItem alloc] initWithTitle:@"So Jeffery, $2" provider:@"Volkswagen" pointValue:3],
										   [[RobBonusItem alloc] initWithTitle:@"So Jeffery, $3" provider:@"Volkswagen 2" pointValue:4],
										   [[RobBonusItem alloc] initWithTitle:@"So Jeffery, $4" provider:@"Volkswagen 3" pointValue:5],
										   [[RobBonusItem alloc] initWithTitle:@"So Jeffery, $5" provider:@"Volkswagen 4" pointValue:6],
										   ];
	NSArray<RobBonusItem *> * featuredItems = @[
												[[RobBonusItem alloc] initWithTitle:@"" provider:@"Geico" pointValue:6],
												[[RobBonusItem alloc] initWithTitle:@"" provider:@"All State" pointValue:5],
												[[RobBonusItem alloc] initWithTitle:@"" provider:@"Progressive" pointValue:4],
												[[RobBonusItem alloc] initWithTitle:@"So Jeffery, $2" provider:@"Volkswagen" pointValue:3],
												];
	NSArray<RobBonusItem *> * bonusItems = @[
											 [[RobBonusItem alloc] initWithTitle:@"" provider:@"Capital One" pointValue:6],
											 [[RobBonusItem alloc] initWithTitle:@"" provider:@"Nike" pointValue:5],
											 [[RobBonusItem alloc] initWithTitle:@"" provider:@"At&T" pointValue:4],
											 [[RobBonusItem alloc] initWithTitle:@"So Jeffery, $2" provider:@"Volkswagen" pointValue:3],
											 ];
	NSArray<RobBonusItem *> * upAndComingItems = @[
												   [[RobBonusItem alloc] initWithTitle:@"So Jeffery, $2" provider:@"Volkswagen" pointValue:6],
												   [[RobBonusItem alloc] initWithTitle:@"So Jeffery, $2" provider:@"Volkswagen" pointValue:5],
												   [[RobBonusItem alloc] initWithTitle:@"So Jeffery, $2" provider:@"Volkswagen" pointValue:4],
												   [[RobBonusItem alloc] initWithTitle:@"So Jeffery, $2" provider:@"Volkswagen" pointValue:3],
												   ];
	return [[RobBonusModel alloc] initWithTopItems:topItems featuredItems:featuredItems bonusItems:bonusItems upAndComingItems:upAndComingItems];
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
