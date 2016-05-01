//
//  RobBonusItem.m
//  App
//
//  Created by Robert Stein on 4/29/16.
//
//

#import "RobBonusItem.h"

@implementation RobBonusItem

@synthesize title = _title;
@synthesize provider = _provider;
@synthesize pointValue = _pointValue;

- (instancetype)initWithTitle:(NSString *)title provider:(NSString *)provider pointValue:(NSInteger)pointValue {
	if (self = [super init]) {
		_title = title;
		_provider = provider;
		_pointValue = pointValue;
	}
	return self;
}

@end
