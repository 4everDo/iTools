//
//  TBaseTableViewCell.h
//  iTools
//
//  Created by admin on 2017/8/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBaseModel.h"


@interface TBaseTableViewCell : UITableViewCell

@property (nonatomic,assign) BOOL  isHaveLine;

- (CGFloat)layoutHeightWithEntity:(TBaseModel *)entity;

@end
