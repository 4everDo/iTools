//
//  TTestTableViewCell.h
//  iTools
//
//  Created by admin on 2017/8/25.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TBaseTableViewCell.h"
#import "TTestModel.h"

@interface TTestTableViewCell : TBaseTableViewCell

- (void)reloadBaseTableViewCell:(TTestModel *)entity;

@end
