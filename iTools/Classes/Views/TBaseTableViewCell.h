//
//  TBaseTableViewCell.h
//  iTools
//
//  Created by admin on 2017/8/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBaseModel.h"

typedef struct HorizontalEdgeInsets {
    CGFloat left,right;
} HorizontalEdgeInsets;


@interface TBaseTableViewCell : UITableViewCell

@property (nonatomic,assign) BOOL  isSepatator;

@property (nonatomic) HorizontalEdgeInsets separatorInsets;//分割线

+ (CGFloat)layoutHeightWithEntity:(TBaseModel *)entity;

@end
