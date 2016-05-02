//
//  RobBonusModel.h
//  App
//
//  Created by Robert Stein on 4/29/16.
//
//

#import <Foundation/Foundation.h>

@class RobBonusItem;

@interface RobBonusModel : NSObject

@property (nonatomic, readonly, strong) NSArray<RobBonusItem *> *topItems;
@property (nonatomic, readonly, strong) NSArray<RobBonusItem *> *featuredItems;
@property (nonatomic, readonly, strong) NSArray<RobBonusItem *> *bonusItems;
@property (nonatomic, readonly, strong) NSArray<RobBonusItem *> *upAndComingItems;

+ (RobBonusModel *)mockModel;

- (instancetype)initWithTopItems:(NSArray<RobBonusItem *> *)topItems featuredItems:(NSArray<RobBonusItem *> *)featuredItems bonusItems:(NSArray<RobBonusItem *> *)bonusItems upAndComingItems:(NSArray<RobBonusItem *> *)upAndComingItems;

@end
