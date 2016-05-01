//
//  RobBonusViewCell.m
//  App
//
//  Created by Robert Stein on 4/28/16.
//
//

#import "RobBonusViewCell.h"

@implementation RobBonusViewCell

@synthesize title = _title;

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:CGRectZero]) {
	}
	return self;
}

- (BOOL)requiresConstraintBasedLayout {
	return YES;
}

@end
