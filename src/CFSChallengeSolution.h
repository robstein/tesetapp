//
//  CFSChallengeSolution.h
//  App
//
//  Created by Robert Stein on 7/28/16.
//
//

#import <Foundation/Foundation.h>

@interface CFSChallengeSolution : NSObject

@property (nonatomic, copy, readonly) NSString *clearancePage;
@property (nonatomic, copy, readonly) NSString *verificationCode;
@property (nonatomic, copy, readonly) NSString *pass;
@property (nonatomic, readonly) NSInteger answer;

- (instancetype)initWithClearancePage:(NSString *)clearancePage verificationCode:(NSString *)verificationCode pass:(NSString *)pass answer:(NSInteger)answer;

- (NSString *)clearanceQuery;

@end
