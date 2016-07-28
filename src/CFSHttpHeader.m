//
//  CFSHttpHeader.m
//  App
//
//  Created by Robert Stein on 7/28/16.
//
//

#import "CFSHttpHeader.h"

@implementation CFSHttpHeader

+ (NSString *)userAgent {
	return @"User-Agent";
}

+ (NSString *)cookie {
	return @"Cookie";
}

+ (NSString *)setCookie {
	return @"Set-Cookie";
}

+ (NSString *)refresh {
	return @"Refresh";
}

@end
