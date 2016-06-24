//
//  RobView.m
//  App
//
//  Created by Robert Stein on 6/24/16.
//
//

#import "RobView.h"

@implementation RobView

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		
	}
	return self;
}

- (void)drawRect:(CGRect)rect {
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextAddEllipseInRect(ctx, rect);
	CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor blueColor] CGColor]));
	CGContextFillPath(ctx);
}

+ (BOOL)requiresConstraintBasedLayout {
	return NO;
}

- (CGSize)sizeThatFits:(CGSize)size {
	return CGSizeMake(30, 30);
}

@end
