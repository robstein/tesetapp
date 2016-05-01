//
//  RobBonusViewDataSource.h
//  App
//
//  Created by Robert Stein on 4/28/16.
//
//

#import <UIKit/UIKit.h>

@class RobBonusModel;

static NSString *const kRobBonusViewCellReuseIdentifier = @"kRobBonusViewCellReuseIdentifier";

@interface RobBonusViewDataSource : NSObject <UICollectionViewDataSource>

@property (nonatomic, strong) RobBonusModel *model;

@end
