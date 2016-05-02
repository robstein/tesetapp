//
//  RobBonusItem.h
//  App
//
//  Created by Robert Stein on 4/29/16.
//
//

#import <Foundation/Foundation.h>

@interface RobBonusItem : NSObject

@property (nonatomic, readonly, strong) NSString *title;
@property (nonatomic, readonly, strong) NSString *provider;
@property (nonatomic, readonly) NSInteger pointValue;

- (instancetype)initWithTitle:(NSString *)title provider:(NSString *)provider pointValue:(NSInteger)pointValue;

@end
