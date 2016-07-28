//
//  CFSHttpHeader.h
//  App
//
//  Created by Robert Stein on 7/28/16.
//
//

#import <Foundation/Foundation.h>

@interface CFSHttpHeader : NSObject

+ (NSString *)userAgent;
+ (NSString *)cookie;
+ (NSString *)setCookie;
+ (NSString *)refresh;

@end
