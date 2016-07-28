//
//  CFSChallengeSolution.m
//  App
//
//  Created by Robert Stein on 7/28/16.
//
//

#import "CFSChallengeSolution.h"

@implementation CFSChallengeSolution

@synthesize clearancePage = _clearancePage;
@synthesize verificationCode = _verificationCode;
@synthesize pass = _pass;
@synthesize answer = _answer;

- (instancetype)initWithClearancePage:(NSString *)clearancePage verificationCode:(NSString *)verificationCode pass:(NSString *)pass answer:(NSInteger)answer {
	if (self = [super init]) {
		_clearancePage = clearancePage;
		_verificationCode = verificationCode;
		_pass = pass;
		_answer = answer;
	}
	return self;
}

- (NSString *)clearanceQuery {
	return [NSString stringWithFormat:@"%@?jschl_vc=%@&pass=%@&jschl_answer=%ld", _clearancePage, _verificationCode, _pass, _answer];
}

- (BOOL)isEqual:(id)object {
	if (self == object) {
		return YES;
	}
	
	if (![object isKindOfClass:[CFSChallengeSolution class]]) {
		return NO;
	}
	
	return [[object clearanceQuery] isEqual:[self clearanceQuery]];
}

// finish me
+ (NSUInteger)hash {
	return [[self clearanceQuery] hash];
}

@end
