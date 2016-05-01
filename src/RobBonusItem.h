//
//  RobBonusItem.h
//  App
//
//  Created by Robert Stein on 4/29/16.
//
//

#import <Foundation/Foundation.h>

@interface RobBonusItem : NSObject

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *provider;
@property (nonatomic, readonly, assign) NSInteger *pointValue;

- (instancetype)initWithTitle:(NSString *)title provider:(NSString *)provider pointValue:(NSInteger *)pointValue;

@end
