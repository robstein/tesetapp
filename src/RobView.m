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
	CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
	CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
	CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
	UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(ctx, [color CGColor]);
	CGContextFillEllipseInRect(ctx, rect);
}

+ (BOOL)requiresConstraintBasedLayout {
	return NO;
}

- (CGSize)sizeThatFits:(CGSize)size {
	return CGSizeMake(30, 30);
}

@end
