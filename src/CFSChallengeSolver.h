//
//  CFSChallengeSolver.h
//  App
//
//  Created by Robert Stein on 7/28/16.
//
//

#import <Foundation/Foundation.h>

@class CFSChallengeSolution;

@interface CFSChallengeSolver : NSObject

+ (CFSChallengeSolution *)solveWithChallengePageContent:(NSString *)challengePageContent targetHost:(NSString *)targetHost;

@end
