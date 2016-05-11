//
//  RobBonusTableViewCell.h
//  App
//
//  Created by Robert Stein on 5/2/16.
//
//

#import <UIKit/UIKit.h>
@class RobBonusItem;

@interface RobBonusTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray<RobBonusItem *> *bonusItems;

@end
