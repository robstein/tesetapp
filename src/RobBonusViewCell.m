//
//  RobBonusViewCell.m
//  App
//
//  Created by Robert Stein on 4/28/16.
//
//

#import "RobBonusViewCell.h"

/*static const CGFloat RobBonusViewWidth = 160.f;
static const CGFloat RobBonusViewHeight = 88.f;*/
static const CGFloat RobBonusViewMargin = 6.f;
static const CGFloat RobBonusViewIconSideLength = 24.f;

@interface RobBonusViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *actionIcon;
@property (nonatomic) BOOL didSetupConstraints;

@end

@implementation RobBonusViewCell

@synthesize titleLabel = _titleLabel;
@synthesize actionIcon = _actionIcon;

// Ensure view is redrawn after setting the title
- (void)setTitle:(NSString *)title {
	[[self titleLabel] setText:title];
	[self setNeedsUpdateConstraints];
}

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:CGRectZero]) {
		[self initializeSubviews];
		[self configureSubviews];
		[self addSubviewsToContentView];
		
		[self setBackgroundColor:[UIColor blueColor]];
	}
	return self;
}

- (void)initializeSubviews {
	_titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	_actionIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Circled_Play"]];
}

- (void)configureSubviews {
	[_titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_actionIcon setTranslatesAutoresizingMaskIntoConstraints:NO];
	
	[_titleLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]];
	
	[_titleLabel setTextColor:[UIColor whiteColor]];
	
	[_titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
	
	[_titleLabel setNumberOfLines:1];
}

- (void)addSubviewsToContentView {
	UIView *contentView = [self contentView];
	[contentView addSubview:_titleLabel];
	[contentView addSubview:_actionIcon];
}

- (BOOL)requiresConstraintBasedLayout {
	return YES;
}

/*- (CGSize)sizeThatFits:(CGSize)size {
	return CGSizeMake(RobBonusViewWidth, RobBonusViewHeight);
}*/

- (void)updateConstraints {
	[super updateConstraints];
	if (![self didSetupConstraints]) {
		
		if (_titleLabel != nil && _actionIcon != nil) {
			NSDictionary *subviews = NSDictionaryOfVariableBindings(_titleLabel, _actionIcon);
			NSNumber *margin = @(RobBonusViewMargin);
			NSNumber *iconSideLength = @(RobBonusViewIconSideLength);
			NSDictionary *metrics = NSDictionaryOfVariableBindings(margin, iconSideLength);
			NSArray<NSLayoutConstraint *> *constraints = [[NSArray alloc] init];
			
			constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_titleLabel]-margin-|" options:0 metrics:metrics views:subviews]];
			constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_actionIcon(iconSideLength)]-margin-|" options:0 metrics:metrics views:subviews]];
			constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[_titleLabel]" options:0 metrics:metrics views:subviews]];
			constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_actionIcon(iconSideLength)]-margin-|" options:0 metrics:metrics views:subviews]];

			[[self contentView] addConstraints:constraints];
		}
		
		_didSetupConstraints = YES;
	}
}

@end
