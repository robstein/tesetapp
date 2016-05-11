//
//  RobBonusFlowLayout.m
//  App
//
//  Created by Robert Stein on 4/28/16.
//
//

#import "RobBonusFlowLayout.h"

@implementation RobBonusFlowLayout

- (instancetype)init {
	if (self = [super init]) {
		[self setScrollDirection:UICollectionViewScrollDirectionHorizontal];
		[self setItemSize:CGSizeMake(320, 548)];
	}
	return self;
}

@end
