//
//  TTestTableViewCell.h
//  iTools
//
//  Created by admin on 2017/8/25.
//  Copyright © 2017年 admin. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "TBaseTableViewCell.h"
@class TTestModel;

@interface TTestTableViewCell : TBaseTableViewCell

- (void)reloadBaseTableViewCell:(TTestModel *)entity;

@end
